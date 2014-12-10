---
-- Handles view functions for the game
-- Handles all funcitonality related to displaying
-- images and surfaces on the screen.
-- @module View
view = {}

---
-- Sets the background and basic elements for the game mode view
-- Sets a light grey background for the whole screen.
-- Adds a logo in the upper right corner and a black bar at the bottom of the screen, 
-- containing an exit button. 
function view.get_background()
  screen:fill(light_grey)
  
  black_bar = gfx.new_surface(window_size.w, 60)
  black_bar:fill(black)
  screen:copyfrom(black_bar, nil, {x = 0, y = window_size.h-60}, true)
  black_bar:destroy()
  
  view.display_image("images/game/exit.png", {w = 207, h=60 }, {x = 0, y = window_size.h-60}) 
end

---
--Displays the start menu
--Displays the start menu and sets the setting alternatives to the currently chosen ones
function view.display_start_menu()
  view.display_image("images/menu/start_menu.png",window_size,{x = 0, y = 0})  
  view.update_menu_highlight(highlighted_setting_index)
  for i = 1, #set_alternatives do
    view.update_menu_settings_alternative(i, set_alternatives[i])
  end
  gfx.update()
end

---
--Highlights the current settings item in start menu
--Given the index of the current highlighted setting item
--in start menu the item is higligted with an image. 
--@param highlight_setting_index index of the current highlighted setting option in menu
function view.update_menu_highlight(highlight_setting_index)
 
  highlight_eraser = gfx.new_surface(30, 165)
  highlight_eraser:fill(grey)
  screen:copyfrom(highlight_eraser, nil, {x = 671, y = 385}, true)
  screen:copyfrom(highlight_eraser, nil, {x = 833, y = 385}, true)
  highlight_eraser:destroy()

  if highlight_setting_index == 4 then 
    view.display_image("images/menu/orange_border_menu_option.png",{w = 194, h = 58 }, {x=671, y=314+(highlight_setting_index*63)})
  else
    view.display_image("images/menu/menu_option_box_arrows.png",{w = 194, h = 58 }, {x=671, y=314+(highlight_setting_index*63)})
    view.display_image("images/menu/clear_orange_border_menu.png",{w = 194, h = 58 },{x = 671, y = 566})
  end  
end

---
--Updates the current setting item 
--Given the index of the current highlighted setting item
--in start menu and the chosen setting the item is updated 
--to display the current setting chosen.
--@param highlight_setting_index index of the current highlighted setting option in menu
--@param highlighted_alternative_index index of the current chosen alternative
function view.update_menu_settings_alternative(highlight_setting_index, highlighted_alternative_index)
   view.display_image(all_alternative_images[highlight_setting_index][highlighted_alternative_index], 
    {w=105, h=35}, {x=715, y=391+((highlight_setting_index-1)*62)})
end

---
--Displays the categories menu
--Displays a pop-up containing the categories menu and sets all the check boxes
--to fit the choices made
function view.display_cat_menu()
  view.display_image("images/menu/sprint_cat_menu.png", {w = 915 , h = 521}, 
    {x=window_size.w/2-popup_box_size.w/2, y=window_size.h/2-popup_box_size.h/2})
  view.update_all_check_boxes()
end

---
--Function that updates the displaying of all check boxes in the xategories menu
--Cleans the surface where the check boxes are displayed and then displays all check boxes. 
--The current check box is highlighted
function view.update_all_check_boxes()
  clean_boxes = gfx.new_surface(65, 290)
  clean_boxes:fill(white)
  screen:copyfrom(clean_boxes, nil, {x = 250, y = 200}, true)
  screen:copyfrom(clean_boxes, nil, {x = 650, y = 200}, true)
  clean_boxes:destroy()
  
  for i = 1, #set_category do 
    view.change_check_box(i)
  end
  
  highlight_check_box()
  gfx.update()
end

---
--Function that changes the current check box image
--Changes the current check box image to be checked or unchecked.
--Highlights the check box afterwards since it disappears under the check box image
--@param index index of the current check box
function view.change_check_box(index)
  if set_category[index] then
    img_url = "images/menu/catmenu_checked.png"
  else
    img_url = "images/menu/catmenu_unchecked.png"
  end
   view.display_image(img_url,{w = 53, h = 53}, check_box_position[index]) 
   highlight_check_box()
end

---
--Funcion that highlights the current check box in the categories menu
--Funcion that highlights the current check box in the categories menu.
function highlight_check_box()
  view.display_image("images/menu/catmenu_marked_alpha.png",{w = 53, h = 53}, 
    check_box_position[highlighted_category_index])
end


---
--Calculates player image sizes and positions 
--Calculates player image sizes and positions using the number of players and the game board size
--@param no_of_players the number of players chosen for the game
function view.set_gameboard_sizes(no_of_players)
  local adjustment = 0.9
  player_size = (game_board_height / no_of_players) * adjustment
  player_img_size = {w = player_size, h = player_size}
  player_margin = (game_board_height / no_of_players) * (1 - adjustment)
  side_margin = player_img_size.w * 0.6 + 15
  goal_pos = (window_size.w-side_margin-player_img_size.w)
end

---
--Shows the questions and corresponding answer alternatives
--Start by setting a light grey background on the upper part of the screen, 
--the function will then load a picture for the colour buttons and then 
--print text for title, question and alternatives.The bottom bar will be cleaned to 
--only contain the exit-button.
--@param this_question the question to be displayed
function view.display_question(this_question)
  screen:fill(light_grey, {x=0, y=0, width=window_size.w - 80, height=302})
  
  view.display_image("images/game/red_dot.png",{w = 58, h = 58}, {x = 116, y = 160})
  view.display_image("images/game/green_dot.png",{w = 58, h = 58}, {x = 416, y = 160})
  view.display_image("images/game/yellow_dot.png",{w = 58, h = 58}, {x = 716, y = 160})
  view.display_image("images/game/blue_dot.png",{w = 58, h = 58}, {x = 1016, y = 160})
  
  view.display_image("images/game/"..this_question["category"]..".png", {w = 576, h = 50}, {x = 24, y = 16})
  
  print_text(this_question["text"], 24, 65, 1000, 70, "Droid25")
  print_text(this_question["red"], 100 , 234, 234 , 68, "Droid25")
  print_text(this_question["green"], 400 , 234, 234, 68, "Droid25")
  print_text(this_question["yellow"], 700 , 234, 234, 68, "Droid25")
  print_text(this_question["blue"], 1000 , 234, 234, 68, "Droid25")
  
  black_bar = gfx.new_surface(461, 60)
  black_bar:fill(black)
  screen:copyfrom(black_bar, nil, {x = 819, y = window_size.h-60}, true)
  black_bar:destroy()
  
  gfx.update()
end

---
--Display the correct answer on the screen
--The area where the answer alternatives are displayed is cleaned, 
--and then only the correct answer is displayed with a green border on the color dot.
--An advertisement is displayed next to the correct answer, matching the category of the current question.
--In the bottom black bar a help text is displayed. 
--@param current_correct_answer is the the correct answer of the current question and should be shown
--@param current_category the category of the current question
function view.display_correct_answer(current_correct_answer, current_category)
  answer_eraser = gfx.new_surface(1280, 142)
  answer_eraser:fill(light_grey)
  screen:copyfrom(answer_eraser, nil, {x = 0, y = 160}, true)
  answer_eraser:destroy()
   
  print_text(current_question[current_correct_answer], 230, 180, 558, 34, "Droid25") 

  view.display_image("images/game/" .. current_correct_answer .. "_dot.png", {w = 58, h = 58}, {x = 139, y = 169})
  view.display_image("images/game/dot_border.png", {w = 76, h = 76}, {x = 130, y = 160})
  view.display_image("images/advertisement/"..current_category..".png", {w = 370, h = 165}, {x = 800, y = 135})
  view.display_image("images/game/continue.png", {w = 461 , h = 60}, {x = 819, y = window_size.h-60})
  
  gfx.update()
end

---
--Updates the game board
--Cleans the game board area and displays goal, tracks and players
--and bananas (if game mode is set to "Go bananas!")
function view.update_game_board()
  view.clean_game_board()
  view.display_goal()
  view.display_track()
  if (mode_alternatives[set_alternatives[3]] == "Go bananas!") then
    view.display_banana_peel()
  end
  view.display_numbers()
  view.display_players()
  
  gfx.update()
end

---
--Displays the players character images.
--For each player, display the corresponding character image at start.
--Calculate image y-position using image size and number of players.
function view.display_players()
  local sprint_dist = (window_size.w-side_margin-player_img_size.w)/scores_to_win
  local image_pos = {}
 
   for i = 1, #players do
    image_pos = {x=side_margin+players[i].points*sprint_dist, y=336 + (i - 1) * (player_img_size.h + player_margin)}
    view.display_image(players[i].img_url, player_img_size, image_pos)
   end
end

---
--  A function that prints the racing tracks for the players.
--  A function that prints the racing tracks for the players. It is adjusted according to the images size of the players
--  and the track belonging to the current player is highlighted by being filled with another color than the other tracks.
function view.display_track()
  local track_height = player_img_size.h * 0.80
  local track_width = goal_pos
  track = gfx.new_surface(track_width, track_height)
  track:fill(light_orange)
  for i = 1, #players do
    screen:copyfrom(track, nil, {x = 0, y = 336 + (i - 1) * (player_img_size.h + player_margin) + 0.27 * player_img_size.h}, true) 
  end  
  -- Highlight current track
  track:fill(orange)
  screen:copyfrom(track, nil, {x = 0, y = 336 + (current_player - 1) * (player_img_size.h + player_margin) + 0.27 * player_img_size.h}, true) 
  track:destroy()
end

---
--Displays numbers on the tracks
--Displays images as numbers 1-6 in the beginning of the tracks.
--The images are scaled to fit the size of the tracks, which depends on the number of players.
function view.display_numbers()
  local img_size = {w = player_img_size.w * 0.6, h = player_img_size.h * 0.6}
  for i = 1, #players do
    view.display_image("images/game/track_"..i..".png", img_size, {x = 10, y = 336 + (i - 1) * (player_img_size.h + player_margin) + 0.35 * player_img_size.h}) 
  end
end

---
-- A function that prints banana peels on the racing track.
-- Displays an image as banana peels for each player. The number of banana peels on each track
-- is calculated by dividing the scores to win by 5 and are randomly placed on the track.
function view.display_banana_peel()
  local sprint_dist = (window_size.w-side_margin-player_img_size.w)/scores_to_win
  local image_pos = {}
  local img_size = {w = player_img_size.w * 0.7, h = player_img_size.h * 0.7}
   for i = 1, #players do
    for j = 1, (scores_to_win/5) do
      image_pos = {x = side_margin + players[i][1][j]*sprint_dist, y = 336 + 0.5*player_img_size.h + (i - 1) * (player_img_size.h + player_margin)}
      view.display_image("images/game/banana_peel.png", img_size, image_pos)
    end
   end
end

---
--Display goal line 
--Displays an image as goal line 
function view.display_goal()
  view.display_image("images/game/goal_line.png", {w = 38, h = 324}, {x = goal_pos, y = 336})
end

---
--Function that cleans the game board surface
--Cleans the game board surface, e.g. the surface where the tracks and
--player charachters are displayed. The surface is filled with the same 
--a light grey color, which is used as the background color in the game mode.
function view.clean_game_board()
  clean_surface = gfx.new_surface(window_size.w, 324)
  clean_surface:fill(light_grey)
  screen:copyfrom(clean_surface, nil, {x = 0, y = 336}, true)
  clean_surface:destroy()
end


---
-- Displays the medal winners at the end of the game.
-- Shows a pop-up with character images of the player(s) that won or got 
-- the second or third place in  the game.
-- The positions of the character images is calculated according to number of winners, 
-- since there can be 1-6 players at each placement.
function view.display_win()
  screen:fill(black, {x = 0, y = window_size.h - 60, width = 1280, height = 60})
  view.display_image("images/game/winning_box.png", popup_box_size, {x=window_size.w/2-popup_box_size.w/2, y=window_size.h/2-popup_box_size.h/2})
  
  local first_place = {}
  local second_place = {}
  local third_place = {}
  
  for i = 1, #players do  
    if players[i].place == 1 then
      table.insert(first_place, players[i].img_url)
    elseif players[i].place == 2 then
      table.insert(second_place, players[i].img_url)
    elseif players[i].place == 3 then
      table.insert(third_place, players[i].img_url)
    end
  end
  
  all_places = {[1] = first_place, [2] = second_place, [3] = third_place}
  
  local start_pos = {}
  local image_pos = {}

  for i = 1, #all_places do
    if i == 1 then 
      start_pos = {x = 508, y = 186}
    elseif i == 2 then 
      start_pos = {x = 263, y = 247}
    else
      start_pos = {x = 759, y = 291}
    end

    if #all_places[i] > 0 then 
      -- Bottom middle animal
      image_pos = {x = start_pos.x + player_win_img_size.w, y = start_pos.y+player_win_img_size.h}
      view.display_image(all_places[i][1], player_win_img_size, image_pos)
      
      -- Top middle animal when 2 animals
      if #all_places[i] == 2 then
        image_pos = {x = start_pos.x + player_win_img_size.w, y = start_pos.y}
        view.display_image(all_places[i][2], player_win_img_size, image_pos)     
      end
      
      -- Bottom side animals
      if #all_places[i] > 2 then
        image_pos = {x = start_pos.x, y = start_pos.y+player_win_img_size.h}
        view.display_image(all_places[i][2], player_win_img_size, image_pos) 
        image_pos = {x = start_pos.x + 2*player_win_img_size.w, y = start_pos.y+player_win_img_size.h}
        view.display_image(all_places[i][3], player_win_img_size, image_pos)     
      end
     
      -- Top middle animal when > 3 animals
      if #all_places[i] > 3 then
        image_pos = {x = start_pos.x + player_win_img_size.w, y = start_pos.y}
        view.display_image(all_places[i][4], player_win_img_size, image_pos)    
      end

      -- Top right animal
      if #all_places[i] > 4 then
        image_pos = {x = start_pos.x + 2*player_win_img_size.w, y = start_pos.y}
        view.display_image(all_places[i][5], player_win_img_size, image_pos)     
      end
      -- Top left animal
      if #all_places[i] == 6 then 
        image_pos = {x = start_pos.x, y = start_pos.y}
        view.display_image(all_places[i][6], player_win_img_size, image_pos)  
      end    
    end 
  end
  gfx.update()
end

---
--Help function to display an image on the screen
--Help function to display an image on the screen given the image path, 
--the size of the displayed image and start position (upper left corner)
--of where to display the image. If the image dimensions is larger than the  
--the img_size param the image will be scaled to the dimensions of img_size
--@param url image path
--@param img_size size of the displayed image on the format {w=img_width, h=img_height}
--@param img_pos position on the screen where to display the image on the format {x=x_pos, y=y_pos}
function view.display_image(url, img_size, img_pos)
    image = gfx.loadpng(url)
    image:premultiply()
    screen:copyfrom(image, nil, {x =img_pos.x, y=img_pos.y, w=img_size.w, h=img_size.h}, true)
    image:destroy()  
end

 

