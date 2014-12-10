---
-- The part of the emulator that handles keyboard input and the onStart()-function
-- The part of the emulator that handles keyboard input and the onStart()-function. 
-- @emulator rcu

--[[
This is the RCU (Remote Control Unit) module, an eventhandler for keyboard inputs.
The keyboard inputs are translated to buttons for the Zenterio remote control. 

The rcu module also initiates the function onStart()

onStart() and onKey() needs to be defined in the files that uses the rcu module,
in order for the file to work properly.

 

If onKey() is undefined when executing a file that uses the rcu module,
an error will occur when a key on the keyboard is pressed. 
]]--

rcu = {}

---
-- An event-listener that starts the onStart() function
-- An event-listener that starts the user defined onStart() function. Runs when the application is loaded.
-- In the case of the emulator, the onStart() function needs to be defined if the RCU module is required 
-- otherwise the application crashes. 
function love.load()
  onStart()
end

-- Enables the key state repeat. "repeat" is activated if the emulator receives two concurrent 
-- "down" states for the same key
love.keyboard.setKeyRepeat(true)

-- A dictionary where the key is the key used on the keyboard and the value is the key 
-- it represents on the STB's remote control
local keyboard_to_remote = {
  [0] = "0", 
  [1] = "1", 
  [2] = "2", 
  [3] = "3", 
  [4] = "4", 
  [5] = "5", 
  [6] ="6", 
  [7] = "7", 
  [8] = "8", 
  [9] = "9", 
  n = "ok", 
  up = "up",
  down = "down", 
  left = "left", 
  right = "right", 
  r  = "red", 
  g = "green", 
  y = "yellow", 
  b = "blue" , 
  w = "white", 
  i = "info", 
  m = "menu", 
  capslock = "guide", 
  o = "opt", 
  h = "help",  
  lshift = "star", 
  ralt = "multi", 
  e = "exit", 
  p = "pause", 
  t = "toggle_tv_radio",  
  c = "record", 
  lalt = "play", 
  s = "stop", 
  f = "fast_forward", 
  tab  = "rewind", 
  l = "skip_forward", 
  u = "skip_reverse", 
  z = "jump_to_end", 
  a = "jump_to_beginning", 
  d = "toggle_pause_play", 
  v = "vod", 
  backspace = "backspace", 
  rshift = "hash", 
  x = "ttx", 
  q = "record_list", 
  k = "play_list", 
  m= "mute"
  }

---
-- Detects when a key is pressed
-- A function that detects when a key is pressed. Determines the state of the key and passes it 
-- to the user defined onKey() function. Uses the game engine Love2D to realize the function. 
-- @param key the key pressed
-- @param isrepeat boolean stating if the key has entered the 'up' state since it last was 'down' 
function love.keypressed(key, isrepeat)
  if keyboard_to_remote[key] then
    if isrepeat then
      onKey(keyboard_to_remote[key], "repeat")
    else
      onKey(keyboard_to_remote[key], "down")
    end
  end
end

---
-- Detects when a key is released
-- A function that detects when a key is released. Passes the released key to the user defined onKey() function. 
-- Uses the game engine Love2D to realize the function. 
-- @param key the key pressed
function love.keyreleased(key)
  if keyboard_to_remote[key] then
    onKey(keyboard_to_remote[key], "up")
  end
end