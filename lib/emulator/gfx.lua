---
-- The version of the gfx part of the emulator used for unit testing. 
-- The version of the gfx part of the emulator used for unit testing. Some lines have been modified and/ or
-- excluded since the unit tests cannot handle GUI elements

local surface = require "lib.emulator.surface"

gfx = {
}

---
-- If set to true, any change to the screen immediately triggers gfx.update()
-- If set to true, any change to the screen immediately triggers gfx.update() to make
-- the change visible. The system is slowed if the screen is updated gradually but it is useful
-- for interactive development. gfx.update() is not implemented, thus the emulator behaves like 
-- gfx.set_auto_update(bool) is always set to true. 
-- @param bool boolean to toggle auto update
function gfx.set_auto_update(bool)

end

---
-- Emulates the surface data type of the Zenterio API. 
-- Emulates the surface data type of the Zenterio API. Uses the image_data data type of the Love2D game engine
-- @param width the width in pixels of the surface
-- @param height the height in pixels of the surface
function gfx.new_surface(width, height)
  local image_data = surface()
  image_data:change_size(width, height)
  return image_data
end

---
-- A function in the Zenterio API that returns the memory use
-- A function in the Zenterio API that returns the memory use. Not implemented. 
function gfx.get_memory_use()

end

-- The surface that shows up on the screen when the app is started
screen = gfx.new_surface(1280,720)

---
-- A function in the Zenterio API that returns the limit of available memory
-- A function in the Zenterio API that returns the limit of available memory. Not implemented. 
function gfx.get_memory_limit()

end

---
-- A function that is supposed to update pending changes to the screen in the Zenterio API
-- A function that is supposed to update pending changes to the screen in the Zenterio API. Not implemented. 
function gfx.update()
  return
end

---
-- Emulates the gfx.loadpng(path) function of the Zenterio API.
-- Emulates the gfx.loadpng(path) function of the Zenterio API. Uses the image_data data type of Love2D
-- and pastes the image of the specified path to it. The image_data with the selected image is returned.
-- @param path the path to the image intended for use
function gfx.loadpng(path)
  local image_data = surface()
  image_data:img(path)
  return image_data
end

--- 
-- Emulates the gfx.loadjpeg(path) function of the Zenterio API.
-- Emulates the gfx.loadjpeg(path) function of the Zenterio API. Uses the image_data data type of Love2D
-- and pastes the image of the specified path to it. The image_data with the selected image is returned.
-- @param path the path to the image intended for use
function gfx.loadjpeg(path)
  local image_data = surface()
  image_data:img(path)
  return image_data
end

return gfx
