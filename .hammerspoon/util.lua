utilMenu = hs.menubar.new()

local icon = [[
1 . . . . . . . . . . . 3
. # # . . . . . . . # # .
. # # # # . . . # # # # .
. . # # # # 2 # # # # . .
. . # # # # # # # # # . .
. . . # # # # # # # . . .
. . . 8 # # # # # 4 . . .
. . . # # # # # # # . . .
. . # # # # # # # # # . .
. . # # # # 6 # # # # . .
. # # # # . . . # # # # .
. # # . . . . . . . # # .
7 . . . . . . . . . . . 5
]]

utilMenu:setIcon('ASCII:' .. icon)

local menu = nil

local reloadMenu = function() utilMenu:setMenu(menu) end

menu = {
  {
    title = "Caffeinate",
    checked = false,
    fn = function(modifiers, menuItem)
      local enabled = hs.caffeinate.toggle('displayIdle')
      if enabled then
        hs.notify.new({title='Caffeinate', informativeText='Caffeinate on'}):send()
      else
        hs.notify.new({title='Caffeinate', informativeText='Caffeinate off'}):send()
      end

      menuItem.checked = enabled
      reloadMenu()
    end
  },
  {
    title = "-" -- separator
  },
  {
    title = "Open Config",
    fn = function()
        hs.notify.new({title='Config', informativeText='Opened Config files for hammerspoon.'}):send()
            hs.execute("open ~/.hammerspoon/init.lua");
    end
  },
  {
    title = "Reload Config",
    fn = function()
        hs.notify.new({title='Config', informativeText='Reloaded Config'}):send()
            hs.reload()
    end
  }
}

reloadMenu()
