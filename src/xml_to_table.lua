---
-- Handles receiving data from the xml-file
-- Handles all functionality related to loading
-- questions from a xml-file.
-- @module Model

---
--Checks if the wanted text is on the same row as the tag.
--The function takes in a line and checks if there is text any between the sign '>' and '<'. If it isn't the conclusion is that the text is on the next line. 
--@param line - one line from the XML-file that includes some tag. 
--@return false if there is nothing between the tags else return true.
function check_same_row(line)
  if(string.match(line,"%>(.-)%<")~=nil) then
    return true
  end 
  return false
end

xml_to_table = {}


---
--Finds wanted tags in a XML file and saves it to all_questions table.
--The function searches for the tags "category", "title", "text", "red", "green" , "yellow" , "blue" and "correct_answer" for every question in an xml file. 
--The text between the tags are then added to a table which are then added to a table containing all questions called "all_questions"
--@param filename a string corresponding to the name of an XML file.
--@return all_questions a table containing tables with information about every questions, such as title, answers etc.
--@return no_questions number of questions loaded 
function read_xml(filename)
  local sport = {}
  local family = {}
  local music = {}
  local geography = {}
  local history = {}
  local science = {}
  local movies = {}
  local miscellaneous = {}
  local categories = {sport = sport, family = family, music = music, geography = geography, 
                      history = history, science = science, movies = movies, miscellaneous = miscellaneous}
  local all_questions = {}
  local temp_question = {}
  local no_questions = 0
  
  -- Opens a file in read
  file = io.open(filename, "r")
  -- sets the default input file as test.lua
  io.input(file)

  s=" "
  while (string.match(s,"%<(.-)%>")~="/categories") do
    s = file:read("*l")
    
    --Parse one question
    if((string.match(s,"%<(.-)%>"))=="question") then
      while (string.match(s,"%<(.-)%>")~="/question") do
        s = file:read("*l") 
        
        --Category for question
        if((string.match(s, "%<(.-)%>"))=="category" ) then
          if(check_same_row(s)) then
            temp_question["category"] = string.match(s, "%>(.-)%<")
          else 
            s = file:read("*l")
            temp_question["category"] = s
          end
        end
        
        --Text of the question
        if((string.match(s, "%<(.-)%>"))=="text" ) then
          if(check_same_row(s)) then
            temp_question["text"]=string.match(s, "%>(.-)%<")
          else 
            s = file:read("*l")
            temp_question["text"]=s
          end
        end
        
        --Red alternative
        if((string.match(s, "%<(.-)%>"))=="red" ) then
          if(check_same_row(s)) then
            temp_question["red"]=string.match(s, "%>(.-)%<")
          else 
            s = file:read("*l")
            temp_question["red"]=s
          end
        end
        
        --Green alternative
        if((string.match(s, "%<(.-)%>"))=="green" ) then
          if(check_same_row(s)) then
            temp_question["green"]=string.match(s, "%>(.-)%<")
          else 
            s = file:read("*l")
            temp_question["green"]=s
          end
        end
        
        --Yellow alternative
        if((string.match(s, "%<(.-)%>"))=="yellow" ) then
          if(check_same_row(s)) then
            temp_question["yellow"]=string.match(s, "%>(.-)%<")
          else 
            s = file:read("*l")
            temp_question["yellow"]=s
          end
        end
        
        --Blue alternative
        if((string.match(s, "%<(.-)%>"))=="blue" ) then
          if (check_same_row(s)) then
            temp_question["blue"]=string.match(s, "%>(.-)%<")
          else 
            s = file:read("*l")
            temp_question["blue"]=s
          end
        end
        
        --Correct answer
        if((string.match(s, "%<(.-)%>"))=="correct_answer" ) then
          if check_same_row(s) then
            temp_question["correct_answer"]=string.match(s, "%>(.-)%<")
          else 
            s = file:read("*l")
            temp_question["correct_answer"]=s
          end
        end       
      end
      --Add question to table
        table.insert(categories[temp_question["category"]], {category = temp_question["category"], text = temp_question["text"], red = temp_question["red"], green = temp_question["green"], 
                      yellow = temp_question["yellow"], blue = temp_question["blue"], correct_answer = temp_question["correct_answer"]})
        no_questions = no_questions +1  
           
    end
  end
  --add categories to all_questions table
  all_questions = {sport = sport, family = family, music = music, geography = geography,history = history, 
                    science = science, movies = movies, miscellaneous = miscellaneous}
  -- closes the open file
  io.close(file)
   
  return all_questions, no_questions
end
