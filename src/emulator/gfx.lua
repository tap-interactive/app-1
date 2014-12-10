---
-- The gfx part of the emulator for the Zenterio API 
-- The gfx part of the emulator for the Zenterio API. It is based on the game engine Love2D. Not 
-- all functions from the Zenterio API have been implemented. 
-- @emulator gfx

local surface = require "emulator.surface"

gfx = {}

---
-- Supposed to automatically use gfx.update() when screen properties are changed. 
-- Supposed to automatically use gfx.update() when screen properties are changed. Not implemented
-- in the emulator, the emulator behaves like gfx.set_auto_update(bool) is set to true at all times. 
-- @param bool not used 
function gfx.set_auto_update(bool)

end

---
-- Emulates an instance of the surface data type. 
-- Emulates an instance of the surface data type. Uses the image_data data
-- type of the game engine Love2D. 
-- @param width the width of the surface in pixels
-- @param height the height of the surface in pixels
-- @return image_data the surface with the given width and height
function gfx.new_surface(width, height)
  local image_data = surface()
  image_data:change_size(width, height)
  return image_data
end

---
-- Supposed to return the memory usage of the application. Not implemented in the emulator
-- Supposed to return the memory usage of the application. Not implemented in the emulator
function gfx.get_memory_use()

end

-- The surface that shows up on the screen when gfx.update() is called.
screen = gfx.new_surface(love.window.getDesktopDimensions())

---
-- Supposed to returns the maximum bytes of graphics memory the application is allowed to use.
-- Supposed to returns the maximum bytes of graphics memory the application is allowed to use. Not
-- implemented in the emulator. 
function gfx.get_memory_limit()

end

---
-- Makes any pending changes to the screen visible.
-- Makes any pending changes to the screen visible. 
function gfx.update()
  screen:draw()
end

---
-- Loads the PNG image at <path> into a new surface that is
-- returned. The image is always translated to 32-bit
-- RGBA. Transparency is preserved. A call to surface:premultiply()
-- might be necessary for transparency to work.
-- An error is raised if not enough graphics memory can be allocated.

---
-- Emulates the gfx.loadpng(path) function from the Zenterio API.
-- Emulates the gfx.loadpng(path) function from the Zenterio API. Uses the game 
-- engine Love2D to realize the function. 
-- @param path the path to the image intended to use
function gfx.loadpng(path)
  local image_data = surface()
  image_data:img(path)
  return image_data
end

---
-- Emulates the gfx.loadjpeg(path) function from the Zenterio API.
-- Emulates the gfx.loadjpeg(path) function from the Zenterio API. Uses the game 
-- engine Love2D to realize the function. 
-- @param path the path to the image intended to use
function gfx.loadjpeg(path)
  local image_data = surface()
  image_data:img(path)
  return image_data
end

return gfx
