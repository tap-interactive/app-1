---
--The Main test module
--handles all tests for the main module
--@testing main_test

--[[
local info = debug.getinfo(1,'S');

getPath=function(str,sep)
  sep=sep or'/'
  return str:match("(.*"..sep..")")
end
a, b, c = os.execute("uname")
if (a == 1 or c == 1) then
  path = getPath(info.source, "\\")
  path=path:gsub("@", "")
else
  path = getPath(info.source)
  path=path:gsub("@", "")
end
]]

---
-- testing that game state is set to "menu"
-- testing that game state is set to "menu"
function TestMain: test_menu_start()
  menu_start()
  assertEquals(game_state, "menu")
  assertEquals(display_answer, false)
end


---
-- testing that game is reseted
-- testing that game is reseted
function TestMain: test_reset_game()
  reset_game()
  assertEquals(display_answer, false)
  assertEquals(#players, 0)
  assertEquals(current_player, 1)
  assertEquals(scores_to_win, 0)
  assertEquals(current_correct_answer, "")
end


---
-- testing that the game length 
-- testing that the game length is equal to the chosen game alternative
function TestMain: test_set_game_length()
  for i = 1, #game_length_alternatives, 1 do
    set_alternatives = {[1] = 1, [2] = 1, [3] = 1, [4] = i}
    assertEquals(game_length_alternatives[i], i*5)
  end
end


---
-- testing that all initial conditions for initialized players
-- creates a local variable for number_of_players to iterate through in order to check the different length, height, answer and points initialized dependent on how many players that have been selected
function TestMain: test_init_players()
 -- initializes 3 players
  no_of_players_alternatives[set_alternatives[1] ] = 3
  init_players() 
  for i = 1, 3, 1 do
        assertEquals(players[i].points, 0)
        assertEquals(players[i].img_url, player_images[i].img_url)
        assertEquals(players[i].answer, 0)
        assertEquals(players[i].place, 0)
  end
end

---
-- testing the ability to change menu setting
-- steps through the different highlighted indexes
function TestMain:test_change_setting()
  -- The menu starts on the upmost setting, index 1, and navigates upward back to the same position. 
  for i  =4, 1, -1 do  
    onKey("up","down")
    assertEquals(highlighted_setting_index,i)
  end

  -- Starts from the upmost setting and navigates downward back to the same position. 
  for i =1, 4, 1 do
    assertEquals(highlighted_setting_index,i)
    onKey("down","down")
  end
end

---
-- testing the ability to change menu alternatives
-- steps through the different highlighted indexes
function TestMain:test_change_alternative()
  for i =1, 3, 1 do
    assertEquals(highlighted_setting_index,i)
      for j =1, #all_settings[i],1 do
      assertEquals(highlighted_alternative_index, j)
      onKey("right","down")
    end
    for j=#all_settings[i], 1, -1 do
    onKey("left", "down")
    assertEquals(highlighted_alternative_index, j)
    end
    onKey("down","down")
  end
  -- testing category button this test is currently not working but should
  --onKey("ok","down")
  --onKey("ok","down")
  --onKey("exit","down")
  --assertEquals(highlighted_alternative_index, 2)
  
  --reset back to normal
  --onKey("ok","down")
  --onKey("ok","down")
  --onKey("exit","down")
  onKey("down","down")
end

---
-- checks if a point has been added
-- checks if a point has been added upon calling the add_point function for every player in the table
-- @param player_id the id of the player tested
function TestMain: test_add_point(player_id)
  local no_of_players = no_of_players_alternatives[set_alternatives[1] ]

  for i = 1, no_of_players, 1 do

    add_point(i)
    assertEquals(players[i].points, 1)

  end
end
--[[
---
-- checks if a point has been removed
-- checks if a point has been removed upon calling the remove_point function for every player in the table
-- @param player_id the of the player tested
function TestMain: test_remove_point(player_id)
  local no_of_players = no_of_players_alternatives[set_alternatives[1] ]
  
  for i = 1, no_of_players, 1 do
    remove_point(i)
    assertEquals(players[i].points, 0)
    add_point(i)
    remove_point(i)
    assertEquals(players[i].points, 0)
  end
end
]]
---
--Tests all possible inputs for pressing a button
--Tests that for a given button that we press we get the expected output
--Checks that the corresponding highlighted index also matches for where we stand in the menu
function TestMain: test_onKey()
  allStates = {"down", "repeat", "up"}
  allInputs = {"ok", "up", "down", "left", "right", "red", "green", "yellow", "blue" , "white", "info", "menu", "guide", "opt", "help", "star",
    "multi", "exit", "pause", "toggle_tv_radio", "record", "play", "stop", "fast_forward", "rewind", "skip_forward", "skip_reverse", "jump_to_end", 
    "jump_to_beginning", "toggle_pause_play", "vod", "backspace", "hash", "back", "ttx", "record_list", "play_list", "mute"}
  for j=2, 3, 1 do
    for i =1, #allInputs do
    assertEquals(onKey(allInputs[i],allStates[j]), nil)
  end
  end
  game_state = "menu"
  previousState = highlighted_alternative_index
  -- Testing button right
  onKey(allInputs[5], "down")
  assertEquals(previousState+1, highlighted_alternative_index)
  -- Testing button left
  onKey(allInputs[4], "down")
  assertEquals(previousState, highlighted_alternative_index)
  previousState = highlighted_setting_index
  -- Testing buttons up and down
  onKey(allInputs[3], "down")
  assertEquals(previousState+1, highlighted_setting_index)
  onKey(allInputs[2], "down")
  assertEquals(previousState, highlighted_setting_index)
  
  -- Testing start game button read_xml(path.."questions.xml") does not work with emulator
  --onKey(allInputs[7], "down")
  --assertEquals(game_state, "game")
  --onKey(allInputs[6], "down")
  --assertEquals(players[current_player].answer, allInputs[6])
  --onKey(allInputs[7], "down")
  --assertEquals(players[current_player].answer, allInputs[7])
  -- Testing OK button in game
  --onKey(allInputs[1], "down")
  --assertEquals(display_answer, false)
  --onKey(allInputs[8], "down")
  --assertEquals(players[current_player].answer, allInputs[8])
  --onKey(allInputs[9], "down")
  --assertEquals(players[current_player].answer, allInputs[9])  
  
  --buttons that remains to be tested are red and green  
  --left to do is buttons on cat_menu

  for i =8, #allInputs, 1 do
    assertEquals(onKey(allInputs[i],"down"), nil)
  end
end  

---
-- Testing the check win functionality
-- Initializes 6 players and tests for 1-6 winners
function TestMain:test_check_win()
  n_o_questions = 10
  -- initializes 6 players
  no_of_players_alternatives[set_alternatives[1] ] = 6
  init_players() 
  check_win()
  -- since all players score is 0, no player could have won
  assertNotEquals(game_state, "finished")
  
  for i = 1, #players do
    assertEquals(players[i].place, 0)
  end
  
  --iterates over number of players that should have reached the score to win
  for nr_of_winners = 1, 6 do
    for i = 1, nr_of_winners  do
      players[i].points = scores_to_win
    end
    check_win()
    for i = 1, nr_of_winners do
      assertEquals(players[i].place, 1)
    end
    for i = 1, #players do
      players[i].place = 0
    end
  end
end


---
--Checks to see if get_question finds the correct question.
--Will remove all but one question in the all_questions tale and check to see 
--if the function retrieves that questions and that it is in the correct format.
function TestMain: test_get_question()
--  categories_in_game = {[1] = "sport", [2] = "family", [3] = "music", [4] = "geography", [5] = "history", 
--                  [6] = "science", [7] = "movies", [8] = "miscellaneous"}
  all_questions, n_o_questions = read_xml(path.."questions.xml")
	init_categories()
  for i = #categories_in_game, 2, -1 do
    table.remove(all_questions, i)
    table.remove(categories_in_game, i)
  end
  for i = #all_questions["sport"], 2, -1 do
    table.remove(all_questions[categories_in_game[1] ], i)
  end
  expected_question = all_questions[categories_in_game[1] ][1]
  get_question()
  assertEquals(current_question["category"], expected_question["category"])
  assertEquals(current_question["text"], expected_question["text"])
  assertEquals(current_question["red"], expected_question["red"])
  assertEquals(current_question["green"], expected_question["green"])
  assertEquals(current_question["yellow"], expected_question["yellow"])
  assertEquals(current_question["blue"], expected_question["blue"])
  assertEquals(current_question["correct_answer"], expected_question["correct_answer"])
end

---
-- checks if a point has been added
-- checks if a point has been added upon calling the add_point function for every player in the table
-- @param player_id the id of the player tested 
function TestMain: test_add_point(player_id)
  local no_of_players = no_of_players_alternatives[set_alternatives[1] ]
    for i = 1, no_of_players, 1 do
      add_point(i)
      assertEquals(players[i].points, 1)
    end
 end
 
--[[
---
-- checks if a point has been removed
-- checks if a point has been removed upon calling the remove_point function for every player in the table
-- @param player_id the id of the player tested
 function TestMain: test_remove_point(player_id)
   local no_of_players = no_of_players_alternatives[set_alternatives[1] ]
    for i = 1, no_of_players, 1 do
      add_point(i)
      add_point(i)
      remove_point(i)
      assertEquals(players[i].points, 1)
    end
 end
]] 
---
--Test to see that the game can execute a turn
--Checking if the game executes in a correct way at the start of a round,
--when the first player is answering a question. The test will then check if
--it works properly  for the last player.
function TestMain: test_execute_turn()
  --Set current player to the first player'
  current_player = 1
  display_answer = false
  execute_turn()
  assertEquals(display_answer, false)
  assertEquals(current_player, 2)
  --Set current player to the last player
  current_player = 6
  execute_turn()
  assertEquals(display_answer, true)
  assertEquals(current_player, 1)
end

---
--Checks if we change the current player
--Checks if we change the current player by iterating through the max number of player
function TestMain: test_change_current_player()
  -- initializes 6 players
  no_of_players_alternatives[set_alternatives[1] ] = 6
  init_players() 
  for i = 1, 6 do
    change_current_player()
    if (i < 6) then
      assertEquals(current_player, i+1)
    else
      assertEquals(current_player, 1)
    end
  end
end

---
--Checks if we change the current player
--Checks if we change the current player by iterating through the max number of player
function TestMain: test_init_categories()
  local convert_categories = {[1] = "sport", [2] = "family", [3] = "music", [4] = "geography", [5] = "history", 
                  [6] = "science", [7] = "movies", [8] = "miscellaneous"}
  all_questions, n_o_questions = read_xml(path.."questions.xml")
  set_category = {[1] = true, [2] = false, [3] = false, [4] = false, [5] = false, [6] = false, [7] = false, [8] = false}  
  init_categories()
  assertEquals(#categories_in_game, 1)   
  assertEquals(categories_in_game[1], "sport")   
end

---
--Checks if we change the current player
--Checks if we change the current player by iterating through the max number of player
function TestMain: test_init_bananas()
  no_of_players_alternatives[set_alternatives[1] ] = 1
  init_players()
  init_bananas()
  assertTrue(1<=players[1][1][1] and players[1][1][1]<=4)
  assertTrue(5<=players[1][1][2] and players[1][1][2]<=9)
  assertTrue(11<=players[1][1][3] and players[1][1][3]<=14)
end
