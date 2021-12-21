--[[
    Author: SQWAT#5585
    Version: v2[Recoded]Beta
]]--

--tab
local tab = ui.add_combo_box("Tab", "tab", {"Rage", "Anti-Aim", "Visuals", "Misc"}, 0)
--menu lua
local ind_s = ui.add_check_box("Enable Indicators", "ind_s", true)
local enable_watermark = ui.add_check_box("Enable Watermark", "enable_watermark", true)
local mf = renderer.setup_font("nix/fonts/Tahoma.ttf", 100, 0)
local t_f = renderer.setup_font("nix/fonts/Tahoma.ttF", 100, 0)
local screen = engine.get_screen_size()
local exploit = ui.get_combo_box("rage_active_exploit")
local exploit_bind = ui.get_key_bind("rage_active_exploit_bind")
local a_c = ui.add_color_edit("Accent Color", "a_c", true, color_t.new(255, 255, 255, 255))
local t_d = ui.add_slider_int("ThirdPerson Distance", "t_d", 30, 150, 90)
local cam_idealdist = se.get_convar("cam_idealdist")
local world_to_screen = se.world_to_screen
local render_line = renderer.line
local render_filled_polygon = renderer.filled_polygon
local vec3_t_new = vec3_t.new
local cos = math.cos
local sin = math.sin
local pitch_da = ui.add_key_bind("Pitch Zero", "pitch_da", 0, 2)
local dt_b = ui.add_key_bind("Doubletap", "dt_b", 0, 2)
local hs_b = ui.add_key_bind("Hideshots", "hs_b", 0, 2)
local baimm = ui.add_key_bind("Force Baim", "baimm", 0, 2)
local min_dmg = ui.add_key_bind("Damage Override", "min_dmg", 0, 2)
local min_dmg_value = ui.add_slider_int("Damage Override Value", "min_dmg_value", 0, 120, 10)
local low_delta = ui.add_key_bind("Low Delta", "low_delta", 0, 1)
local lua_ah_manual_left = ui.add_key_bind("Left", "lua_ah_manual_left", 0, 2)
local lua_ah_manual_right = ui.add_key_bind("Right", "lua_ah_manual_right", 0, 2)

local yaw = ui.get_combo_box("antihit_antiaim_yaw")
local hat_type = ui.add_combo_box("Hat type", "hat_type", {"None", "Nimbus", "China hat"}, 0)





local nimbus_color = ui.add_color_edit('Nimbus color', 'nimbus_color', true, color_t.new(255, 255, 255, 255))

local function hattype_paint()
    if hat_type:get_value() == 1 and tab:get_value() == 2 then
        nimbus_color:set_visible(true)
    else
        nimbus_color:set_visible(false)
    end
end
client.register_callback("paint", hattype_paint)
    
    local thirdperson3 = ui.get_check_box('visuals_other_thirdperson')
    local thirdperson_bind3 = ui.get_key_bind('visuals_other_thirdperson_bind')

    
local function draw_hat(from, pos, radius, segments, color)
    local points = {from}

    local step = 6.2831853071795862 / segments
    for a = 0, 6.2831853071795862, step do
        local start = world_to_screen(vec3_t_new(radius * cos(a) + pos.x, radius * sin(a) + pos.y, pos.z))
        local endp = world_to_screen(vec3_t_new(radius * cos(a + step) + pos.x, radius * sin(a + step) + pos.y, pos.z))

        if start and endp and hat_type:get_value() == 1 then
            render_line(start, endp, color)  
        end
    end
end


local function nimbuss()
    local lp = entitylist.get_local_player()
    if not lp or not lp:is_alive() then
        return
    end

    if not thirdperson3:get_value() or not thirdperson_bind3:is_active() then
        return
    end

    local head_pos = lp:get_player_hitbox_pos(0)

    local high_pos = vec3_t_new(head_pos.x, head_pos.y, head_pos.z+8)

    local w2s = world_to_screen(high_pos)
    if w2s and hat_type:get_value() == 1 then
        draw_hat(w2s, high_pos, 5, 75, nimbus_color:get_value())
    end
end


    client.register_callback('paint', nimbuss)


    

    --china hat color
local ch_color1 = ui.add_color_edit('China hat color', 'ch_color1', true, color_t.new(255, 255, 255, 120))


    local function hattype_paint2()
        if hat_type:get_value() == 2 and tab:get_value() == 2  then
            ch_color1:set_visible(true)
            ch_color2:set_visible(true)
        else
            ch_color1:set_visible(false)
            
        end
    end
    client.register_callback("paint", hattype_paint2)

    
local thirdperson1 = ui.get_check_box('visuals_other_thirdperson')
local thirdperson_bind2 = ui.get_key_bind('visuals_other_thirdperson_bind')

    
local function draw_hat(from, pos, radius, segments, color)
    local points = {from}
    local last_point = nil

    local step = 6.2831853071795862 / segments
    for a = 0, 6.2831853071795862, step do
        local start = world_to_screen(vec3_t_new(radius * cos(a) + pos.x, radius * sin(a) + pos.y, pos.z))
        local endp = world_to_screen(vec3_t_new(radius * cos(a + step) + pos.x, radius * sin(a + step) + pos.y, pos.z))

        if start and endp and hat_type:get_value() == 2 then
                render_line(start, endp, color)      
                points[#points+1] = start  
                last_point = endp
        end
    end

    if last_point then
        points[#points+1] = last_point
        render_filled_polygon(points, ch_color1:get_value())
    end
end


local function on_paint()
    local lp = entitylist.get_local_player()
    if not lp or not lp:is_alive() then
        return
    end

    if not thirdperson1:get_value() or not thirdperson_bind2:is_active() then
        return
    end

    local head_pos = lp:get_player_hitbox_pos(0)

    local high_pos = vec3_t_new(head_pos.x, head_pos.y, head_pos.z+8)
    local low_pos = vec3_t_new(head_pos.x, head_pos.y, head_pos.z)

    local w2s = world_to_screen(high_pos)
    if w2s and hat_type:get_value() == 2 then
            draw_hat(w2s, low_pos, 10, 75, ch_color1:get_value())
    end
end


client.register_callback('paint', on_paint)


local flip_bind = ui.get_key_bind("antihit_antiaim_flip_bind")
--get bind and etc

local desync_length = ui.get_slider_int("antihit_antiaim_desync_length")
local y = ui.get_combo_box("antihit_antiaim_pitch")
local fd = ui.get_check_box("antihit_extra_fakeduck")
local fd_bind = ui.get_key_bind("antihit_extra_fakeduck_bind")
local ap = ui.get_check_box("antihit_extra_autopeek")
local ap_bind = ui.get_key_bind("antihit_extra_autopeek_bind")



--tab functions
local function on_tab()
    if tab:get_value() == 0 then
        dt_b:set_visible(true)
        hs_b:set_visible(true)
        baimm:set_visible(true)
        min_dmg:set_visible(true)
        min_dmg_value:set_visible(true)
    else
        dt_b:set_visible(false)
        hs_b:set_visible(false)
        baimm:set_visible(false)
        min_dmg:set_visible(false)
        min_dmg_value:set_visible(false)
    end
    if tab:get_value() == 1 then
        low_delta:set_visible(true)
        pitch_da:set_visible(true)
        lua_ah_manual_left:set_visible(true)
        lua_ah_manual_right:set_visible(true)
    else
        low_delta:set_visible(false)
        pitch_da:set_visible(false)
        lua_ah_manual_left:set_visible(false)
        lua_ah_manual_right:set_visible(false)
    end
    
    if tab:get_value() == 2 then
        ind_s:set_visible(true)
        a_c:set_visible(true)
        t_d:set_visible(true)
        enable_watermark:set_visible(true)
        hat_type:set_visible(true)
    else
        ind_s:set_visible(false)
        a_c:set_visible(false)
        t_d:set_visible(false)
        enable_watermark:set_visible(false)
        hat_type:set_visible(false)
    end
    
    
end
client.register_callback("create_move", on_tab)

--low delta 
local function ld()
    if low_delta:is_active() then
        desync_length:set_value(17)
    else
        desync_length:set_value(47)
    end
end
client.register_callback("create_move", ld)
--helicopter technologies
local side = 0

client.register_callback('create_move', function()

    left_x = lua_ah_manual_left:get_key()
    right_x = lua_ah_manual_right:get_key()

    if side == 2 and client.is_key_clicked(left_x) then
        ui.get_combo_box('antihit_antiaim_yaw'):set_value(1)
        side = 0
    end

    if side == 3 and client.is_key_clicked(right_x) then
        ui.get_combo_box('antihit_antiaim_yaw'):set_value(1)
        side = 0
    end

    if client.is_key_clicked(left_x) then
        ui.get_combo_box('antihit_antiaim_yaw'):set_value(2)
        side = 2
    end

    if client.is_key_clicked(right_x) then
        ui.get_combo_box('antihit_antiaim_yaw'):set_value(3)
        side = 3
    end

end)
--baim
local function baimz()
    local entity = entitylist.get_players(0)

	if baimm:is_active() then
		for i = 1, #entity do
			local player = entity[i]

			ragebot.override_hitscan(player:get_index(), 0, false)
			ragebot.override_hitscan(player:get_index(), 1, true)
			ragebot.override_hitscan(player:get_index(), 2, true)
			ragebot.override_hitscan(player:get_index(), 3, true)
			ragebot.override_hitscan(player:get_index(), 4, false)
			ragebot.override_hitscan(player:get_index(), 5, false)

		end
	end
end
client.register_callback("create_move", baimz)
--mindmg
client.register_callback("create_move", function()
    local entity = entitylist.get_players(0)

    if min_dmg:is_active() then
        for i = 1, #entity do
            local player = entity[i]

            ragebot.override_min_damage(player:get_index(), 0, false)
            ragebot.override_min_damage(player:get_index(), 1, true)
            ragebot.override_min_damage(player:get_index(), 2, true)
            ragebot.override_min_damage(player:get_index(), 3, true)
            ragebot.override_min_damage(player:get_index(), 4, false)
            ragebot.override_min_damage(player:get_index(), 5, false)

        end
    end
end)


--cam dist
local function distance()
    cam_idealdist:set_int(t_d:get_value())
end
client.register_callback("create_move", distance)
--autostrafe fix
local as_f = ui.get_check_box("misc_autostrafer")




local function autostrafe_fix()
    if client.is_key_pressed(0x57) or client.is_key_pressed(0x53) or client.is_key_pressed(0x41) or client.is_key_pressed(0x44) then
        as_f:set_value(true)
    else
        as_f:set_value(false)
    end
end
client.register_callback("paint", autostrafe_fix)

--indicators near crosshair
local function screen_indicators()
    offset = 30
    local connected = engine.is_connected()
    local in_game = engine.is_in_game()
    if ind_s:get_value() == true and connected then
        renderer.text("Shuuko.lua", t_f, vec2_t.new(screen.x/ 2 - 29, screen.y/ 2 - -15), 16, color_t.new(0, 0, 0, 255))
        renderer.text("Shuuko.lua", t_f, vec2_t.new(screen.x/ 2 - 28, screen.y/ 2 - -15), 16, a_c:get_value())
        renderer.line(vec2_t.new(screen.x/ 2 - 29,screen.y/ 2 - -31), vec2_t.new(screen.x/ 2 + 38,screen.y/ 2 - -30), color_t.new(0, 0, 0, 255))
        renderer.line(vec2_t.new(screen.x/ 2 - 28,screen.y/ 2 - -30), vec2_t.new(screen.x/ 2 + 38,screen.y/ 2 - -30), color_t.new(255, 255, 255, 255))
    end

    if ind_s:get_value() == true and low_delta:is_active() and connected then
        renderer.text(">Low-Delta", t_f, vec2_t.new(screen.x/ 2 - 29, screen.y/ 2 - -offset), 14, color_t.new(0, 0, 0, 255))
        renderer.text(">Low-Delta", t_f, vec2_t.new(screen.x/ 2 - 28, screen.y/ 2 - -offset), 14, color_t.new(233, 245, 66, 255))
        offset = offset + 12
    end

    if ind_s:get_value() == true and hs_b:is_active() and connected then
        exploit:set_value(1)
        exploit_bind:set_type(hs_b:get_type())
        exploit_bind:set_key(hs_b:get_key())
        renderer.text(">Hideshots", t_f, vec2_t.new(screen.x/ 2 - 29, screen.y/ 2 - -offset), 14, color_t.new(0, 0, 0, 255))
        renderer.text(">Hideshots", t_f, vec2_t.new(screen.x/ 2 - 28, screen.y/ 2 - -offset), 14, color_t.new(245, 218, 66, 255))
        offset = offset + 12
    end
    if ind_s:get_value() == true and fd:get_value() == true and fd_bind:is_active() and connected then
        renderer.text(">Fakeduck", t_f, vec2_t.new(screen.x/ 2 - 29, screen.y/ 2 - -offset), 14, color_t.new(0, 0, 0, 255))
        renderer.text(">Fakeduck", t_f, vec2_t.new(screen.x/ 2 - 28, screen.y/ 2 - -offset), 14, color_t.new(245, 188, 66, 255))
        offset = offset + 12
    end

    if ind_s:get_value() == true and pitch_da:is_active() and connected then
        y:set_value(2)
        renderer.text(">Zero", t_f, vec2_t.new(screen.x/ 2 - 29, screen.y/ 2 - -offset), 14, color_t.new(0, 0, 0, 255))
        renderer.text(">Zero", t_f, vec2_t.new(screen.x/ 2 - 28, screen.y/ 2 - -offset), 14, color_t.new(255, 100, 150, 255))
        offset = offset + 12
    else
        y:set_value(1)
    end

    if ind_s:get_value() == true and dt_b:is_active() and connected then
        exploit:set_value(2)
        exploit_bind:set_type(dt_b:get_type())
        exploit_bind:set_key(dt_b:get_key())
        renderer.text(">Doubletap", t_f, vec2_t.new(screen.x/ 2 - 29, screen.y/ 2 - -offset), 14, color_t.new(0, 0, 0, 255))
        renderer.text(">Doubletap", t_f, vec2_t.new(screen.x/ 2 - 28, screen.y/ 2 - -offset), 14, color_t.new(163, 255, 100, 255))
        offset = offset + 12
    end

    if ind_s:get_value() == true and ap:get_value() == true and ap_bind:is_active() and connected then
        renderer.text(">Autopeek", t_f, vec2_t.new(screen.x/ 2 - 29, screen.y/ 2 - -offset), 14, color_t.new(0, 0, 0, 255))
        renderer.text(">Autopeek", t_f, vec2_t.new(screen.x/ 2 - 28, screen.y/ 2 - -offset), 14, color_t.new(93, 234, 245, 255))
        offset = offset + 12
    end

    if baimm:is_active() and ind_s:get_value() == true and connected then
        renderer.text(">Baim", t_f, vec2_t.new(screen.x / 2 - 29, screen.y / 2 - -offset), 14, color_t.new(0, 0, 0, 255))
        renderer.text(">Baim", t_f, vec2_t.new(screen.x / 2 - 28, screen.y / 2 - -offset), 14, color_t.new(132, 187, 255, 255))
        offset = offset + 12
    end

    if min_dmg:is_active() and ind_s:get_value() == true and connected then
        renderer.text(">Min-Dmg", t_f, vec2_t.new(screen.x / 2 - 29, screen.y / 2 - -offset), 14, color_t.new(0, 0, 0, 255))
        renderer.text(">Min-Dmg", t_f, vec2_t.new(screen.x / 2 - 28, screen.y / 2 - -offset), 14, color_t.new(255, 255, 255, 255))
        offset = offset + 12
    end
end
client.register_callback("paint", screen_indicators)


--watermark
local function watermark()
    local pingus = se.get_latency()
    local h, m, s = client.get_system_time()
    local time_w = h..":"..m..":"..s
    local w_t = "Shuuko v2[Beta]".." - ".."delay:"..pingus.."ms".." - "..time_w
    if enable_watermark:get_value()  then
        renderer.line(vec2_t.new(screen.x/2 + 731, screen.y/2 - 534), vec2_t.new(screen.x/2 + 955, screen.y/2 - 534), a_c:get_value())
        renderer.line(vec2_t.new(screen.x/2 + 731, screen.y/2 - 533), vec2_t.new(screen.x/2 + 955, screen.y/2 - 533), a_c:get_value())
        renderer.rect_filled(vec2_t.new(screen.x/2 + 731, screen.y/2 - 532), vec2_t.new(screen.x/2 + 955, screen.y/2 - 513), color_t.new(30, 30, 30, 100))
        renderer.text(w_t, mf, vec2_t.new(screen.x/2 + 741, screen.y/2 - 530), 14, color_t.new(0, 0, 0, 255))
        renderer.text(w_t, mf, vec2_t.new(screen.x/2 + 740, screen.y/2 - 530), 14, color_t.new(255, 255, 255, 255))
        
        
    end
end
client.register_callback("paint", watermark)