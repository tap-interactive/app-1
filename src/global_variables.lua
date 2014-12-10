-- Global variables

glob_var = {}


--Menu
  
  --[[ The start menu positions are defined by the two variables: "setting" and "alternative"
      * Possible values for "setting":
        no_of_players, categories, mode, game_length and option_start
        
      * possible values for "alternative" when "setting" is no_of_players:
        2, 3, 4, 5, 6
        
      * possible values for "alternative" when "setting" is categories:
        all, sports
        
      * possible values for "alternative" when "setting" is mode:
        classic, fast
        
      * possible values for "alternative" when "setting" is game_length:
        5, 10, 15
        
      * possible values for "alternative" when "setting" is option_start:
        option, start
        ]]    

  no_of_players_alternatives = {[1] = 2, [2] = 3, [3] = 4, [4] = 5, [5] = 6}
  game_length_alternatives = {[1] = 5,[2] = 10,[3] = 15}
  mode_alternatives = {[1] = "classic", [2] = "Go bananas!", [3] = "expert"}
  categories_alternatives = {[1] = "all",[2] = "customized"}
     
  all_settings = {[1] = no_of_players_alternatives, [2] = game_length_alternatives, 
                  [3] = mode_alternatives,[4] = categories_alternatives} 

  set_alternatives = {[1] = 1, [2] = 1, [3] = 1, [4] = 1}
  
  
  highlighted_setting_index = 1
  highlighted_alternative_index = 1
  
-- For category menu
set_category = {[1] = false, [2] = false, [3] = false, [4] = false, [5] = false, [6] = false, [7] = false, [8] = false}
highlighted_category_index = 1
  
-- Menu GUI
no_of_players_images = {[1] = "images/menu/players_2.png", [2] = "images/menu/players_3.png", 
  [3] = "images/menu/players_4.png", [4] = "images/menu/players_5.png", [5] = "images/menu/players_6.png"}
game_length_images = {[1] = "images/menu/length_5.png",[2] = "images/menu/length_10.png",[3] = "images/menu/length_15.png"}
mode_images = {[1] = "images/menu/mode_classic.png",[2] = "images/menu/mode_bananas.png", [3] = "images/menu/mode_expert.png"}
categories_images = {[1] = "images/menu/categories_all.png",[2] = "images/menu/categories_customized.png"}
   
all_alternative_images = {[1] = no_of_players_images, [2] = game_length_images, 
                [3] = mode_images,[4] = categories_images } 



-- Sizes
window_size = {w = 1280, h = 720}
popup_box_size = {w = 915, h = 521}
game_board_height = 324
player_img_size ={} 
player_win_img_size = {w = 83, h = 83} 
track_size = {w = 0, h = 0}

--Margins and positions
goal_pos = 0;
player_margin = 0;
side_margin = 0


-- Colors
black = {r = 0, g = 0, b = 0}
white = {r = 255, g = 255, b = 255}
magenta = {r = 255, g = 0, b = 255, a = 255}
orange = {r = 255, g = 165, b = 0}
light_orange = {r = 255, g = 208, b = 122}
green = {r = 0, g = 255, b = 0}
grey = {r = 234, g = 234, b = 234}
light_grey = {r = 246, g = 246, b = 246}

--Player images
cow = {img_url = "images/game/cow.png"}
sheep = {img_url = "images/game/sheep.png"} 
cat = {img_url = "images/game/cat.png"} 
chicken = {img_url = "images/game/chicken.png"} 
pig = {img_url = "images/game/pig.png"} 
rabbit = {img_url = "images/game/rabbit.png"} 

player_images = {
                 [1] = cow,            
                 [2] = sheep,          
                 [3] = cat, 
                 [4] = chicken,
                 [5] = pig,
                 [6] = rabbit}
 
players = {}

current_player = 1

-- Game
scores_to_win = 5
current_right_answer = 0

categories_in_game = {}
questions_in_game = {}

  check_box_position = {}
  check_box_position[1] = {x = 255, y = 212} 
  check_box_position[2] = {x = 255, y = 287} 
  check_box_position[3] = {x = 255, y = 362} 
  check_box_position[4] = {x = 255, y = 437} 
  check_box_position[5] = {x = 655, y = 212} 
  check_box_position[6] = {x = 655, y = 287} 
  check_box_position[7] = {x = 655, y = 362} 
  check_box_position[8] = {x = 655, y = 437} 
