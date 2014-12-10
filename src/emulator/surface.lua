---
-- Emulates the surface data type of the Zenterio API
-- Emulates the surface data type of the Zenterio API
-- @emulator surface

--[[
## surface data types ##
An area (pixmap) in graphics memory. Format is 32-bit RGBA.

color
  A Lua table of the color and alpha components, in range 0-255.
  Valid forms are

  -- Specify R, G, B. Alpha is 255 (opaque):
  {0, 0, 0}

  -- Specify R, G, B, A:
  {0, 0, 0, 0}

  -- Specify components by short name. Omitted components default to
  -- 0. At least one component must be specified:
  {r=0, g=0, b=0, a=0} 

  -- Specify components by long name. Omitted components default to
  -- 0. At least one component must be specified.
  {red=0, green=0, blue=0, alpha=0}

rectangle
  A Lua table specifying x, y, width and height
  In some cases, width and height are optional.
  Negative width or height are not allowed.
  At the moment, negative x or y are not allowed either.
  Valid forms are:
  {x=0, y=0, w=0, h=0}
  {x=0, y=0, width=0, height=0}
]]

local class = require( "emulator.classy" )

local surface = class( "surface")

---
-- The constructor of the surface data type. 
-- The constructor of the surface data type. Uses the image_data data 
-- type of the game engine Love2D
function surface:__init()
  self.image_data = nil
end

---
-- A support function used to connect image_data objects with URLs
-- A support function used to connect image_data objects with URLs
-- @param path the path to the image 
function surface:img(path)
  self.image_data = love.image.newImageData(path)
end

---
-- A support function used to change the size of a surface
-- A support function used to change the size of a surface. Uses the game engine Love2D. 
-- @param x the width of the surface in pixels
-- @param y the height of the surface in pixels
function surface:change_size(x, y)
  self.image_data = love.image.newImageData(x, y)
  return self
end

---
-- Fills the surface with a solid color, using hardware acceleration.
-- Surface transparency is replaced by the transparency value of
-- <color>.
-- Default color is {0, 0, 0, 0}, that is black and completely transparent.
-- Default rectangle is the whole surface. Parts outside the rectangle
-- are not affected.

---
-- Emulates the clear(color, rectangle) function of the Zenterio API
-- Emulates the clear(color, rectangle) function of the Zenterio API. If no parameter is sent in 
-- the emulator colors the area black.
-- @param color the rgba code for the desired color
-- @param rectangle a table containing the position of the screen and the area that should be colored. 
function surface:clear(color, rectangle)
  local c = {
    r = 0,
    g = 0, 
    b = 0,
    a = 0
  }
  
  if color ~= nil then 
    c.r = color.r or 0
    c.g = color.g or 0
    c.b = color.b or 0
    c.a = color.a or 0
  end
  
  local r = {
    x = 0,
    y = 0,
    width = self.image_data:getWidth(),
    height = self.image_data:getHeight()
  }
  
  if rectangle ~= nil then
    r.x = rectangle.x or 0
    r.y = rectangle.y or 0
    
    if r.x + rectangle.width <= r.width then
      r.width = rectangle.width 
    end
    
    if r.y + rectangle.height <= r.height then
      r.height = rectangle.height 
    end
  end
  
  local w = r.x + r.width - 1
  local h = r.y + r.height - 1
  for i=r.x, w do
    for j=r.y, h do
      self.image_data:setPixel(i,j,c.r, c.g, c.b, c.a)
    end
  end
end

---
-- Emulates the fill(color, rectangle) function of the Zenterio API
-- Emulates the fill(color, rectangle) function of the Zenterio API. If no parameter is sent in 
-- the emulator colors the area black. The same code as for clear(color, rectangle.)
-- @param color the rgba code for the desired color
-- @param rectangle a table containing the position of the screen and the area that should be colored. 
function surface:fill(color, rectangle) 
  local c = {
    r = 0,
    g = 0, 
    b = 0,
    a = 0
  }
  if color ~= nil then 
    c.r = color.r or 0
    c.g = color.g or 0
    c.b = color.b or 0
    c.a = color.a or 0
  end
  local r = {
    x = 0,
    y = 0,
    width = self.image_data:getWidth(),
    height = self.image_data:getHeight()
  }
  if rectangle ~= nil then
    r.x = rectangle.x or 0
    r.y = rectangle.y or 0
    if r.x + rectangle.width <= r.width then
      r.width = rectangle.width 
    end
    if r.y + rectangle.height <= r.height then
      r.height = rectangle.height 
    end
  end
  local w = r.x + r.width - 1
  local h = r.y + r.height - 1
  for i=r.x, w do
    for j=r.y, h do
      self.image_data:setPixel(i,j,c.r, c.g, c.b, c.a)
    end
  end
end

function surface:get()
  return self.image_data
end

---
-- Used to emulate the copyfrom()-function of the Zenterio API.
-- Used to emulate the copyfrom()-function of the Zenterio API. The commented section
-- allows transparency, but greatly decreases performance. 
-- @param src_surface the surface to be pasted on another surface
-- @param src_rect the area of the src_surface that shall be pasted 
-- @param dest_rect the area of the destination surface the source surface shall be pasted on
-- @param blend_option not taken into account in the emulator
function surface:copyfrom(src_surface, src_rect, dest_rect, blend_option)
  local dest = { 
     x = 0,  
     y = 0 
   } 
   if dest_rect ~= nil then 
     dest.x = dest_rect.x or 0 
     dest.y = dest_rect.y or 0 
   end 
  local src_rec = { 
    x = 0,  
    y = 0,  
    w = self.image_data:getWidth(), 
    h = self.image_data:getHeight() 
   }
  
  if src_rect == nil then
    src_rect ={x = 0, y = 0, w = 0, h = 0}
    src_rect.x = src_rec.x or 0
    src_rect.y = src_rec.x or 0
    src_rect.w = src_rec.w or self.image_data:getWidth()
    src_rect.h = src_rec.h or self.image_data:getHeight()
  end
  
  if dest_rect == nil then
    dest_rect.x = dest_rect.x or 0
    dest_rect.y = dest_rect.y or 0
    dest_rect.w = dest_rect.w or src_surface.image_data:getWidth()
    dest_rect.h = dest_rect.h or src_surface.image_data:getHeight()
  end

--  local canvas = love.graphics.newCanvas(self.image_data:getDimensions())
--  canvas:renderTo(function()
--  love.graphics.draw(love.graphics.newImage(self.image_data))
--  love.graphics.draw(love.graphics.newImage(src_surface.image_data),dest_rect.x,dest_rect.y)
--  end)
--  self.image_data = canvas:getImageData()
-- Use the line below to skip transparency and gain performance
  self.image_data:paste( src_surface:get(), dest.x, dest.y, src_rec.x, src_rec.y, src_rec.w, src_rec.h)
end

---
-- A support function for gfx.update(), updates the GUI. 
-- A support function for gfx.update(), updates the GUI. Uses the game engine Love2D. The surface that calls
-- the function draws itself on the screen. 
function surface:draw()
  image = love.graphics.newImage(self.image_data)
  function love.draw()
    love.graphics.draw(image)
  end
end

---
-- Returns the width of the surface in pixels
-- Returns the width of the surface in pixels. Uses the game engine Love2D. 
-- @return self.image_data:getWidth() the width of the surface in pixels 
function surface:get_width()
  return self.image_data:getWidth()
end

---
-- Returns the height of the surface in pixels
-- Returns the height of the surface in pixels. Uses the game engine Love2D. 
-- @return self.image_data:getHeight() the height of the surface in pixels
function surface:get_height()
  return self.image_data:getHeight()
end

---
-- Emulates the get_pixel(x, y)-function of the Zenterio API.
-- Emulates the get_pixel(x, y)-function of the Zenterio API. Uses the game engine
-- Love2D to realize the function. 
-- @param x the x-coordinate of the pixel
-- @param y the y-coordinate of the pixel
-- @return r, g, b, a the rgba-code of the selected pixel 
function surface:get_pixel(x, y)
  r, g, b, a = self.image_data:getPixel( x, y )
  return r, g, b, a
end

---
-- Sets the pixel at position <x>, <y> to <color>.
-- Mostly for testing, not optimized for speed
function surface:set_pixel(x, y, color)
  self.image_data:setPixel(x, y, color.r, color.g, color.b, color.a)
end

---
-- Supposed to multiply the the alpha channel into the color channels. Not implemented in the emulator.
-- Supposed to multiply the the alpha channel into the color channels. Not implemented in the emulator. 
function surface:premultiply()

end
 
---
-- Emulates the destroy()-function of the Zenterio API
-- Emulates the destroy()-function of the Zenterio API. Sets the image_data of the surface to nil.  
function surface:destroy() 
  self.image_data = nil
end

return surface
