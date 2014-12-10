package.path = './lib/?.lua;./?.lua;./src/?.lua;' .. package.path
-- Require test framework
local surface = require "lib.emulator.surface"
local gfx = require "lib.emulator.gfx"

require('lib.luaunit')


-- Require the tests

require ("src.global_variables")
require('src.main')
require('src.view')
require('src.xml_to_table')

-- Require the tests

TestMain = {}
  function TestMain:setUp()
    -- Set up and prepare tests here
    onStart()
    
  assertNotNil(no_of_players_alternatives)
  assertNotNil(categories_alternatives)
  assertNotNil(mode_alternatives)
  assertNotNil(game_length_alternatives)
  assertNotNil(all_settings)
  assertNotNil(set_alternatives)
  assertNotNil(highlighted_setting_index)
  assertNotNil(highlighted_alternative_index)
  

  init_players()
  all_questions, n_o_questions = read_xml("questions.xml")
end
require('test.view_test') 
require('test.main_test')
require('test.xml_to_table_test')

function TestMain:tearDown()
    -- Clean up after tests here
end

-- Run the test
os.exit( LuaUnit.run() )

