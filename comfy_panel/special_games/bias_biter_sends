local Public = {
    name = {
        type = "label",
        caption = "Bias Biter Sends",
        tooltip = "I'm testing!! Don't look yet!",
    },
    config = {
        [1] = {name = "bias_random", type = "checkbox", caption = "Random", state = true},
        [2] = {name = "bias_main", type = "checkbox", caption = "Main", state = false},
        [3] = {name = "bias_right", type = "checkbox", caption = "Right", state = false },
        [4] = {name = "bias_left", type = "checkbox", caption = "Left", state = false}
    },
    button = {name = "apply", type = "button", caption = "Apply"},
    generate = function (config, player)
        if config[1].state == true then
            storage.active_special_games['bias_biter_sends'] = false
        end
        if config[2].state == true then
            storage.active_special_games['bias_biter_sends'] = true
            storage.special_games_variables['biter_bias'] = 'Main'
        end
        if config[3].state == true then
            storage.active_special_games['bias_biter_sends'] = true
            storage.special_games_variables['biter_bias'] = 'Right'
        end
        if config[4].state == true then
            storage.active_special_games['bias_biter_sends'] = true
            storage.special_games_variables['biter_bias'] = 'Left'
        end
    end,
    gui_click = function (element, config, player)
        if element.name == "example_custom_button_name" then
        -- if there are custom buttons in the special game config, add the handler code here
        end
    end
}

return Public