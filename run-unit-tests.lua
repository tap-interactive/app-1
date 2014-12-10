local info = debug.getinfo(1,'S');

getPath=function(str,sep)
    sep=sep or'/'
    return str:match("(.*"..sep..")")
end
a, b, c = os.execute("uname")
if (a == 1 or c == 1) then
  path = getPath(info.source, "\\")
  p=path:gsub("@", "")
  path = p.."?.lua;"
  
  package.path = path..package.path
  path = p.."src\\?.lua;"
  
  package.path = path..package.path
  path = p.."lib\\?.lua;"
  
  package.path = path..package.path
else
  path = getPath(info.source)
  p=path:gsub("@", "")
  path = p.."?.lua;"
  
  package.path = path..package.path
  path = p.."src/?.lua;"
  
  package.path = path..package.path
  path = p.."lib/?.lua;"
  
  package.path = path..package.path
end
 --
 -- Run this file to run unit tests on App 1
 --
 
 -- Require test framework
require('lib.luaunit')


-- Require the tests
require ("src.global_variables")
require('src.main')
require('src.view')
require('src.xml_to_table')
require('src.printer')
require('src.table_functions')


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
  end
  require('test.view_test') 
  require('test.main_test')
  require('test.xml_to_table_test')
  require("test.printer_test")

  function TestMain:tearDown()
    -- Clean up after tests here
  end

-- Run the test
os.exit( LuaUnit.run() )