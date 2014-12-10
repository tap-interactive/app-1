---
-- Handles the logic functions of the game
-- Handles all functionality related to initiating 
-- and playing the game. Also handles navigating 
-- the menu.
-- @module Controller
path = "2-6062-C247"
package.path = "/mnt/"..path.."/?.lua;"..package.path
p = "/mnt/" .. path .. "/app1/"

-- Imports the emulator files necessary to run the application
gfx = require "emulator.gfx"
rcu = require "emulator.rcu"
surface = require "emulator.surface"
p = ""
-- End of emulator config -----------

table_functions = require "table_functions"
require "printer"
require "global_variables"
require "view"
require "xml_to_table"

function onStart()
  menu_start()
end

---
--Function called to set the game in menu mode
--Calls view to display the menu and sets game mode to "menu"
function menu_start()
  game_state = "menu" 
  display_answer = false
  view.display_start_menu()
end

---
--Function that resets the game 
--Resets all game variables
function reset_game()
  display_answer = false;
  players = {}
  current_player = 1
  scores_to_win = 0
  n_o_questions = 0
  questions_in_game = {}
  categories_in_game = {}
  current_correct_answer = ""
end

---
-- A function which switches the selected setting in the menu.
-- A function which switches the selected setting in the menu. The function only handles the "up" and "down" buttons, 
-- all other buttons are ignored. 
-- @param key the key pressed
function change_setting(key)
  if key == "up" then
    if highlighted_setting_index == 1 then
      highlighted_setting_index = 4
    else 
      highlighted_setting_index = highlighted_setting_index - 1
    end
    
  elseif key == "down" then 
    if highlighted_setting_index == 4 then
      highlighted_setting_index = 1
    else 
      highlighted_setting_index = highlighted_setting_index + 1
    end
  end
  highlighted_alternative_index = set_alternatives[highlighted_setting_index]
end

---
-- A function used to change the selected alternative for a given setting
-- A function used to change the selected alternative for a given setting. The function only handles the 
-- "left" and the "right" button, all other buttons ignored. 
function change_alternative(key)
  if key == "right" then
    if highlighted_alternative_index == #all_settings[highlighted_setting_index] then 
      highlighted_alternative_index = 1
    else 
      highlighted_alternative_index = highlighted_alternative_index + 1
    end
  
  elseif key == "left" then
    if highlighted_alternative_index == 1 then 
      highlighted_alternative_index = #all_settings[highlighted_setting_index]
    else 
      highlighted_alternative_index = highlighted_alternative_index - 1
    end
  end
  set_alternatives[highlighted_setting_index] = highlighted_alternative_index
end

---
-- A function which moves between the categories in the category menu.
-- A function which moves between the categories in the category menu. The function only handles the "up","down", "left" and "right" buttons, 
-- all other buttons are ignored. 
-- @param key the key pressed
function move_between_categories(key)
  if (key == "down") then
    if (highlighted_category_index ~= 8) then
      highlighted_category_index = highlighted_category_index + 1
    else
      highlighted_category_index = 1
    end
  end
  if (key == "up") then
    if (highlighted_category_index ~= 1) then
      highlighted_category_index = highlighted_category_index - 1
    else
      highlighted_category_index = 8
    end
  end
  if (key == "right") then
    if (highlighted_category_index < 5) then
      highlighted_category_index = highlighted_category_index + 4
    end
  end
  if (key == "left") then
      if (highlighted_category_index > 4) then
        highlighted_category_index = highlighted_category_index - 4
    end
  end
end

---
-- Function that checks if the all categories are selected or if they have
-- been customized.
-- Function that checks if the all categories are selected or if they have
-- been customized.
function control_categories()
  local chosen = 0
  for i = 1, #set_category do 
    if set_category[i] then 
      chosen = chosen + 1
    end
  end
  
  if chosen > 0 and chosen < 8 then
     set_alternatives[4] = 2
  else
     set_alternatives[4] = 1
  end
end

---
-- Function that selects or unselects a category
-- If the "ok" key is pressed while navigating the category menu, this function will be called. 
-- It will change the boolean value in the set_category table to the opposite, 
-- indicating that a category have been selected or unselected
function update_cat_choice()
  if set_category[highlighted_category_index] then 
    set_category[highlighted_category_index] = false
  else
    set_category[highlighted_category_index] = true
  end
end

---
-- Handles all incoming changes to the keys of the remote control.
-- Handles all incoming changes to the keys of the remote control. 
-- @param key the key which state has been changed
-- @param state which state the key is presently in
function onKey(key, state)  
  if state ~= 'down' then
    return
  end
  if game_state == "menu" then
    if (key == "left" or key == "right") and highlighted_setting_index < 4 then
      change_alternative(key)
      view.update_menu_settings_alternative(highlighted_setting_index, highlighted_alternative_index)
      gfx.update()
    end

    if key == "up" or key == "down" then
      change_setting(key)

      view.update_menu_highlight(highlighted_setting_index)
      for i = 1, #set_alternatives do
        view.update_menu_settings_alternative(i, set_alternatives[i])
      end
      gfx.update()
    end
    
    if key == "ok" and highlighted_setting_index == 4 then
      view.display_cat_menu()
      game_state = "cat_menu"
    end
    
    if key=="green" then
      game()
    end
    
    if key == "red" then 
      sys.stop()
    end

  elseif game_state == "cat_menu" then 
    if key == "right" or key=="left" or key == "up" or key == "down" then 
      move_between_categories(key)
      view.update_all_check_boxes()
    end
    if key == "ok" then
      update_cat_choice()
      view.change_check_box(highlighted_category_index)
      gfx.update()
    end
    if key == "exit" then  
      control_categories()
      menu_start() 
    end

  elseif game_state == "game" then
    if display_answer == true then 
      if key =="ok" then
        display_answer = false
        get_question()
        view.display_question(current_question)
      end
    else
        if key == "red" or key=="green" or key == "yellow" or key == "blue" then 
          players[current_player].answer = key
          execute_turn()
       end
    end
    if key == "exit" then
      reset_game()
      menu_start() 
    end   
  elseif game_state == "finished" then
    if key == "red" then
      reset_game()
      menu_start()
    elseif key == "green" then
      reset_game()
      game()
    end
  end
end

---
--Function that starts an instance of the game
--Will call for appropriate functions that are needed to play the game. 
--Starts by loading questions and setting game_state to "game". It will then
--initialize players, set a game length, initalize bananas if the game mode is "Go bananas!",
--get a question for the start of the game, get a background. Last the function calls for 
--the view functions that is needed to visualize the game board.
function game()
  game_state = "game" 
  init_players()   
  set_game_length()
  if ((mode_alternatives[set_alternatives[3]] == "Go bananas!")) then
    init_bananas()
  end
  get_question()
  view.get_background()
  view.display_question(current_question)
  view.update_game_board()

end


---
--Function that set the length of a game
--Will assign the variable scores_to_win to the game length value selected
--in the start menu. 
function set_game_length()
  scores_to_win = game_length_alternatives[set_alternatives[2]]
end

---
--Function to initiate players for a game
--The function will start by retrieving number of players from the settings
--set by the user in the start menu. It will then initialize the correct number
--of players and set appropriate data values. The image size assigned
--to a player varies depending on how many players that are going to play.
function init_players()
  local no_of_players = no_of_players_alternatives[set_alternatives[1]]
  for i = 1, no_of_players do
    players[i] = {points = 0, img_url = player_images[i].img_url, answer = 0, place = 0}
  end
 
  view.set_gameboard_sizes(no_of_players)
end

---
--Function to initiate banana peel positions for each player
--Adds random bananas to certain positions for every player in the game. 
--Only used in the "go bananas!" game mode.
function init_bananas()
  math.randomseed(os.time())
  for i = 1, no_of_players_alternatives[set_alternatives[1]] do
    local banana_position = {}
    table.insert(banana_position, math.random(1, 4))
    table.insert(banana_position, math.random(5, 9))
    table.insert(banana_position, math.random(11, 14))
    table.insert(players[i], banana_position)
  end
end

---
--Adds a point to a given player.
--Adds a point to the player given by player_id
--and calls the move player function afterwards so the positions are updated.
--@param player_id player id
function add_point(player_id)
  players[player_id].points = players[player_id].points+1
end
---
--Remove a point to a given player.
--Remove a point to the player given by player_id
--and calls the move player function afterwards so the positions are updated.
--@param player_id player id
function remove_point(player_id)
  if players[player_id].points ~= 0 and player[player_id].place == 0 then
    players[player_id].points = players[player_id].points-1
  end
end

---
--Checks if any of the players has won the game.
--Checks the score of every player to see if any of the players has
--reached the number of scores to win. If a player have received enough points,
--it is assigned a place depending on if the player is first, second or third 
--to reach the finish line. If enough players have passed the finish line, the 
--game will end.
function check_win()
  current_place = 0
  for i = 1, #players do
    if players[i].place > current_place then
      current_place = players[i].place
    end
  end

  for i = 1, #players do
    if players[i].points == scores_to_win and players[i].place == 0 then
      players[i].place = current_place + 1
      players[i].answer = "none"
    end
  end
  
  -- Finish control
  current_place = 0
  for i = 1, #players do
    if players[i].place > current_place then
      current_place = players[i].place
    end
  end
  
  players_left = 0
  for i = 1, #players do 
    if players[i].place == 0 then
      players_left = players_left + 1
    end
  end
  
  if players_left < 2 then
    for i = 1, #players do 
      if  players[i].place == 0 and current_place < 3 then 
        players[i].place = current_place + 1
      end
    end
  end
  
  if players_left < 2 or current_place == 3 then
    view.display_win()
    game_state = "finished"
  end  
  -- Finish control ends
end

---
--Updates current player.
--Updates the current player by adding 1 to the current_player variable.
--Special case if current player is the last one, then the current player is the first player.
function change_current_player()
  if (current_player < #players) then   
    current_player = current_player + 1
  else 
    current_player = 1
  end
  
  while players[current_player].place > 0 do 
    if (current_player < #players) then   
      current_player = current_player + 1
    else 
      current_player = 1
    end
  end
end

---
-- Function that prompts the user to answer a question and adds a point to the player if the answer is correct.
-- If the current player is not the last player the function calls change_current_palyer(). 
-- If current player is last player the function loops over all players and checks if the answer of that player is correct. 
-- If it is, the player gets a point. If certain conditions (game mode, current points) is met points could be removed 
-- from the player. After all the answers of all players have been checked, the function displays the right answer by
-- setting display_answer to true. Then the function runs the check_win() function.
function execute_turn()  
  for i = 1, #players do 
    if players[i].place == 0 then 
      last_player = i
    end
  end

  if (current_player == last_player) then
    view.display_correct_answer(current_correct_answer, current_category) -- something wrong with current_question["category"])
    for i = 1, #players do
      if (players[i].answer == current_correct_answer) then
        add_point(i)
      elseif ((mode_alternatives[set_alternatives[3]] == "expert") and (players[i].answer ~= current_correct_answer)) then
        remove_point(i)
      elseif ((mode_alternatives[set_alternatives[3]] == "Go bananas!") and (players[i].answer ~= current_correct_answer) and 
        ((players[i].points == players[i][1][1] ) or (players[i].points == players[i][1][2]) or(players[i].points == players[i][1][3]))) then
        remove_point(i)
      end
    end
    display_answer = true
    view.update_game_board()
    check_win()
  end 
  if game_state ~= "finished" then 
    change_current_player()
    view.update_game_board()
  end
end

---
-- Function that initiates categories.
-- Function that initiates categories by checking which categories the user selected
-- in the category menu. If a category have been selected in the start menu, it and its 
-- questions are inserted in the questions_in_game table. The categories_in_game table
-- is also updated. If a category is not selected the n_o_questions variable is decremented by 
-- number of questions that were not included.
function init_categories()
  local convert_categories = {[1] = "sport", [2] = "family", [3] = "music", [4] = "geography", [5] = "history", 
                  [6] = "science", [7] = "movies", [8] = "miscellaneous"}
  
  local chosen = 0
  for i = 1, #set_category do 
    if set_category[i] then 
      chosen = chosen + 1
    end
  end
  
  if chosen == 0 then 
    for i = 1, #set_category do 
      set_category[i] = true
    end
  end
  
  
  for i = 1, #convert_categories do
    if (set_category[i]) then
      table.insert(questions_in_game, all_questions[convert_categories[i]])
      table.insert(categories_in_game, convert_categories[i])
    else
      n_o_questions = n_o_questions - #all_questions[convert_categories[i]]
    end
  end
  
    if chosen == 0 then 
    for i = 1, #set_category do 
      set_category[i] = false
    end
  end
  
end
---
-- Function that returns a new question. 
-- Function that finds and returns a random question from the table of available questions. 
-- If there are no questions it will start by loading the questions data. Once a question is 
-- selected it is returned and removed from the table of available questions and the number of 
-- available questions is decreased by 1. If all questions in a category is used, the category 
-- is removed from the available questions table and from the categories_in_game table. 
function get_question()
  if (n_o_questions == 0 or n_o_questions == nil) then
    all_questions, n_o_questions = read_xml(p.."questions.xml")
    init_categories()
  end
  math.randomseed(os.time())
  local random_category = math.random(#categories_in_game)
  local random_question = math.random(#questions_in_game[random_category]) -- Questions in game är noll?!??!! WHYY?!?!
  current_question = table.remove(questions_in_game[random_category], random_question)
  if (#questions_in_game[random_category] == 0) then
    table.remove(categories_in_game, random_category)
    table.remove(questions_in_game, random_category) 
  end
  n_o_questions = n_o_questions - 1
  current_correct_answer = current_question["correct_answer"]
  current_category = current_question["category"]
end
