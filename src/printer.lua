---
-- The printer is used to print text on the screen. 
-- The printer is used to print text on the screen. A monospace font is used 
-- and each letter is saved as it's own image. 
-- @printer printer

text_printer = {}

-- Load and initialize the images for the upper case letters, they are mapped to variables.
local upper_a = gfx.loadpng("font/Droid25/uppercase_a.png")
upper_a:premultiply()
local upper_b = gfx.loadpng("font/Droid25/uppercase_b.png")
upper_b:premultiply()
local upper_c = gfx.loadpng("font/Droid25/uppercase_c.png")
upper_c:premultiply()
local upper_d = gfx.loadpng("font/Droid25/uppercase_d.png")
upper_d:premultiply()
local upper_e = gfx.loadpng("font/Droid25/uppercase_e.png")
upper_e:premultiply()
local upper_f = gfx.loadpng("font/Droid25/uppercase_f.png")
upper_f:premultiply()
local upper_g = gfx.loadpng("font/Droid25/uppercase_g.png")
upper_g:premultiply()
local upper_h = gfx.loadpng("font/Droid25/uppercase_h.png")
upper_h:premultiply()
local upper_i = gfx.loadpng("font/Droid25/uppercase_i.png")
upper_i:premultiply()
local upper_j = gfx.loadpng("font/Droid25/uppercase_j.png")
upper_j:premultiply()
local upper_k = gfx.loadpng("font/Droid25/uppercase_k.png")
upper_k:premultiply()
local upper_l = gfx.loadpng("font/Droid25/uppercase_l.png")
upper_l:premultiply()
local upper_m = gfx.loadpng("font/Droid25/uppercase_m.png")
upper_m:premultiply()
local upper_n = gfx.loadpng("font/Droid25/uppercase_n.png")
upper_n:premultiply()
local upper_o = gfx.loadpng("font/Droid25/uppercase_o.png")
upper_o:premultiply()
local upper_p = gfx.loadpng("font/Droid25/uppercase_p.png")
upper_p:premultiply()
local upper_q = gfx.loadpng("font/Droid25/uppercase_q.png")
upper_q:premultiply()
local upper_r = gfx.loadpng("font/Droid25/uppercase_r.png")
upper_r:premultiply()
local upper_s = gfx.loadpng("font/Droid25/uppercase_s.png")
upper_s:premultiply()
local upper_t = gfx.loadpng("font/Droid25/uppercase_t.png")
upper_t:premultiply()
local upper_u = gfx.loadpng("font/Droid25/uppercase_u.png")
upper_u:premultiply()
local upper_v = gfx.loadpng("font/Droid25/uppercase_v.png")
upper_v:premultiply()
local upper_w = gfx.loadpng("font/Droid25/uppercase_w.png")
upper_w:premultiply()
local upper_x = gfx.loadpng("font/Droid25/uppercase_x.png")
upper_x:premultiply()
local upper_y = gfx.loadpng("font/Droid25/uppercase_y.png")
upper_y:premultiply()
local upper_z = gfx.loadpng("font/Droid25/uppercase_z.png")
upper_z:premultiply()

-- Load and initialize the lower case letters, they are mapped to variables. premultiply() makes them transparent if possible. 
local a = gfx.loadpng("font/Droid25/a.png")
a:premultiply()
local b = gfx.loadpng("font/Droid25/b.png")
b:premultiply()
local c = gfx.loadpng("font/Droid25/c.png")
c:premultiply()
local d = gfx.loadpng("font/Droid25/d.png")
d:premultiply()
local e = gfx.loadpng("font/Droid25/e.png")
e:premultiply()
local f = gfx.loadpng("font/Droid25/f.png")
f:premultiply()
local g = gfx.loadpng("font/Droid25/g.png")
g:premultiply()
local h = gfx.loadpng("font/Droid25/h.png")
h:premultiply()
local i = gfx.loadpng("font/Droid25/i.png")
i:premultiply()
local j = gfx.loadpng("font/Droid25/j.png")
j:premultiply()
local k = gfx.loadpng("font/Droid25/k.png")
k:premultiply()
local l = gfx.loadpng("font/Droid25/l.png")
l:premultiply()
local m = gfx.loadpng("font/Droid25/m.png")
m:premultiply()
local n = gfx.loadpng("font/Droid25/n.png")
n:premultiply()
local o = gfx.loadpng("font/Droid25/o.png")
o:premultiply()
local p = gfx.loadpng("font/Droid25/p.png")
p:premultiply()
local q = gfx.loadpng("font/Droid25/q.png")
q:premultiply()
local r = gfx.loadpng("font/Droid25/r.png")
r:premultiply()
local s = gfx.loadpng("font/Droid25/s.png")
s:premultiply()
local t = gfx.loadpng("font/Droid25/t.png")
t:premultiply()
local u = gfx.loadpng("font/Droid25/u.png")
u:premultiply()
local v = gfx.loadpng("font/Droid25/v.png")
v:premultiply()
local w = gfx.loadpng("font/Droid25/w.png")
w:premultiply()
local x = gfx.loadpng("font/Droid25/x.png")
x:premultiply()
local y = gfx.loadpng("font/Droid25/y.png")
y:premultiply()
local z = gfx.loadpng("font/Droid25/z.png")
z:premultiply()

-- Loads and initializes the numbers and special characters 
local zero = gfx.loadpng("font/Droid25/0.png")
zero:premultiply()
local one = gfx.loadpng("font/Droid25/1.png")
one:premultiply()
local two = gfx.loadpng("font/Droid25/2.png")
two:premultiply()
local three = gfx.loadpng("font/Droid25/3.png")
three:premultiply()
local four = gfx.loadpng("font/Droid25/4.png")
four:premultiply()
local five = gfx.loadpng("font/Droid25/5.png")
five:premultiply()
local six = gfx.loadpng("font/Droid25/6.png")
six:premultiply()
local seven = gfx.loadpng("font/Droid25/7.png")
seven:premultiply()
local eight = gfx.loadpng("font/Droid25/8.png")
eight:premultiply()
local nine = gfx.loadpng("font/Droid25/9.png")
nine:premultiply()
local question_mark = gfx.loadpng("font/Droid25/63.png")
question_mark:premultiply()
local hyphen = gfx.loadpng("font/Droid25/45.png")
hyphen:premultiply()

-- A table which maps the loaded images of letters to the letters ASCII-number. 
local chr_table = {
  {id = 45, img = hyphen},
  {id = 48, img = zero},
  {id = 49, img = one},
  {id = 50, img = two},
  {id = 51, img = three},
  {id = 52, img = four}, 
  {id = 53, img = five}, 
  {id = 54, img = six},
  {id = 55, img = seven}, 
  {id = 56, img = eight},
  {id = 57, img = nine}, 
  {id = 63,img = question_mark},

  {id = 65,img = upper_a},
  {id = 66,img = upper_b},
  {id = 67,img = upper_c},
  {id = 68,img = upper_d},
  {id = 69,img = upper_e},
  {id = 70,img = upper_f},
  {id = 71,img = upper_g},
  {id = 72,img = upper_h},
  {id = 73,img = upper_i},
  {id = 74,img = upper_j},
  {id = 75,img = upper_k},
  {id = 76,img = upper_l},
  {id = 77,img = upper_m},
  {id = 78,img = upper_n},
  {id = 79,img = upper_o},
  {id = 80,img = upper_p},
  {id = 81,img = upper_q},
  {id = 82,img = upper_r},
  {id = 83,img = upper_s},
  {id = 84,img = upper_t},
  {id = 85,img = upper_u},
  {id = 86,img = upper_v},
  {id = 87,img = upper_w},
  {id = 88,img = upper_x},
  {id = 89,img = upper_y},
  {id = 90,img = upper_z},

  {id = 97,img = a},
  {id = 98,img = b},
  {id = 99,img = c},
  {id = 100,img = d},
  {id = 101,img = e},
  {id = 102,img = f},
  {id = 103,img = g},
  {id = 104,img = h},
  {id = 105,img = i},
  {id = 106,img = j},
  {id = 107,img = k},
  {id = 108,img = l},
  {id = 109,img = m},
  {id = 110,img = n},
  {id = 111,img = o},
  {id = 112,img = p},
  {id = 113,img = q},
  {id = 114,img = r},
  {id = 115,img = s},
  {id = 116,img = t},
  {id = 117,img = u},
  {id = 118,img = v},
  {id = 119,img = w},
  {id = 120,img = x},
  {id = 121,img = y},
  {id = 122,img = z},
}

-- A table containing all the fonts. The key is the font name. 
-- Each font contain data regarding the width and height of the letters. Used for the spacing between the letters. 
fonts = {Droid25 = {image_width = 18, image_height = 34}}

-- The print cursor's x-position on the text surface. text_xi = 0 is the left edge of the surface.    
local text_xi = 0
-- The print cursor's y-position on the text surface text_yi = 0 is the upper edge of the surface.
local text_yi = 0
-- The width of the text surface. Determined by the parameter max_width
local line_len = 0

---
-- A function which finds the image-URL of the ASCII-number passed to it. 
-- A function which finds the image-URL of the ASCII-number passed to it. Passes the image-variable 
-- to the fill_surface function which pastes the letter to the text surface.
-- @param chr the ASCII-number of the letter that shall be pasted to the text surface
-- @param letter_width the width of all letters for the specified font     
function get_chr_img(chr,letter_width)
  for i=1, table_functions.tablelength(chr_table) do
    if chr == chr_table[i].id then
     -- If the ASCII-character passed to the function matches an element in the chr_table the URL of 
     -- the image to the character will be passed to fill_surface()
      if((chr <= string.byte('z') and chr >= string.byte('a')) or (chr <= string.byte('Z') and chr >= string.byte('A')) or (chr <= string.byte('9') and chr >= string.byte('0')) or (chr == string.byte('?')) or (chr == string.byte('-'))) then 
           fill_surface(chr_table[i].img, text_xi, text_yi)
           text_xi = text_xi + letter_width
      end
    end
  end
end

---
-- Calculates the height of the text surface. 
-- Calculates the height of the text surface. If the text is shorter than the maximum height, the 
-- height will be adapted to be just long enough. Otherwise the maximum height will be used, excessive text will not 
-- be displayed. 
-- @param max_width the specified maximum width in pixels of the text surface
-- @param max_height the specified maximum height in pixels of the text surface 
-- @param letter_width the width in pixels of each letter in the font
-- @param letter_height the height in pixels of each letter in the font
-- @param x the x-position of the text surface's upper left corner on the screen
-- @param y the y-position of the text surface's upper left corner on the screen
-- @return temp_surface_height the calculated height of the text surface
function cal_surface_height(max_width,max_height,letter_width,letter_height,x,y)
  local temp_surface_height = 0
  local cal_height = 0
  -- calculate and set the surface height
  if (max_height > (screen:get_height() - y)) then 
    temp_surface_height =screen:get_height() - y
  else
    cal_height = (math.floor(((string.len(text) * letter_width) / max_width)) + 1) * letter_height
    if(max_height > cal_height) then
      temp_surface_height = cal_height
    else
      temp_surface_height = max_height
    end 
  end
  return temp_surface_height
end

---
-- Calculates the width of the text surface.
-- Calculates the width of the text surface. The specified maximum width, potential to improve it. 
-- @param max_width the specified maximum width of the text surface in pixels
-- @return max_width the parameter passed to the function
function cal_surface_width(max_width)
  return max_width
end

---
-- A function which initialize a table representing the destination for the copyfrom-function. 
-- A function which initialize a table representing the destination for the text_surface. Does not scale the text surface. 
-- @param x the x-position of the text surface on the screen
-- @param y the y-position of the text surface on the screen
-- @return text_surface_des_rec a table representing the position and scaling of the text surface on the screen 
function text_surface_pos_on_des(x, y)
  -- initialize the coordinates for the text surface on the screen
  local text_surface_des_rec = {
    x = x,
    y = y,
    w = text_surface:get_width(),
    h = text_surface:get_height()
  }
  return text_surface_des_rec
end

---
-- A function which initialize a table representing the source for the copyfrom-function.
-- A function which initialize a table specifying which part of the image of the letter to print to the text surface. 
-- (x, y) = (0, 0) is necessary in order to get the full letter. Otherwise the whole letter will not be used. 
-- @param x the x-position of the letter image from where the letter will be copied from
-- @param y the y-position of the letter image from where the letter will be copied from
-- @return letter_src_rec specifying which part of the letter image will be pasted to the text surface
function letter_crop_from_src(x, y)
  local letter_src_rec = {
    x = x,
    y = y,
    w = text_surface:get_width(),
    h = text_surface:get_height()
  }
  return letter_src_rec
end

---
-- A function that initialize the text surface.
-- A function that initializes the text surface and makes it transparent.  
-- @param surface_width the width of the text surface
-- @param surface_height the height of the text surface   
function surface_initialize(surface_width,surface_height)
  text_surface = gfx.new_surface(surface_width, surface_height)
  -- The text surface is made transparent
  text_surface:clear()
end

---
-- A function that pastes a given image to the text surface.
-- A function that pastes a given image to the text surface at the position specified by the x and y position.
-- @param img the URL of the letter that shall be pasted to the text surface
-- @param x the x-position of the upper left corner of the letter image on the text surface 
-- @param y the y-position of the upper left corner of the letter image on the text surface
function fill_surface(img, x, y)
  -- body
  local xi = x
  local yi = y
  local temp_src_rec = {
    x = 0,
    y = 0,
    w = img:get_width(),
    h = img:get_height()
  }
  local temp_des_rec = {
    x = xi,
    y = yi,
    w = img:get_width(),
    h = img:get_height()
  }
  text_surface:copyfrom(img, temp_src_rec, temp_des_rec, true)
end

---
-- A function that resets the text cursor to the upper left corner of the text surface.
-- A function that resets the text cursor to the upper left corner of the text surface. 
function surface_reset()
  line_len = 0
  text_xi = 0
  text_yi = 0
end

---
-- Changes the position of the text cursor to the beginning of the next line
-- Changes the position of the text cursor to the beginning of the next line 
function new_line()
  line_len = 0
  text_xi = 0
  text_yi = text_yi + letter_height
end

---
-- The function that processes the supplied text and divides it into characters. 
-- The function that processes the supplied text and divides it into characters. The characters are 
-- converted to ASCII-numbers which are then passed to the get_chr_img-function. This function also 
-- handles the format of the printed text, if the next word does not fit the rest of the line the 
-- word is printed on the next line. Words that are too long to fit a line are divided and written 
-- over two lines.
-- @param text a string containing the text to be printed on the text surface
-- @param letter_width the width of each letter in pixels
-- @param letter_height the height of each letter in pixels 
-- @param max_width the maximum width of the text surface, in pixels
-- @param max_height the maximum height of the text surface, in pixels
function parse_text_to_surface(text, letter_width, letter_height, max_width, max_height)
  local not_spanned = true
  -- identifies words in the string, characters a-z, A-z and numbers 0-9
  for word in string.gmatch(text, "%w+%??") do
    -- If the word is too long to fit the surface width
    if(string.len(word) * letter_width > max_width) then
      -- Boolean to block the last segment of the for-loop
      not_spanned = false
      for i=1, string.len(word) do
        chr = string.byte(word, i)
        if(text_xi == max_width - letter_width) then
          fill_surface(hyphen, text_xi, text_yi)
          new_line();
          get_chr_img(chr,letter_width)
        else 
          get_chr_img(chr,letter_width)
        end
        line_len = line_len + letter_width
      end
    elseif((string.len(word) * letter_width) > (max_width - line_len)) then
      new_line()
    end
    if(not_spanned) then
      for i=1, string.len(word) do
        chr = string.byte(word, i)
        get_chr_img(chr,letter_width)
        line_len = line_len + letter_width
      end
    end
    not_spanned = true
    text_xi = text_xi + letter_width
    line_len = line_len + letter_width
  end
end

---
-- Prints text on the screen.
-- Prints a given text on a transparent surface which is placed on the screen. The surface size 
-- is dependent on the length of the string as well the restrictions of allowed maximum width and
-- height. 
-- @param mixed_text a string containing the text to be printed
-- @param x the x-position of the text surface's upper left corner on the screen
-- @param y the y-position of the text surface's upper left corner on the screen
-- @param max_width the allowed width of the text surface in pixels
-- @param max_height the allowed height of the text surface in pixels
-- @param font a string with the name of the font that shall be used to print the text
function print_text(mixed_text, x, y, max_width, max_height, font)
  -- The text is temporarily converted to lower case
  text = mixed_text
  -- Save the letter width and height as variables
  letter_width = fonts[font]["image_width"]
  letter_height = fonts[font]["image_height"]
  -- set the surface height
  surface_height = cal_surface_height(max_width,max_height,letter_width,letter_height,x,y)
  -- set the surface width 
  surface_width = cal_surface_width(max_width)

  -- initialize the new surface
  surface_initialize(surface_width,surface_height)
  
  -- initialize the screen destination cordinator
  local screen_des_rec = text_surface_pos_on_des(x, y)
  -- initialize the surface source cordinator
  local surface_src_rec = letter_crop_from_src(0,0)
  -- parse the text to each character and fill in the new surface
  parse_text_to_surface(text, letter_width, letter_height, max_width, max_height)
  screen:copyfrom(text_surface,surface_src_rec,screen_des_rec,true)
  text_surface:destroy()
  surface_reset()
  gfx.update()
end