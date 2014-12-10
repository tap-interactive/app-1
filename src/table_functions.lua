---
-- Used to calculate the number of elements in a table
-- Used to calculate the number of elements in a table. Used by the printer. 
-- @modules table_functions

local M = {}

---
-- Counts the elements of the table T 
-- Counts the elements of the table T, increments count for each element
-- @param T the table to calculate the number of elements on
-- @return count the number of elements in the table T
function tablelength(T)
  local count = 0
  for _ in pairs(T) do 
    count = count + 1 
  end
  return count
end


M.tablelength = tablelength

return M