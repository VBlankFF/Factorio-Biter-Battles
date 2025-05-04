local function generate_bias_biter_sends(states)
    if states[1] == true then
        storage.active_special_games['bias_biter_sends'] = true
        storage.special_games_variables['biter_targets'] = {}
    else
        storage.active_special_games['bias_biter_sends'] = false
        storage.special_games_variables['biter_targets'] = {}
    end
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
            table.insert(positions_table, { tag = tag, position = tag.position })
            if event.player_index then
                event.force.print(game.connected_players[event.player_index].name ..
                " has added a tag at [gps=" .. tag.position.x .. "," .. tag.position.y .. "," .. tag.surface.name .. "]")
            end
        elseif tag.position.y > 0 and force == "north" then
            table.insert(positions_table, { tag = tag, position = tag.position })
            if event.player_index then
                event.force.print(game.connected_players[event.player_index].name ..
                " has added a tag at [gps=" .. tag.position.x .. "," .. tag.position.y .. "," .. tag.surface.name .. "]")
            end
        end
    end
end

local function player_modified_tag(event)
    if not storage.active_special_games['bias_biter_sends'] then
        return
    end
    local tag = event.tag
    for i, v in pairs(storage.special_games_variables['biter_targets']) do
        if v.tag == tag and v.tag.valid then
            v.position = tag.position
            if event.player_index and (event.old_position.x ~= tag.position.x or event.old_position.y ~= tag.position.y) then
                event.force.print(game.connected_players[event.player_index].name ..
                    " has moved a tag from [gps=" ..
                    event.old_position.x ..
                    "," ..
                    event.old_position.y ..
                    "," ..
                    tag.surface.name ..
                    "] to [gps=" .. tag.position.x .. "," .. tag.position.y .. "," .. tag.surface.name .. "]")
            end
            return
        end
    end
end

local function player_removed_tag(event)
    if not storage.active_special_games['bias_biter_sends'] then
        return
    end
    local tag = event.tag
    for i, v in pairs(storage.special_games_variables['biter_targets']) do
        if v.tag == tag and v.tag.valid then
            table.remove(storage.special_games_variables['biter_targets'], i)
            if event.player_index then
                event.force.print(game.connected_players[event.player_index].name ..
                " has removed a tag from [gps=" .. tag.position.x .. "," .. tag.position.y .. "," .. tag.surface.name .. "]")
            end
            return
        end
    end
end

script.on_event(defines.events.on_chart_tag_added, player_added_tag)
script.on_event(defines.events.on_chart_tag_modified, player_modified_tag)
script.on_event(defines.events.on_chart_tag_removed, player_removed_tag)

local Public = {
    name = {
        type = "label",
        caption = "Biter Targeting",
        tooltip = "Biters will target map tags placed on the opponent's side of the map",
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