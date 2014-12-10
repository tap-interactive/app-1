function TestMain: test_cal_surface_height()
  max_width = 300
  max_height = 400
  letter_width = 10
  letter_height = 20
  x = 0
  y = 0 
  print_text("This is a string of 33 characters", x, y, max_width, max_height, "Droid25")
  assertEquals(cal_surface_height(max_width, max_height, letter_width, letter_height, x, y), 68)
  
  x = 0
  y = 700
  print_text("This is a string of 33 characters", x, y, max_width, max_height, "Droid25")
  assertEquals(cal_surface_height(max_width, max_height, letter_width, letter_height, x, y), 20)
end

function TestMain: test_cal_surface_width()
  local max_width = 100
  assertEquals(cal_surface_width(max_width), max_width)
end

function TestMain: test_text_surface_pos_on_des()
  x = 0
  y = 0
  assertNotNil(text_surface_pos_on_des(x, y))
end

function TestMain: test_letter_crop_from_src()
  x = 0
  y = 0
  assertNotNil(letter_crop_from_src(x, y))
end

--[[
function TestMain: test_variables_tables()
  -- Cannot perform tests on variables dependent on the emulator. In this case gfx.loadpng()
  -- Have been tested manually
end

function TestMain: test_get_chr_img()
  -- Cannot perform tests on variables dependent on the emulator. In this case gfx.loadpng()
  -- Have been tested manually
end

function TestMain: test_surface_initialize()
  -- Cannot perform test on functions dependent on the emulator. In this case gfx.new_surface()
  -- Have been tested manually
end

function TestMain: test_fill_surface()
  -- Cannot perform test on functions dependent on the emulator. In this case a variable dependent on gfx.loadpng()
  -- and the copyfrom() function
  -- Have been tested manually
end

function TestMain: test_parse_text_to_surface()
  -- Dependent on functions that uses the graphics functions
  -- Have been tested manually
end
]]

function TestMain: test_surface_reset()
  assertNil(surface_reset())
end

function TestMain: test_new_line()
  assertNil(new_line())
end