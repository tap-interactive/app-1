---
-- The version of the surface part of the emulator used for unit testing. 
-- The version of the surface part of the emulator used for unit testing. Some lines have been modified and/ or
-- excluded since the unit tests cannot handle GUI elements

local class = require( "lib.emulator.classy" )

local surface = class( "surface")

---
-- The constructor of surface objects. 
-- The constructor of surface objects. Only used internally in the emulator. Utilizes classy.lua.  
function surface:__init()
  self.image_data = nil
end

---
-- A help function for the gfx.loadpng(path) and gfx.loadjpeg(path).
-- A help function for the gfx.loadpng(path) and gfx.loadjpeg(path). Does not load the specified path, 
-- in order to get the unit tests to work properly. 
-- @param path not used in the function
function surface:img(path)
  self.image_data = ""
end

--- 
-- Original function changes the size of the surface to the specified values, this version does not. 
-- Original function changes the size of the surface to the specified values, this version does not. 
-- @param x not used 
-- @param y not used 
function surface:change_size(x, y)
  return self
end

---
-- Function exists in order for the unit tests to run properly. 
-- Function exists in order for the unit tests to run properly. Does not perform any computations. 
-- @color not used 
-- @rectangle not used
function surface:clear(color, rectangle)
  return
end

---
-- Function exists in order for the unit tests to run properly. 
-- Function exists in order for the unit tests to run properly. Does not perform any computations. 
-- @color not used 
-- @rectangle not used
function surface:fill(color, rectangle) --(color, [rectangle])
  return
end

--[[
  Copy pixels from one surface to another, using hardware
  acceleration. Parts or all of <src_surface> can be copied.

  Scaling is done if dest_rectangle is of different size than
  src_rectangle. Areas outside of source or destination surfaces are
  (will be) clipped.

  If <src_rectangle> is nil, the whole <src_surface> is used.

  If <dest_rectangle> is nil or omitted, x=0, y=0 are assumed and
  width and height are taken from <src_rectangle>. If <dest_rectangle>
  doesn't specify width or height, these values are also taken from
  <src_rectangle>.

  If <blend_option> is true, copying is blended using the alpha
  information in <src_surface>. If false, the alpha channel is
  replaced by the values in <src_surface>.
  Default is false.
  //Not finished and not tested
]]

function surface:get()
  return self.image_data
end

---
-- Function exists in order for the unit tests to run properly. 
-- Function exists in order for the unit tests to run properly. Does not perform any computations. 
-- @src_surface not used 
-- @src_rectangle not used
-- @dest_rectangle not used
-- @blend_option not used 
function surface:copyfrom(src_surface, src_rectangle, dest_rectangle, blend_option)
  return
end

---
-- Original function updates the GUI of the emulator. This function does not have any functionality
-- Original function updates the GUI of the emulator. This function does not have any functionality
function surface:draw()
  return
end

---
-- Original version returns the width of a surface. Test version cannot use Love2D, therefore the width of the screen is returned. 
-- Original version returns the width of a surface. Test version cannot use Love2D, therefore the width of the screen is returned. 
function surface:get_width()
  return 1280
end

---
-- Original version returns the height of a surface. Test version cannot use Love2D, therefore the width of the screen is returned. 
-- Original version returns the height of a surface. Test version cannot use Love2D, therefore the width of the screen is returned. 
function surface:get_height()
  return 720
end

---
-- Original function is supposed to return the RGBA code for the specified pixel.  
-- Original function is supposed to return the RGBA code for the specified pixel. Not implemented in 
-- the testing version of the emulator. 
-- @param x not used
-- @param y not used
function surface:get_pixel(x, y)
  return
end

--[[
  Sets the pixel at position <x>, <y> to <color>.
  Mostly for testing, not optimized for speed
]]
---
-- Supposed to set the pixel at position (x,y) to the RGBA value of color. The unit test version does not. 
-- Supposed to set the pixel at position (x,y) to the RGBA value of color. The unit test version does not. 
-- @param x not used
-- @param y not used 
-- @param color not used 
function surface:set_pixel(x, y, color)
  return
end

---
-- Function exists in order for the unit tests to run properly. 
-- Function exists in order for the unit tests to run properly. Does not perform any computations. 
function surface:premultiply()

end

---
-- Function exists in order for the unit tests to run properly. 
-- Function exists in order for the unit tests to run properly. Does not perform any computations. 
function surface:destroy() 
  return
end

return surface
