local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

local config = wezterm.config_builder()

config.term = "xterm-256color"

config.default_prog = { 'powershell' }

local direction_keys = {
    h = "Left",
    j = "Down",
    k = "Up",
    l = "Right",
}

local function split_nav(key)
    return {
        key = key,
        mods = "CTRL",
        action = wezterm.action_callback(function(win, pane)
            if pane:Get_users_vars().IS_NVIM == "true" then
                -- pass the keys through to vim/nvim
                win:perform_action({
                    SendKey = { key = key, mods = "CTRL" },
                }, pane)
            else
                win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
            end
        end),
    }
end

config.font_size = 16

config.window_decorations = "RESIZE"

config.window_padding = {
    top = 10,
    bottom = 10,
    left = 10,
    right = 10,
}

config.leader = { key = "Space", mods = "SHIFT", timeout_milliseconds = 2000 }

local action = wezterm.action

config.keys = {
    {
        key = "\\",
        mods = "LEADER",
        action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    split_nav("h"),
    split_nav("j"),
    split_nav("k"),
    split_nav("l"),
    {
        key = "h",
        mods = "CTRL|SHIFT",
        action = action.AdjustPaneSize({ "Left", 5 }),
    },
    {
        key = "l",
        mods = "CTRL|SHIFT",
        action = action.AdjustPaneSize({ "Right", 5 }),
    },
    {
        key = "j",
        mods = "CTRL|SHIFT",
        action = action.AdjustPaneSize({ "Down", 5 }),
    },
    {
        key = "k",
        mods = "CTRL|SHIFT",
        action = action.AdjustPaneSize({ "Up", 5 }),
    },
    {
        key = "-",
        mods = "LEADER",
        action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
        key = "m",
        mods = "LEADER",
        action = action.TogglePaneZoomState,
    },
    { key = "[", mods = "LEADER", action = action.ActivateCopyMode },
    {
        key = "c",
        mods = "LEADER",
        action = action.SpawnTab("CurrentPaneDomain"),
    },

    {
        key = "p",
        mods = "LEADER",
        action = action.ActivateTabRelative(-1),
    },
    {
        key = "n",
        mods = "LEADER",
        action = action.ActivateTabRelative(1),
    },
}

for i = 1, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "LEADER",
        action = action.ActivateTab(i - 1),
    })
end

return config

