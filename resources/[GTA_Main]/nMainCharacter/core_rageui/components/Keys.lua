---
--- @author Dylan MALANDAIN
--- @version 2.0.0
--- @since 2020
---
--- RageUI Is Advanced UI Libs in LUA for make beautiful interface like RockStar GAME.
---
---
--- Commercial Info.
--- Any use for commercial purposes is strictly prohibited and will be punished.
---
--- @see RageUI
---
---@class Keys
Keys = {};


function Keys.Register(Controls, ControlName, Description, Action)
    RegisterKeyMapping(string.format('keys-%s', ControlName), Description, "keyboard", Controls)
    RegisterCommand(string.format('keys-%s', ControlName), function()
        if (Action ~= nil) then
            Action();
        end
    end, false)
end