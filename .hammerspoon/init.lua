hyper = {"ctrl","alt"}
hyper_s = {"ctrl","alt","shift"}
hyper_c = {"ctrl","alt","command"}
hyper_a = {"ctrl","command"}
karabiner_hyper = {"command","ctrl","shift","alt"}

require('window')
require('util')

hs.window.animationDuration = 0
hs.window.setShadows(false)


hs.timer.doAt("0:00","1h", function() hs.alert("Ding Dong") end)

-------------------------
--  open app or focus  --
-------------------------


hs.fnutils.each({
        { key = "i", app = "Alacritty"},
        { key = "v", app = "MacVim"},
        { key = "l", app = "Skim"},
        { key = "s", app = "Safari"},
        { key = "t", app = "Todoist"},
        { key = "m", app = "Edison Mail"},
        { key = "r", app = "Preview"},
        { key = "x", app = "Xcode"},
},function(object)
        hs.hotkey.bind(karabiner_hyper, object.key,
        function()
                local app = hs.application.get(object.app)
                if app then
                        if not app:mainWindow() then
                                app:selectMenuItem({object.app, "New OS window"})
                        elseif app:isFrontmost() then
                                app:hide()
                        else
                                app:activate()
                        end
                else
                        hs.application.launchOrFocus(object.app)
                end
        end)
end)
