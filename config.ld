-- Configuration file for LDoc documentation generation
project='TAP interactive - App 1'
title='TAP interactive - App 1'
description='Quiz game application for LuaEngine'
file={
	'src/main.lua',
  	'src/view.lua',
  	'src/xml_to_table.lua',
	'src/printer.lua',
	'src/table_functions.lua',
	'src/emulator/gfx.lua',
	'src/emulator/rcu.lua',
	'src/emulator/surface.lua',
	'src/emulator/cron.lua',
	'src/emulator/classy.lua',
	'test/main_test.lua',
	'test/view_test.lua',
	'src/conf.lua',
	new_type("emulator","Emulator",true),
	new_type("printer","Printer",true),
	new_type("testing","Testing",true)
}
