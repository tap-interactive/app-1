local info = debug.getinfo(1,'S');

getPath=function(str,sep)
  sep=sep or'/'
  return str:match("(.*"..sep..")")
end
a, b, c = os.execute("uname")
if (a == 1 or c == 1) then
  path = getPath(info.source, "\\")
  path=path:gsub("@", "")
else
  path = getPath(info.source)
  path=path:gsub("@", "")
end
--- <Name of function>
-- <What is tested>
-- @param <inparam>
-- @return <outparam>
function TestMain:test_check_same_row()
  
end

---Checks to see if the function saves data from an XML file in a table
--The test will call for the read_xml() function and check if the table
--consists of the correct elements.
-- @param <filename>
-- @return <all_questions, no_questions>
function TestMain:test_read_xml()
  convert_categories = {[1] = "sport", [2] = "family", [3] = "music", [4] = "geography", [5] = "history", 
                  [6] = "science", [7] = "movies", [8] = "miscellaneous"}
  all_questions, n_o_questions = read_xml(path.."questions.xml")
  assertEquals(n_o_questions,80)
  assertEquals(convert_categories[1], "sport")
  assertEquals(convert_categories[2], "family")
  assertEquals(convert_categories[3], "music")
  assertEquals(convert_categories[4], "geography")
  assertEquals(convert_categories[5], "history")
  assertEquals(convert_categories[6], "science")
  assertEquals(convert_categories[7], "movies")
  assertEquals(convert_categories[8], "miscellaneous") 
  assertEquals(all_questions[convert_categories[1]][1]["category"],"sport")
  assertEquals(all_questions[convert_categories[1]][1]["text"],"Who held the world record for mens 100m in 2010?")
  assertEquals(all_questions[convert_categories[1]][1]["red"],"Usain Bolt" )
  assertEquals(all_questions[convert_categories[1]][1]["green"],"Asafa Powell")
  assertEquals(all_questions[convert_categories[1]][1]["yellow"],"Tyson Gay")
  assertEquals(all_questions[convert_categories[1]][1]["blue"],"Ben Johnson")
  assertEquals(all_questions[convert_categories[1]][1]["correct_answer"],"red")
end
