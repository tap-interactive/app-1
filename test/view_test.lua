---
--The View test module
--Tests all view functions
--@testing view_test

--- 
-- Tests if the get_background() function is executed without interruption
-- Tests if the get_background() function is executed without interruption
function TestMain:test_background()
  assertNil(view.get_background())
end

--- 
-- Tests if the display_start_menu() function is executed without interruption
-- Tests if the display_start_menu() function is executed without interruption
function TestMain:test_display_start_menu()
  assertNil(view.display_start_menu())
end

--- 
-- Tests if the update_menu_highlight() function is executed without interruption
-- Tests if the update_menu_highlight() function is executed without interruption
function TestMain:test_update_menu_highlight()
  assertNil(view.update_menu_highlight(1))
end


--- 
-- Tests if the update_menu_settings_alternative() function is executed without interruption
-- Tests if the update_menu_settings_alternative() function is executed without interruption
function TestMain:test_update_menu_settings_alternative()
  assertNil(view.update_menu_settings_alternative(1, 1))
end

--- 
-- Tests if the set_gameboard_sizes() function is executed without interruption
-- Tests if the set_gameboard_sizes() function is executed without interruption
function TestMain:test_set_gameboard_sizes()
  assertNil(view.set_gameboard_sizes(6))
end

--- 
-- Tests if the display_correct_answer() function is executed without interruption
-- Tests if the display_correct_answer() function is executed without interruption
function TestMain:test_display_question()
  question = {category = "a"; text = "a"; red = "a"; green = "a"; yellow = "a"; blue = "a"}
  assertNil(view.display_question(question))
end
 
--- 
-- Tests if the display_correct_answer() function is executed without interruption
-- Tests if the display_correct_answer() function is executed without interruption
function TestMain:test_display_correct_answer()
  current_question = {title = "a"; text = "a"; red = "a"; green = "a"; yellow = "a"; blue = "a"}
  current_correct_answer = "green"
  current_category = ""
  assertNil(view.display_correct_answer(current_correct_answer,current_category))
end

--- 
-- Tests if the update_game_board function is executed without interruption
-- Tests if the update_game_board function is executed without interruption
function TestMain:test_update_game_board()
  assertNil(view.update_game_board())
end

--- 
-- Tests if the display_players() function is executed without interruption
-- Tests if the display_players() function is executed without interruption
function TestMain:test_display_players()
  assertNil(view.display_players())
end

--- 
-- Tests if the display_track() function is executed without interruption
-- Tests if the display_track() function is executed without interruption
function TestMain:test_display_track()
  assertNil(view.display_track())
end

--- 
-- Tests if the display_goal() function is executed without interruption
-- Tests if the display_goal() function is executed without interruption 
function TestMain:test_display_goal()
  assertNil(view.display_goal())
end

--- 
-- Tests if the clean_game_board function is executed without interruption
-- Tests if the clean_game_board function is executed without interruption
function TestMain:test_clean_game_board()
  assertNil(view.clean_game_board())
end

--- test_display_win()
-- checks view for display_win
-- checks view for display_win
function TestMain:test_display_win()
  assertNil(view.display_win())
end

--- test_display_image()
-- checks that the size corresponds to the loaded image
-- checks that the size corresponds to the loaded image
function TestMain:test_display_image()
  assertNil(view.display_image("images/game/cat.png", {w = 100, h = 100}, {x = 0, y = 0}))
end
