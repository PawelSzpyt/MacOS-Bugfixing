hs.ipc.cliInstall()

-- Remap Ctrl+A to Cmd+A (Select all)
hs.hotkey.bind({"ctrl"}, "a", nil, function()
    hs.eventtap.keyStroke({"cmd"}, "a")
end)

-- Remap Ctrl+Z to Cmd+Z (Revert)
hs.hotkey.bind({"ctrl"}, "z", nil, function()
    hs.eventtap.keyStroke({"cmd"}, "z")
end)

-- Remap Ctrl+Y to Cmd+Shift+Z (Redo)
hs.hotkey.bind({"ctrl"}, "y", nil, function()
    hs.eventtap.keyStroke({"cmd", "shift"}, "z")
end)

-- Remap Ctrl+S to Cmd+S (Save)
hs.hotkey.bind({"ctrl"}, "s", nil, function()
    hs.eventtap.keyStroke({"cmd"}, "s")
end)

-- Remap Ctrl+L to Cmd+L (Browser Path edit)
hs.hotkey.bind({"ctrl"}, "l", nil, function()
    hs.eventtap.keyStroke({"cmd"}, "l")
end)

-- Remap Ctrl+F to Cmd+F (Find)
hs.hotkey.bind({"ctrl"}, "f", nil, function()
    hs.eventtap.keyStroke({"cmd"}, "f")
end)

-- Remap Ctrl+T to Cmd+T (New tab)
hs.hotkey.bind({"ctrl"}, "t", nil, function()
    hs.eventtap.keyStroke({"cmd"}, "t")
end)

-- Remap Ctrl+W to Cmd+W (Close tab)
hs.hotkey.bind({"ctrl"}, "w", nil, function()
    hs.eventtap.keyStroke({"cmd"}, "w")
end)

-- Remap Ctrl+V to Cmd+V (Paste)
hs.hotkey.bind({"ctrl"}, "v", nil, function()
    hs.eventtap.keyStroke({"cmd"}, "v")
end)

-- Handling copy / paste differently in terminal and everywhere else
-- Remap Ctrl+C to Cmd+C (Copy)
local cp = hs.hotkey.bind({"ctrl"}, "c", nil, function()
    hs.eventtap.keyStroke({"cmd"}, "c")
end)

local cp_terminal = hs.hotkey.bind({"ctrl", "shift"}, "c", nil, function()
    hs.eventtap.keyStroke({"cmd"}, "c")
end)

local paste_terminal = hs.hotkey.bind({"ctrl", "shift"}, "v", nil, function()
    hs.eventtap.keyStroke({"cmd"}, "v")
end)

local cut = hs.hotkey.bind({"ctrl"}, "x", nil, function()
    hs.eventtap.keyStroke({"cmd"}, "x")
end)

-- Handling different shortcuts for Terminal app
local function applicationWatcher(appName, eventType, appObject)
    if appName == "Terminal" then
        if eventType == hs.application.watcher.activated then
            --hs.alert.show("Terminal Activated")--debugging
            cp:disable()
            cut:disable()
            cp_terminal:enable()
            paste_terminal:enable()
        elseif eventType == hs.application.watcher.deactivated then
            --hs.alert.show("Terminal Deactivated")--debugging
            cp:enable()
            cut:enable()
            cp_terminal:disable()
            paste_terminal:disable()
        end
    end
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()


-- Window Management - moving windows around the screen using keyboard
hs.loadSpoon("SpoonInstall")

Install=spoon.SpoonInstall
Install.repos["Spoons"] = {
  desc = "spoon repository",
  url = "https://github.com/Hammerspoon/Spoons/tree/master/Spoons"
}

Install:andUse("WindowHalfsAndThirds",
               {
                 config = {
                   use_frame_correctness = true
                 },
                 hotkeys = 'default',
                 logLevel = 'debug'
               }
)

hs.loadSpoon("WindowHalfsAndThirds")
spoon.WindowHalfsAndThirds:bindHotkeys( {
    right_half  = { {        "cmd"}, "Right" },
    left_half   = { {        "cmd"}, "Left" },
    top_half    = { {        "cmd"}, "Up" },
    bottom_half = { {        "cmd"}, "Down" },
    third_left  = { { "ctrl", "cmd"}, "Left" },
    third_right = { { "ctrl", "cmd"}, "Right" },
    third_up    = { { "ctrl", "cmd"}, "Up" },
    third_down  = { { "ctrl", "cmd"}, "Down" },
    top_left    = { {        "cmd"}, "1" },
    top_right   = { {        "cmd"}, "2" },
    bottom_left = { {        "cmd"}, "3" },
    bottom_right= { {        "cmd"}, "4" },
    max_toggle  = { { "ctrl", "cmd"}, "f" },
    max         = { {        "cmd"}, "Up" },
    undo        = { {        "ctrl", "cmd"}, "z" },
    center      = { { "ctrl", "cmd"}, "c" },
    larger      = { {        "ctrl", "cmd", "shift"}, "Right" },
    smaller     = { {        "ctrl", "cmd", "shift"}, "Left" },
 })

-- Initialize window switcher
local switcher = hs.window.switcher.new(hs.window.filter.new():setDefaultFilter{}, {
    showTitles = true,  -- Display window titles
    thumbnailSize = 128, -- Thumbnail size
    showThumbnails = false, -- Show thumbnails
    backgroundColor = {0, 0, 0, 0.8}, -- Background color
    highlightColor = {0.8, 0.8, 0, 0.8}, -- Highlight color
    titleBackgroundColor = {0, 0, 0, 0.8}, -- Title background color
    titleTextColor = {1, 1, 1, 1}, -- Title text color
    titleHeight = 10, -- Title area height
    fontSize = 14, -- Font size for window titles
    showSelectedThumbnail = false, -- Show a larger thumbnail for the selected window
    showSelectedTitle = true -- Show the title for the selected window
})

-- Bind Alt+Tab and Alt+Shift+Tab for window switching
hs.hotkey.bind({"alt"}, "Tab", function()
    switcher:next()
end)

hs.hotkey.bind({"alt", "shift"}, "Tab", function()
    switcher:previous()
end)
