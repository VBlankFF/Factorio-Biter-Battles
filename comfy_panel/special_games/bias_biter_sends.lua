local function generate_bias_biter_sends(states)
    if states[1] == true then
        storage.active_special_games['bias_biter_sends'] = true
        storage.special_games_variables['biter_targets'] = {}
    else
        storage.active_special_games['bias_biter_sends'] = false
        storage.special_games_variables['biter_targets'] = {}
    end
    game.print({"yippie"})
end

local function player_added_tag(event)
    if not storage.active_special_games['bias_biter_sends'] then
        return
    end
    local tag = event.tag
    local force = tag.force.name
    local positions_table = storage.special_games_variables['biter_targets']
    if tag.valid then
        if tag.position.y < 0 and force == "south" then
            table.insert(positions_table, { position = tag.position })
        elseif tag.position.y > 0 and force == "north" then
            table.insert(positions_table, { position = tag.position })
        end
    end
end

script.on_event(defines.events.on_chart_tag_added, player_added_tag)

local Public = {
    name = {
        type = "label",
        caption = "Bias Biter Sends",
        tooltip = "I'm testing!! Don't look yet!",
    },
    config = {
        [1] = {name = "enable", type = "checkbox", caption = "Enable", state = false},
    },
    button = {name = "apply", type = "button", caption = "Apply"},
    generate = function (config, player)
        local states = {
            config["enable"].state
        }

        generate_bias_biter_sends(states)
    end,
}

return Public