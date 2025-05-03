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
        if config["bias_random"].state == true then
            storage.active_special_games['bias_biter_sends'] = false
        end
        if config["bias_main"].state == true then
            storage.active_special_games['bias_biter_sends'] = true
            storage.special_games_variables['biter_bias'] = 'Main'
        end
        if config["bias_right"].state == true then
            storage.active_special_games['bias_biter_sends'] = true
            storage.special_games_variables['biter_bias'] = 'Right'
        end
        if config["bias_left"].state == true then
            storage.active_special_games['bias_biter_sends'] = true
            storage.special_games_variables['biter_bias'] = 'Left'
        end
        game.print("biter bias:", storage.active_special_games["bias_biter_sends"])
    end,
    gui_click = function (element, config, player)
        if element.name == "example_custom_button_name" then
        -- if there are custom buttons in the special game config, add the handler code here
        end
    end
}

return Public