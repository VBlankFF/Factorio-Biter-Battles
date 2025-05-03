local function generate_bias_biter_sends(states)
    if states[1] == true then
        storage.active_special_games['bias_biter_sends'] = true
        storage.special_games_variables['biter_bias'] = 'Main'
    elseif states[2] == true then
        storage.active_special_games['bias_biter_sends'] = true
        storage.special_games_variables['biter_bias'] = 'Right'
    elseif states[3] == true then
        storage.active_special_games['bias_biter_sends'] = true
        storage.special_games_variables['biter_bias'] = 'Left'
    else
        storage.active_special_games['bias_biter_sends'] = false
        storage.special_games_variables['biter_bias'] = nil
    end
    game.print({storage.special_games_variables['biter_bias']})
end

local Public = {
    name = {
        type = "label",
        caption = "Bias Biter Sends",
        tooltip = "I'm testing!! Don't look yet!",
    },
    config = {
        [1] = {name = "bias_main", type = "checkbox", caption = "Main", state = false},
        [2] = {name = "bias_right", type = "checkbox", caption = "Right", state = false },
        [3] = {name = "bias_left", type = "checkbox", caption = "Left", state = false}
    },
    button = {name = "apply", type = "button", caption = "Apply"},
    generate = function (config, player)
        local states = {
            config["bias_main"].state,
            config["bias_right"].state,
            config["bias_left"].state
        }

        generate_bias_biter_sends(states)
    end,
}

return Public