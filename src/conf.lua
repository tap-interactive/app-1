---
-- The config file for the emulator. 
-- The config file for the emulator. Sets the screen resolution to 720p
-- @emulator config

---
-- Adjusts the window size for the emulator. 
-- Adjusts the window size of the emulator. 
-- @param t delta time the frequency by which the function is run. 
function love.conf(t)
    t.window.width = 1280 -- t.screen.width in 0.8.0 and earlier
    t.window.height = 720 -- t.screen.height in 0.8.0 and earlier
end
