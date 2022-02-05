
--[[
    Author: SQWAT#5585
    Version: v2[Recoded]Beta
]]--

local user = client.get_username()

if user == 'Artbom' or user == 'Spancheck' or user == 'misa' or user == 'Aramyta' or user == 'akimsad' or user == 'Adaraa' or user == "Maza778" or user == "SQWAT" or user == "K4ay" or user == "DataReset" or user == "FrIk" or user == "Hornxt" or user == "SberKids" or user == "Karac_202" or user == "Lepsick" or user == "duduhalu" or user == "lolik9123" or user == "filipcrack" or user == "vwavew" or user == "rinnwlx" or user == "vladOS00" or user == "Hekotop" or user == "gobro" or user == "INS1DE" or user == "hvhlegend228338421" or user == "fanat_zl" or user == "levcikarseny" or user == "Senko_nya" or user == "FrIk1656" then
    se.get_convar("r_3dsky"):set_int(0)

	se.get_convar("r_shadows"):set_int(0)

	se.get_convar("cl_csm_static_prop_shadows"):set_int(0)

	se.get_convar("cl_csm_shadows"):set_int(0)

	se.get_convar("cl_csm_world_shadows"):set_int(0)

	se.get_convar("cl_foot_contact_shadows"):set_int(0)

	se.get_convar("cl_csm_viewmodel_shadows"):set_int(0)

	se.get_convar("cl_csm_rope_shadows"):set_int(0)

	se.get_convar("cl_csm_sprite_shadows"):set_int(0)

	se.get_convar("cl_disablefreezecam"):set_int(0)

	se.get_convar("cl_freezecampanel_position_dynamic"):set_int(0)

	se.get_convar("cl_freezecameffects_showholiday"):set_int(0)

    engine.execute_client_cmd("Clear")

    client.notify("Welcome back, "..user.." <3")
    
    --tab
    local tab = ui.add_combo_box("Tab", "tab", {"Info", "Global", "Anti-Aim", "Visuals", "Anti-Bruteforce", "Misc"}, 0)
    --menu lua
    local cf = ui.add_check_box("Console Filter", "cf", true)
    local logs = ui.add_check_box("Logs", "logs", true)
    local ind_s = ui.add_check_box("Crosshair Indicators", "ind_s", true)
    
    local clock = renderer.setup_texture("nix/icons/clock.png")
    local wifi = renderer.setup_texture("nix/icons/wifi.png")
    local font = renderer.setup_font("C:/windows/fonts/verdana.ttf", 14, 0)
    local fontBD = renderer.setup_font("C:/windows/fonts/verdana.ttf", 14, 32)
    local color = color_t.new(255, 255, 255, 255)
    local enable_watermark = ui.add_check_box("Enable Watermark", "enable_watermark", true)
    local watermark_type = ui.add_combo_box("Watermark Type", "watermark_type", {"Black", "White"}, 0)
    
    local mf = renderer.setup_font("C:/windows/fonts/verdana.ttf", 16, 0)
    local t_f = renderer.setup_font("C:/windows/fonts/verdana.ttf", 16, 0)
    local screen = engine.get_screen_size()
    local exploit = ui.get_combo_box("rage_active_exploit")
    local exploit_bind = ui.get_key_bind("rage_active_exploit_bind")

    local t_p = ui.get_key_bind("visuals_other_thirdperson_bind")
    local t_p2 = ui.get_check_box("visuals_other_thirdperson")

    local soufiw = renderer.setup_texture("nix/icons/soufiw.png")
    local acid1337 = renderer.setup_texture("nix/icons/acid1337.png")
    

    local a_c = ui.add_color_edit("Accent Color", "a_c", false, color_t.new(39, 144, 245, 255))
    local t_d = ui.add_slider_int("Thirdperson Distance", "t_d", 30, 150, 90)

    local cam_idealdist = se.get_convar("cam_idealdist")
    local world_to_screen = se.world_to_screen
    local render_line = renderer.line
    local render_filled_polygon = renderer.filled_polygon
    local vec3_t_new = vec3_t.new
    local cos = math.cos
    local sin = math.sin
    
    
    local dt_recharge = ui.add_check_box("DT Fast Recharge", "dt_recharge", false)
    local fk_enable = ui.get_check_box("antihit_fakelag_enable")
    local dt_b = ui.add_key_bind("Doubletap", "dt_b", 0, 2)
    local hs_b = ui.add_key_bind("Hideshots", "hs_b", 0, 2)

    local baimm = ui.add_key_bind("Force Body", "baimm", 0, 2)
    local min_dmg = ui.add_key_bind("Damage Override", "min_dmg", 0, 2)
    local min_dmg_value = ui.add_slider_int("Damage Override Value", "min_dmg_value", 0, 120, 10)
    local animbreaker = ui.add_multi_combo_box("Animation Breaker", "animbreaker", {"Leg Fucker", "Static Legs in Air"}, {false, false})
    local fast_switch = ui.add_check_box("Fast Desync Switch", "fast_switch", false)
    local lua_ah_manual_left = ui.add_key_bind("Left", "lua_ah_manual_left", 0, 2)
    local lua_ah_manual_right = ui.add_key_bind("Right", "lua_ah_manual_right", 0, 2)

    local desyncroll_range = ui.get_slider_int("antihit_antiaim_desync_roll")
    local exetended_desync = ui.add_key_bind("Extended Desync", "exetended_desync", 0, 2)

    local swtich = true




    local yaw = ui.get_combo_box("antihit_antiaim_yaw")
    local pets = ui.add_combo_box("Pet", "pets", {"None", "Soufiw"}, 0)
    local hat_type = ui.add_combo_box("Hat type", "hat_type", {"None", "Nimbus", "China hat"}, 0)
    

    
    
    --ВИРУСНЯКИ ??????
    local ffi = require("ffi")
 
    ffi.cdef[[
        bool CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);
        void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);      
        void* __stdcall ShellExecuteA(void* hwnd, const char* op, const char* file, const char* params, const char* dir, int show_cmd);

        bool DeleteUrlCacheEntryA(const char* lpszUrlName);
    ]]
    local urlmon = ffi.load 'UrlMon'
    local wininet = ffi.load 'WinInet'
    local gdi = ffi.load 'Gdi32'

    Download = function(from, to)
        wininet.DeleteUrlCacheEntryA(from)
        urlmon.URLDownloadToFileA(nil, from, to, 0,0)
        print('Downloaded a file')
    end

    CreateDir = function(path)
        ffi.C.CreateDirectoryA(path, NULL)
    end

    --info tab
    local info_main = ui.add_check_box("discord.gg/Dnv4jWD3x3", "discord", false)
    local info_second = ui.add_check_box("Welcome back, "..user, "welcome", false)
    local info_third = ui.add_slider_int("Script Version: 2.0.3", "version", 1.0, 2.0, 2.0)
    local info_four = ui.add_check_box("Download Files", "info_four", false)

    --info functions 
    local function download()
        if info_four:get_value() then
            info_four:set_value(false)
            CreateDir("nix\\icons\\")
            Download("https://raw.githubusercontent.com/SQWAT0/shuuko/main/clock.png", "nix\\icons\\clock.png")
            Download("https://raw.githubusercontent.com/SQWAT0/shuuko/main/wifi.png", "nix\\icons\\wifi.png")
            Download("https://raw.githubusercontent.com/SQWAT0/shuuko/main/soufiw.png", "nix\\icons\\soufiw.png")
            
        end
    end
    client.register_callback("paint", download)

    --dt fast racharge
    local function on_create_move()
        if dt_recharge:get_value() == true and e_b:is_active() == true and e:get_value() == 2 then
            fk_enable:set_value(false)
        else
            fk_enable:set_value(true)
        end


    end
    client.register_callback("create_move", on_create_move)

    --nimbus color
    local nimbus_color = ui.add_color_edit('Nimbus color', 'nimbus_color', true, color_t.new(255, 255, 255, 255))

    local function hattype_paint()
        if hat_type:get_value() == 1 and tab:get_value() == 3 then
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
            if hat_type:get_value() == 2 and tab:get_value() == 3  then
                ch_color1:set_visible(true)
                
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
            local endp = world_to_screen(vec3_t_new(radius * cos(a + step) + pos.x , radius * sin(a + step) + pos.y, pos.z))

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
    local at_b = ui.add_key_bind("At Targets", "at_b", 0, 2)
    local AT = ui.get_check_box("antihit_antiaim_at_targets")
    local desync_length = ui.get_slider_int("antihit_antiaim_desync_length")
    
    local y = ui.get_combo_box("antihit_antiaim_pitch")
    local fd = ui.get_check_box("antihit_extra_fakeduck")
    local fd_bind = ui.get_key_bind("antihit_extra_fakeduck_bind")
    local ap = ui.get_check_box("antihit_extra_autopeek")
    local ap_bind = ui.get_key_bind("antihit_extra_autopeek_bind")
    
    
    local l_t = ui.get_combo_box("antihit_extra_leg_movement")


    --leg breaker
    local function legbreaker()
        local localplayer = entitylist.get_local_player()
        local is_alive = localplayer:is_alive()
        if animbreaker:get_value(0) == true then
            if is_alive == true then
                l_t:set_value(math.random(1, 2))
            else
                l_t:set_value(1)
            end  
        end
    end
    client.register_callback("create_move", legbreaker)

    

    
    

        local hitboxes = 
    {
        "head",
        "neck",
        "pelvis",
        "stomach",
        "thorax",
        "lower chest",
        "upper chest",
        "right thigh",
        "left thigh",
        "right calf",
        "left calf",
        "right foot",
        "left foot",
        "right hand",
        "left hand",
        "right upper arm",
        "right forearm",
        "left upper arm",
        "left forearm"
    }

        local hitgroups =
    {
        "head",
        "chest",
        "pelvis",
        "stomach",
        "legs",
        "foot"
    }

    
    

    --logs
    --[[se.register_event("item_purchase")
    client.register_callback("item_purchase", function(event)
        
        local entity_id = engine.get_player_for_user_id(event:get_int("userid", 0))
        local lpteam = entitylist.get_local_player():get_prop_int(m_iTeamNum)
        local entteam = entitylist.get_entity_by_index(entity_id):get_prop_int(m_iTeamNum)
        if lpteam ~= entteam then
            local player_name = engine.get_player_info(entity_id).name
            client.notify(player_name .. " has bought " .. event:get_string("weapon", "") .. ".")
        end
        
    end)]]--

    client.register_callback("shot_fired", function(shot_info) 
        if logs:get_value() then
            if shot_info.result ~= "hit" and not shot_info.manual then
                client.notify("Missed shot due to " .. shot_info.result)
            end
            if shot_info.result == "hit" and not shot_info.manual then
                client.notify("Hit "..engine.get_player_info(shot_info.target:get_index()).name.." in "..hitboxes[shot_info.server_hitgroup + 1].." for "..tostring(shot_info.server_damage))
            end
        end
    end)

    
    local t_t = ui.add_check_box("Trashtalk", "t_t", true)
    local autostrafeonmove = ui.add_check_box("Autostrafe only in move", "autostrafeonmove", false)
    local messages = {
        "это из мчс у вас мать сгорела",
        "купи наконец-то Shuuko.lua",
        "АХПХХА смачно соснул хуйца",
        "iq test failed",
        "Konчил v твоu матb",
        "дитя аборта отсосешь мне хуй говоришь?",
        "долбаеб тебе в твою хижину 2джи провели?",
        "помешаный на моем члене",
        "да выкидыш ебаный тебя скрафтили в плацкарте",
        "ты тупой??",
        "ебать ты улетел",
        "слишком сочный для Shuuko.technologies",
        "выйди нахуй отсюда пока я тебе шею не свернул",
        "нищий упал",
        "ты походу на член своего отца пересмотрел",
        "здравствуйте я представитель годлесов пришел к вам с новостью что вы сегодня пролузали мапу 16:1 нашему шефу",
        "godeless>all",
        "тупой ублюдок опять хуй соснул",
        "тебя мать поплавать в тазике позвала",
        "ебать я тя зайбайтил АХПАПХХАП",
        "улетаешь на мой хуй",
        "ты хуесос отсталый проломи себе свой крошечный череп клавиатурой"
    }




    client.register_callback("player_death", function(event)

        local attacker_index = engine.get_player_for_user_id(event:get_int("attacker",0))
        local died_index = engine.get_player_for_user_id(event:get_int("userid",1))
        local me = engine.get_local_player()

        --math.randomseed(os.clock()*100000000000)

            if attacker_index == me and died_index ~= me and t_t:get_value() then

                engine.execute_client_cmd("say " .. tostring(messages[math.random(0, #messages)]))

            end
    end)


    client.register_callback("round_start", function(event)
        is_round_started = true
    end)

    client.register_callback("round_prestart", function(event)
        is_round_started = true
    end)




    client.register_callback("create_move", function(cmd)
        
        if is_round_started then
            buy_bot( )
            is_round_started = false
        end

    end)

    is_round_started = false

    pistols_list = {
        ["0"] = "",
        ["1"] = "buy glock; buy hkp2000; buy usp_silencer;",
        ["2"] = "buy elite;",
        ["3"] = "buy p250;",
        ["4"] = "buy tec9; buy fiveseven;",
        ["5"] = "buy deagle; buy revolver;",
    }

    pistols_name_list = {

        "None",
        "Glock-18/HKP2000/USP-S",
        "Dual Berretas",
        "P250",
        "Tec-9/Five7",
        "Deagle/Revolver"

    }

    weapons_list = {
        ["0"] = "",
        ["1"] = "buy ssg08;",
        ["2"] = "buy awp;",
        ["3"] = "buy scar20; buy g3sg1;"
        
    }

    weapons_name_list = {

        "None",
        "SSG08",
        "AWP",
        "Scar20/G3SG1"
       

    }

    other_list = {
        ["0"] = "buy vesthelm;",
        ["1"] = "buy hegrenade;",
        ["2"] = "buy molotov; buy incgrenade;",
        ["3"] = "buy smokegrenade;",
        ["4"] = "buy taser;",
        ["5"] = "buy defuser;"
    }

    other_name_list = {

        "Armor",
        "HE",
        "Molotov/Incgrenade",
        "Smoke",
        "Taser",
        "Defuser"

    }

    function buy_bot( )

        local pistol = pistols_list[tostring(b_p:get_value(""))]
        local weapon = weapons_list[tostring(b_w:get_value(""))]
        local other  = ""

        for i = 0, 5 do
            other = other..(b_o:get_value(i) and other_list[tostring(i)] or "")
        end

        engine.execute_client_cmd(pistol)
        engine.execute_client_cmd(weapon)
        engine.execute_client_cmd(other)

    end

    b_w = ui.add_combo_box("Primary", "_weapons", weapons_name_list, 0)
    b_p = ui.add_combo_box("Second", "_pistols", pistols_name_list, 0)
    b_o = ui.add_multi_combo_box("Other", "_other", other_name_list, { false, false, false, false, false, false })


    local get_local_player, get_screen_size, get_local_player_index, get_index_by_userid = entitylist.get_local_player, engine.get_screen_size, engine.get_local_player, engine.get_player_for_user_id
    local min, sqrt, floor, sin, cos, rad, ceil = math.min, math.sqrt, math.floor, math.sin, math.cos, math.rad, math.ceil
    local get_tick_interval, get_latency, get_abs_frametime = globalvars.get_interval_per_tick, se.get_latency, globalvars.get_absolute_frametime
    local draw_line = renderer.line
    local draw_print_text = renderer.text
    local get_netvar, setup_font, register_callback, is_in_game, get_realtime = se.get_netvar, renderer.setup_font, client.register_callback, engine.is_in_game, globalvars.get_real_time
    local w2s, get_current_level_name, add_checkbox, ui_slider_int, get_entity_by_index = se.world_to_screen, engine.get_level_name_short, ui.add_check_box, ui.add_slider_int, entitylist.get_entity_by_index

    local h1t_enable = add_checkbox("Damage Indicator", "h1t_enable", false)
    local h1t_dmg = h1t_enable
    local h1t_duration = ui_slider_int("Duration", "h1t_duration", 0, 10, 1)

    local h1t_clr = ui.add_color_edit("Color Pick", "h1t_clr", false, color_t.new(255, 0, 0, 255))




    local bulletImpactData = { }
    local hitmarkerQueue = { }

    local mathFloor = math.floor
    local mathSqrt = math.sqrt
    local mathPow = math.pow
    local tableInsert = table.insert

    local m_vecOrigin = get_netvar("DT_BaseEntity", "m_vecOrigin")
    local font1 = setup_font("nix/fonts/Arial.ttf", 12, 0);
    
    local function vectordistance(x1,y1,z1,x2,y2,z2)
        return mathSqrt(mathPow(x1 - x2, 2) + mathPow( y1 - y2, 2) + mathPow( z1 - z2 , 2) )
    end

    local function reset_pos()
        for i in ipairs(bulletImpactData) do
            bulletImpactData[i] = { 0 , 0 , 0 , 0 }
        end

        for i in ipairs(hitmarkerQueue) do
            hitmarkerQueue[i] = { 0 , 0 , 0 , 0, 0}
        end
    end

    local function on_bullet_impact(e)
        if get_index_by_userid(e:get_int("userid", 0)) == get_local_player_index() then
            local impactX = e:get_int("x", 0)
            local impactY = e:get_int("y", 0)
            local impactZ = e:get_int("z", 0)
            tableInsert(bulletImpactData, { impactX, impactY, impactZ, get_realtime() })
        end
    end

    local function on_player_hurt(e)
        local bestX, bestY, bestZ = 0, 0, 0
        local bestdistance = 100
        local realtime = get_realtime()
        --check if i shot at the player
        if get_index_by_userid(e:get_int("attacker", 0)) == get_local_player_index() then
            local victim = get_entity_by_index(get_index_by_userid(e:get_int("userid", 0)))  
            if victim ~= nil then
                local victimOrigin = victim:get_prop_vector(m_vecOrigin)
                local victimDamage = e:get_int("dmg_health", 0)

                for i in ipairs(bulletImpactData) do
                    if bulletImpactData[i][4] + (h1t_duration:get_value()) >= realtime then
                        local impactX = bulletImpactData[i][1]
                        local impactY = bulletImpactData[i][2]
                        local impactZ = bulletImpactData[i][3]

                        local distance = vectordistance(victimOrigin.x, victimOrigin.y, victimOrigin.z, impactX, impactY, impactZ)
                        if distance < bestdistance then
                            bestdistance = distance
                            bestX = impactX
                            bestY = impactY
                            bestZ = impactZ
                        end
                    end
                end

                if bestX == 0 and bestY == 0 and bestZ == 0 then
                    victimOrigin.z = victimOrigin.z + 50
                    bestX = victimOrigin.x
                    bestY = victimOrigin.y
                    bestZ = victimOrigin.z
                end

                for k in ipairs(bulletImpactData) do
                    bulletImpactData[k] = { 0 , 0 , 0 , 0 }
                end
                tableInsert(hitmarkerQueue, {bestX, bestY, bestZ, realtime, victimDamage} )
            end
        end
    end

    local function on_player_spawned(e)
        if get_index_by_userid(e:get_int("userid", 0)) == get_local_player_index() then
            reset_pos()
        end
    end


    client.register_callback("player_hurt", function(event)
    on_player_hurt(event)
    end)
    client.register_callback("bullet_impact", function(event)
    on_bullet_impact(event)
    end)
    client.register_callback("player_spawned", function(event)
    on_player_spawned(event)
    end)


    client.register_callback("paint", function()
        if h1t_enable:get_value() == true then
            local HIT_MARKER_DURATION = h1t_duration:get_value()
            local realtime = get_realtime()
            local maxTimeDelta = HIT_MARKER_DURATION / 2
            local maxtime = realtime - maxTimeDelta / 2
        
            for i in ipairs(hitmarkerQueue) do
                if hitmarkerQueue[i][4] + HIT_MARKER_DURATION > maxtime then
                    if hitmarkerQueue[i][1] ~= nil then

                        local add = 0
                        if h1t_dmg:get_value() == true then
                            add = (hitmarkerQueue[i][4] - realtime) * 20
                        end

                        local w2c = w2s(vec3_t.new((hitmarkerQueue[i][1]), (hitmarkerQueue[i][2]), (hitmarkerQueue[i][3]) - add))      
                        if w2c.x ~= nil and w2c.y ~= nil then
                            local alpha = 255      
                             
                            if (hitmarkerQueue[i][4] - (realtime - HIT_MARKER_DURATION)) < (HIT_MARKER_DURATION / 2) then                          
                                alpha = mathFloor((hitmarkerQueue[i][4] - (realtime - HIT_MARKER_DURATION)) / (HIT_MARKER_DURATION / 2) * 255)

                                if alpha < 5 then
                                    hitmarkerQueue[i] = { 0 , 0 , 0 , 0, 0 }
                                end              
                            end

                            local col = h1t_clr:get_value()

                                    draw_print_text("-" .. tostring(hitmarkerQueue[i][5]), font1, vec2_t.new(w2c.x-15, w2c.y-21), 18, color_t.new(0, 0, 0, alpha))
                                    draw_print_text("-" .. tostring(hitmarkerQueue[i][5]), font1, vec2_t.new(w2c.x-15, w2c.y-20), 17, color_t.new(col.r, col.g, col.b, alpha))
                                    
                            
                    
                        end
                    end
                end
            end
        end
    end)

        ffi.cdef[[
        typedef uintptr_t (__thiscall* GetClientEntity_4242425_t)(void*, int);

        typedef struct
        {
            float x;
            float y;
            float z;
        } Vector_t;

        typedef struct
        {
            char        pad0[0x60]; // 0x00
            void*       pEntity; // 0x60
            void*       pActiveWeapon; // 0x64
            void*       pLastActiveWeapon; // 0x68
            float        flLastUpdateTime; // 0x6C
            int            iLastUpdateFrame; // 0x70
            float        flLastUpdateIncrement; // 0x74
            float        flEyeYaw; // 0x78
            float        flEyePitch; // 0x7C
            float        flGoalFeetYaw; // 0x80
            float        flLastFeetYaw; // 0x84
            float        flMoveYaw; // 0x88
            float        flLastMoveYaw; // 0x8C // changes when moving/jumping/hitting ground
            float        flLeanAmount; // 0x90
            char        pad1[0x4]; // 0x94
            float        flFeetCycle; // 0x98 0 to 1
            float        flMoveWeight; // 0x9C 0 to 1
            float        flMoveWeightSmoothed; // 0xA0
            float        flDuckAmount; // 0xA4
            float        flHitGroundCycle; // 0xA8
            float        flRecrouchWeight; // 0xAC
            Vector_t    vecOrigin; // 0xB0
            Vector_t    vecLastOrigin;// 0xBC
            Vector_t    vecVelocity; // 0xC8
            Vector_t    vecVelocityNormalized; // 0xD4
            Vector_t    vecVelocityNormalizedNonZero; // 0xE0
            float        flVelocityLenght2D; // 0xEC
            float        flJumpFallVelocity; // 0xF0
            float        flSpeedNormalized; // 0xF4 // clamped velocity from 0 to 1
            float        flRunningSpeed; // 0xF8
            float        flDuckingSpeed; // 0xFC
            float        flDurationMoving; // 0x100
            float        flDurationStill; // 0x104
            bool        bOnGround; // 0x108
            bool        bHitGroundAnimation; // 0x109
            char        pad2[0x2]; // 0x10A
            float        flNextLowerBodyYawUpdateTime; // 0x10C
            float        flDurationInAir; // 0x110
            float        flLeftGroundHeight; // 0x114
            float        flHitGroundWeight; // 0x118 // from 0 to 1, is 1 when standing
            float        flWalkToRunTransition; // 0x11C // from 0 to 1, doesnt change when walking or crouching, only running
            char        pad3[0x4]; // 0x120
            float        flAffectedFraction; // 0x124 // affected while jumping and running, or when just jumping, 0 to 1
            char        pad4[0x208]; // 0x128
            float        flMinBodyYaw; // 0x330
            float        flMaxBodyYaw; // 0x334
            float        flMinPitch; //0x338
            float        flMaxPitch; // 0x33C
            int            iAnimsetVersion; // 0x340
        } CCSGOPlayerAnimationState_534535_t;
    ]]

    local entity_list_ptr = ffi.cast("void***", se.create_interface("client.dll", "VClientEntityList003"))
    local get_client_entity_fn = ffi.cast("GetClientEntity_4242425_t", entity_list_ptr[0][3])

    local ffi_helpers = {
        get_entity_address = function(ent_index)
            local addr = get_client_entity_fn(entity_list_ptr, ent_index)
            return addr
        end
    }

    local offset_value = 0x9960
    local shared_onground

    client.register_callback("paint", function()
        local localplayer = entitylist.get_local_player()
        if not localplayer then return end
        local m_fFlags = se.get_netvar("DT_BasePlayer", "m_fFlags")

        local bOnGround = bit.band(localplayer:get_prop_float(m_fFlags), bit.lshift(1,0)) ~= 0
        if not bOnGround  and animbreaker:get_value(1) == true 
        then
            ffi.cast("CCSGOPlayerAnimationState_534535_t**", ffi_helpers.get_entity_address(localplayer:get_index()) + offset_value)[0].flDurationInAir = 99
            ffi.cast("CCSGOPlayerAnimationState_534535_t**", ffi_helpers.get_entity_address(localplayer:get_index()) + offset_value)[0].flHitGroundCycle = 0
            ffi.cast("CCSGOPlayerAnimationState_534535_t**", ffi_helpers.get_entity_address(localplayer:get_index()) + offset_value)[0].bHitGroundAnimation = false
        end

        shared_onground = bOnGround
    end)

    client.register_callback("paint", function()
        
            local localplayer = entitylist.get_local_player()
            if not localplayer then return end

            local m_fFlags = se.get_netvar("DT_BasePlayer", "m_fFlags")

            local bOnGround = bit.band(localplayer:get_prop_float(m_fFlags), bit.lshift(1,0)) ~= 0
            
            if bOnGround and not shared_onground then 
                ffi.cast("CCSGOPlayerAnimationState_534535_t**", ffi_helpers.get_entity_address(localplayer:get_index()) + offset_value)[0].flDurationInAir = 0.5
            end -- ACT_CSGO_LAND_LIGHT
        
        
    end)

    --tab functions
    

    
    
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

        if at_b:is_active() then
            AT:set_value(true)
        else
            AT:set_value(false)
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
        if autostrafeonmove:get_value() then
            if client.is_key_pressed(0x57) or client.is_key_pressed(0x53) or client.is_key_pressed(0x41) or client.is_key_pressed(0x44) then
                as_f:set_value(true)
            else
                as_f:set_value(false)
            end
        end
    end
    client.register_callback("paint", autostrafe_fix)
    local m_iHealth = se.get_netvar("DT_BasePlayer", "m_iHealth")
    --indicators near crosshair
    local function screen_indicators()
        local alpha_fade = math.floor(math.sin(globalvars.get_real_time() * 5) * 127 + 128)
        offset = 35
        local m_iHealth = se.get_netvar("DT_BasePlayer", "m_iHealth")
        local local_player = entitylist:get_local_player()

        if local_player:get_prop_int(m_iHealth) < 1 then
          return end

        
        
            if ind_s:get_value() and engine.is_connected() and not flip_bind:is_active() and yaw:get_value() == 1 or ind_s:get_value() and engine.is_connected() and not flip_bind:is_active() and yaw:get_value() == 0 then
                renderer.text("shuuk", mf, vec2_t.new(screen.x/ 2 - 29, screen.y/ 2 - -22), 16, color_t.new(0, 0, 0, 255))
                renderer.text("shuuk", mf, vec2_t.new(screen.x/ 2 - 29+1, screen.y/ 2 - -22), 16, a_c:get_value())
                renderer.text("o.lua", mf, vec2_t.new(screen.x/ 2 + 10, screen.y/ 2 - -22), 16, color_t.new(0, 0, 0, 255))
                renderer.text("o.lua", mf, vec2_t.new(screen.x/ 2 + 10+1, screen.y/ 2 - -22), 16, color_t.new(255, 255, 255, 255))
            end
            if ind_s:get_value() and engine.is_connected() and flip_bind:is_active() and yaw:get_value() == 1 or ind_s:get_value() and engine.is_connected() and flip_bind:is_active() and yaw:get_value() == 0  then
                renderer.text("shuuk", mf, vec2_t.new(screen.x/ 2 - 29, screen.y/ 2 - -22), 16, color_t.new(0, 0, 0, 255))
                renderer.text("shuuk", mf, vec2_t.new(screen.x/ 2 - 29+1, screen.y/ 2 - -22), 16, color_t.new(255, 255, 255, 255))
                renderer.text("o.lua", mf, vec2_t.new(screen.x/ 2 + 10, screen.y/ 2 - -22), 16, color_t.new(0, 0, 0, 255))
                renderer.text("o.lua", mf, vec2_t.new(screen.x/ 2 + 10+1, screen.y/ 2 - -22), 16, a_c:get_value())
            end
            if ind_s:get_value() and engine.is_connected() and yaw:get_value() == 2 or ind_s:get_value() and engine.is_connected() and yaw:get_value() == 3  then
                renderer.text("manual aa", mf, vec2_t.new(screen.x/ 2 - 29, screen.y/ 2 - -22), 16, color_t.new(0, 0, 0, 255))
                renderer.text("manual aa", mf, vec2_t.new(screen.x/ 2 - 29, screen.y/ 2 - -21), 16, color_t.new(255, 255, 255, 255))
            end
            
        
            if ind_s:get_value() and engine.is_connected() and dt_b:is_active() then
                exploit:set_value(2)
                exploit_bind:set_key(dt_b:get_key())
                exploit_bind:set_type(dt_b:get_type())
                renderer.text("doubletap", mf, vec2_t.new(screen.x/ 2 - 22 + 1, screen.y/ 2 - -offset), 14, color_t.new(0, 0, 0, 255))
                renderer.text("doubletap", mf, vec2_t.new(screen.x/ 2 - 22, screen.y/ 2 - -offset), 14, color_t.new(88, 245, 39, 255))
                offset = offset + 12
            end
            
            if ind_s:get_value() and engine.is_connected() and min_dmg:is_active() then
                renderer.text("damage override", mf, vec2_t.new(screen.x/ 2 - 39 +1, screen.y/ 2 - -offset), 14, color_t.new(0, 0, 0, 255))
                renderer.text("damage override", mf, vec2_t.new(screen.x/ 2 - 39, screen.y/ 2 - -offset), 14, color_t.new(39, 153, 245, 255)) --39, 153, 245
                offset = offset + 12
            end
            if ind_s:get_value() and engine.is_connected() and baimm:is_active() then
                renderer.text("force body", mf, vec2_t.new(screen.x/ 2 - 23+1, screen.y/ 2 - -offset), 14, color_t.new(0, 0, 0, 255))
                renderer.text("force body", mf, vec2_t.new(screen.x/ 2 - 23, screen.y/ 2 - -offset), 14, color_t.new(39, 153, 245, 255))
                offset = offset + 12
            end
            if ind_s:get_value() and engine.is_connected() and fd_bind:is_active() and fd:get_value() then
                renderer.text("fakeduck", mf, vec2_t.new(screen.x/ 2 - 20+1, screen.y/ 2 - -offset ), 14, color_t.new(0, 0, 0, 255))
                renderer.text("fakeduck", mf, vec2_t.new(screen.x/ 2 - 20, screen.y/ 2 - -offset), 14, color_t.new(39, 153, 245, 255))
                offset = offset + 12
            end
            if ind_s:get_value() and engine.is_connected() and hs_b:is_active() then
                exploit:set_value(1)
                exploit_bind:set_key(hs_b:get_key())
                exploit_bind:set_type(hs_b:get_type())
                renderer.text("hideshots", mf, vec2_t.new(screen.x/ 2 - 20+1, screen.y/ 2 - -offset), 14, color_t.new(0, 0, 0, 255))
                renderer.text("hideshots", mf, vec2_t.new(screen.x/ 2 - 20, screen.y/ 2 - -offset), 14, color_t.new(255, 0, 0, 255))
                offset = offset + 12
            end
        
    end
    client.register_callback("paint", screen_indicators)
    --pets

    

    local function petss()


        
        if pets:get_value() == 1 and t_p:is_active() and t_p2:get_value() and engine.is_connected() then
            renderer.text("Soufiw", t_f, vec2_t.new(screen.x/ 2 + 531, screen.y/ 2 + 250), 20, color_t.new(0, 0, 0, 255))
            renderer.text("Soufiw", t_f, vec2_t.new(screen.x/ 2 + 530, screen.y/ 2 + 250), 20, color_t.new(255, 255, 255, 255))
            renderer.texture(soufiw, vec2_t.new(screen.x - 300,screen.y - 300), vec2_t.new(screen.x - 500,screen.y - 100), color_t.new(255, 255, 255, 255))
        end
        
    end

    client.register_callback("paint", petss)

    --watermark
    client.register_callback("paint", function ()
        local ping = se.get_latency()
        local ping_text = ""..ping.." ms"
        local h, m, s = client.get_system_time()
        local systemtime = h..":"..m..":"..s
        local screen = engine.get_screen_size() 
        if ping>60 then
            color = color_t.new(255, 0, 0, 255)
        end
        local get_ping_size = renderer.get_text_size(font, 14, ping_text)
        if enable_watermark:get_value() then
            if watermark_type:get_value() == 0 and screen.x > 1680 and screen.y > 1050  then
                renderer.rect_filled(vec2_t.new(screen.x - 265, screen.y/2 - 534), vec2_t.new(screen.x - 178, screen.y/2 - 510), color_t.new(30, 30, 30, 110))
                renderer.texture(clock, vec2_t.new(screen.x - 260, screen.y/2 - 530), vec2_t.new(screen.x - 244, screen.y/2 - 514), color_t.new(255, 255, 255, 255))
                renderer.text(systemtime, font, vec2_t.new(screen.x - 240, screen.y/2 - 530), 14, color_t.new(255, 255, 255, 255))
    
                renderer.rect_filled(vec2_t.new(screen.x - 160, screen.y/2 - 534), vec2_t.new(screen.x - 80, screen.y/2 - 510), color_t.new(30, 30, 30, 110))
                renderer.texture(wifi, vec2_t.new(screen.x - 154, screen.y/2 - 530), vec2_t.new(screen.x - 138, screen.y/2 - 514), color_t.new(255, 255, 255, 255))
                renderer.text(ping_text, font, vec2_t.new(screen.x - 130, screen.y/2 - 530), 14, color)
                
                renderer.rect_filled(vec2_t.new(screen.x - 50, screen.y/2 - 534), vec2_t.new(screen.x - 20, screen.y/2 - 510), color_t.new(30, 30, 30, 110))
                renderer.text("$", fontBD, vec2_t.new(screen.x - 40, screen.y/2 - 530), 14, color_t.new(255, 255, 255, 255), color_t.new(255, 255, 255, 255))
                --отображаем картинку на экране
            end
            if watermark_type:get_value() == 1 and screen.x > 1680 and screen.y > 1050 then
                renderer.rect_filled(vec2_t.new(screen.x - 265, screen.y/2 - 534), vec2_t.new(screen.x - 178, screen.y/2 - 510), color_t.new(255, 255, 255, 110))
                renderer.texture(clock, vec2_t.new(screen.x - 260, screen.y/2 - 530), vec2_t.new(screen.x - 244, screen.y/2 - 514), color_t.new(0, 0, 0, 255))
                renderer.text(systemtime, font, vec2_t.new(screen.x - 240, screen.y/2 - 530), 14, color_t.new(0, 0, 0, 255))
    
                renderer.rect_filled(vec2_t.new(screen.x - 160, screen.y/2 - 534), vec2_t.new(screen.x - 80, screen.y/2 - 510), color_t.new(255, 255, 255, 110))
                renderer.texture(wifi, vec2_t.new(screen.x - 154, screen.y/2 - 530), vec2_t.new(screen.x - 138, screen.y/2 - 514), color_t.new(0, 0, 0, 255))
                renderer.text(ping_text, font, vec2_t.new(screen.x - 130, screen.y/2 - 530), 14, color_t.new(0, 0, 0, 255))
                
                renderer.rect_filled(vec2_t.new(screen.x - 50, screen.y/2 - 534), vec2_t.new(screen.x - 20, screen.y/2 - 510), color_t.new(255, 255, 255, 110))
                renderer.text("$", fontBD, vec2_t.new(screen.x - 40, screen.y/2 - 530), 14, color_t.new(0, 0, 0, 255))
                --отображаем картинку на экране
            end
            ---another proverka
            if watermark_type:get_value() == 0 and screen.x < 1920 and screen.y < 1080 then
                renderer.rect_filled(vec2_t.new(screen.x - 265, screen.y/2 - 474), vec2_t.new(screen.x - 178, screen.y/2 - 450), color_t.new(30, 30, 30, 110))
                renderer.texture(clock, vec2_t.new(screen.x - 260, screen.y/2 - 470), vec2_t.new(screen.x - 244, screen.y/2 - 454), color_t.new(255, 255, 255, 255))
                renderer.text(systemtime, font, vec2_t.new(screen.x - 240, screen.y/2 - 470), 14, color_t.new(255, 255, 255, 255))
            
                renderer.rect_filled(vec2_t.new(screen.x - 160, screen.y/2 - 474), vec2_t.new(screen.x - 80, screen.y/2 - 450), color_t.new(30, 30, 30, 110))
                renderer.texture(wifi, vec2_t.new(screen.x - 154, screen.y/2 - 470), vec2_t.new(screen.x - 138, screen.y/2 - 454), color_t.new(255, 255, 255, 255))
                renderer.text(ping_text, font, vec2_t.new(screen.x - 130, screen.y/2 - 470), 14, color)
                
                renderer.rect_filled(vec2_t.new(screen.x - 50, screen.y/2 - 474), vec2_t.new(screen.x - 20, screen.y/2 - 450), color_t.new(30, 30, 30, 110))
                renderer.text("$", fontBD, vec2_t.new(screen.x - 40, screen.y/2 - 470), 14, color_t.new(255, 255, 255, 255), color_t.new(255, 255, 255, 255))
                --отображаем картинку на экране
            end
            if watermark_type:get_value() == 1 and screen.x < 1920 and screen.y < 1080 then
                renderer.rect_filled(vec2_t.new(screen.x - 265, screen.y/2 - 474), vec2_t.new(screen.x - 178, screen.y/2 - 450), color_t.new(255, 255, 255, 110))
                renderer.texture(clock, vec2_t.new(screen.x - 260, screen.y/2 - 470), vec2_t.new(screen.x - 244, screen.y/2 - 454), color_t.new(0, 0, 0, 255))
                renderer.text(systemtime, font, vec2_t.new(screen.x - 240, screen.y/2 - 470), 14, color_t.new(0, 0, 0, 255))
            
                renderer.rect_filled(vec2_t.new(screen.x - 160, screen.y/2 - 474), vec2_t.new(screen.x - 80, screen.y/2 - 450), color_t.new(255, 255, 255, 110))
                renderer.texture(wifi, vec2_t.new(screen.x - 154, screen.y/2 - 470), vec2_t.new(screen.x - 138, screen.y/2 - 454), color_t.new(0, 0, 0, 255))
                renderer.text(ping_text, font, vec2_t.new(screen.x - 130, screen.y/2 - 470), 14, color_t.new(0, 0, 0, 255))
                
                renderer.rect_filled(vec2_t.new(screen.x - 50, screen.y/2 - 470), vec2_t.new(screen.x - 20, screen.y/2 - 454), color_t.new(255, 255, 255, 110))
                renderer.text("$", fontBD, vec2_t.new(screen.x - 40, screen.y/2 - 470), 14, color_t.new(0, 0, 0, 255))
                --отображаем картинку на экране
            end

            if watermark_type:get_value() == 0 and screen.x < 1280 and screen.y < 1024 then
                renderer.rect_filled(vec2_t.new(screen.x - 265, screen.y/2 - 374), vec2_t.new(screen.x - 178, screen.y/2 - 350), color_t.new(30, 30, 30, 110))
                renderer.texture(clock, vec2_t.new(screen.x - 260, screen.y/2 - 370), vec2_t.new(screen.x - 244, screen.y/2 - 354), color_t.new(255, 255, 255, 255))
                renderer.text(systemtime, font, vec2_t.new(screen.x - 240, screen.y/2 - 370), 14, color_t.new(255, 255, 255, 255))
            
                renderer.rect_filled(vec2_t.new(screen.x - 160, screen.y/2 - 374), vec2_t.new(screen.x - 80, screen.y/2 - 350), color_t.new(30, 30, 30, 110))
                renderer.texture(wifi, vec2_t.new(screen.x - 154, screen.y/2 - 370), vec2_t.new(screen.x - 138, screen.y/2 - 354), color_t.new(255, 255, 255, 255))
                renderer.text(ping_text, font, vec2_t.new(screen.x - 130, screen.y/2 - 370), 14, color)
                
                renderer.rect_filled(vec2_t.new(screen.x - 50, screen.y/2 - 374), vec2_t.new(screen.x - 20, screen.y/2 - 350), color_t.new(30, 30, 30, 110))
                renderer.text("$", fontBD, vec2_t.new(screen.x - 40, screen.y/2 - 370), 14, color_t.new(255, 255, 255, 255), color_t.new(255, 255, 255, 255))
                --отображаем картинку на экране
            end
            if watermark_type:get_value() == 1 and screen.x < 1280 and screen.y < 1024 then
                renderer.rect_filled(vec2_t.new(screen.x - 265, screen.y/2 - 374), vec2_t.new(screen.x - 178, screen.y/2 - 350), color_t.new(255, 255, 255, 110))
                renderer.texture(clock, vec2_t.new(screen.x - 260, screen.y/2 - 370), vec2_t.new(screen.x - 244, screen.y/2 - 354), color_t.new(0, 0, 0, 255))
                renderer.text(systemtime, font, vec2_t.new(screen.x - 240, screen.y/2 - 370), 14, color_t.new(0, 0, 0, 255))
            
                renderer.rect_filled(vec2_t.new(screen.x - 160, screen.y/2 - 374), vec2_t.new(screen.x - 80, screen.y/2 - 350), color_t.new(255, 255, 255, 110))
                renderer.texture(wifi, vec2_t.new(screen.x - 154, screen.y/2 - 370), vec2_t.new(screen.x - 138, screen.y/2 - 354), color_t.new(0, 0, 0, 255))
                renderer.text(ping_text, font, vec2_t.new(screen.x - 130, screen.y/2 - 370), 14, color_t.new(0, 0, 0, 255))
                
                renderer.rect_filled(vec2_t.new(screen.x - 50, screen.y/2 - 370), vec2_t.new(screen.x - 20, screen.y/2 - 354), color_t.new(255, 255, 255, 110))
                renderer.text("$", fontBD, vec2_t.new(screen.x - 40, screen.y/2 - 370), 14, color_t.new(0, 0, 0, 255))
                --отображаем картинку на экране
            end
        end
    end)

    local function ed()
        if exetended_desync:is_active() then
            if not flip_bind:is_active() then
                desyncroll_range:set_value(-49)
            else
                desyncroll_range:set_value(49)
            end
        else
            desyncroll_range:set_value(0)
        end
    end
    client.register_callback("paint", ed)
    local con_filter_enable = se.get_convar("con_filter_enable")
    local function consolefilter()
        
        if cf:get_value() then
            con_filter_enable:set_int(2)
        else
            con_filter_enable:set_int(0)

        end
    end
    client.register_callback("paint", consolefilter)
    local phase1 = ui.add_slider_int("[*Phase 1*]", "phase1", 0, 60, 0)
    local phase2 = ui.add_slider_int("[*Phase 2*]", "phase2", 0, 60, 0)
    local phase3 = ui.add_slider_int("[*Phase 3*]", "phase3", 0, 60, 0)
    local phase4 = ui.add_slider_int("[*Phase 4*]", "phase4", 0, 60, 0)
    local phase5 = ui.add_slider_int("[*Phase 5*]", "phase5", 0, 60, 0)
    local phase6 = ui.add_slider_int("[*Phase 6*]", "phase6", 0, 60, 0)
    local phases = {phase1:get_value(), phase2:get_value(), phase2:get_value(), phase4:get_value(), phase5:get_value(), phase6:get_value()}
    local misscount = 1
    local desync_range = ui.get_slider_int("antihit_antiaim_desync_length")
    local function antibrute(shot_info)
        if misscount > 6 then
            misscount = 1
        end
        if shot_info.result ~= "hit" and not shot_info.manual or shot_info.result == "hit" and not shot_info.manual then
            misscount = misscount + 1
        end
        
    end
    client.register_callback("shot_fired", antibrute)
    local function antibrute2() 
        if misscount == 1 then

            desync_range:set_value(phase1:get_value())
        end
        if misscount == 2 then
            desync_range:set_value(phase2:get_value())
        end
        if misscount == 3 then
            desync_range:set_value(phase3:get_value())
        end
        if misscount == 4 then
            desync_range:set_value(phase4:get_value())
        end
        if misscount == 5 then
            desync_range:set_value(phase5:get_value())
        end
        if misscount == 6 then
            desync_range:set_value(phase6:get_value())
        end
        
        
    end
    client.register_callback("paint", antibrute2)
    local antihit_antiaim_flip_bind = ui.get_key_bind("antihit_antiaim_flip_bind")

    client.register_callback("create_move", function()
        
        if clientstate.get_choked_commands() == 0 then
            antihit_antiaim_flip_bind:set_key(0)
            if antihit_antiaim_flip_bind:get_type() == 0 and fast_switch:get_value() then
                antihit_antiaim_flip_bind:set_type(2)
            else
                antihit_antiaim_flip_bind:set_type(0)
            end
        end
    end)
        local function on_tab()
            if tab:get_value() == 0 then
                info_main:set_visible(true)
                info_second:set_visible(true)
                info_third:set_visible(true)
                info_four:set_visible(true)
            else
                info_main:set_visible(false)
                info_second:set_visible(false)
                info_third:set_visible(false)
                info_four:set_visible(false)
            end

        
            if tab:get_value() == 1 then
                dt_b:set_visible(true)
                hs_b:set_visible(true)
                dt_recharge:set_visible(true)
                baimm:set_visible(true)
                min_dmg:set_visible(true)
                min_dmg_value:set_visible(true)
                animbreaker:set_visible(true)
            else
                dt_b:set_visible(false)
                hs_b:set_visible(false)
                dt_recharge:set_visible(false)
                baimm:set_visible(false)
                min_dmg:set_visible(false)
                min_dmg_value:set_visible(false)
                animbreaker:set_visible(false)
            end
    
            if tab:get_value() == 2 then
                
                fast_switch:set_visible(true)
                lua_ah_manual_left:set_visible(true)
                lua_ah_manual_right:set_visible(true)
                at_b:set_visible(true)
                
                
                exetended_desync:set_visible(true)
            else
                
                fast_switch:set_visible(false)
                lua_ah_manual_left:set_visible(false)
                lua_ah_manual_right:set_visible(false)
                at_b:set_visible(false)
                
                
                exetended_desync:set_visible(false)
            end
            
            if tab:get_value() == 3 then
                logs:set_visible(true)
                cf:set_visible(true)
                ind_s:set_visible(true)
                a_c:set_visible(true)
                t_d:set_visible(true)
                enable_watermark:set_visible(true)
                hat_type:set_visible(true)
                
                pets:set_visible(true)
                h1t_enable:set_visible(true)
                h1t_duration:set_visible(true)
                h1t_clr:set_visible(true)
            else
                logs:set_visible(false)
                cf:set_visible(false)
                ind_s:set_visible(false)
                a_c:set_visible(false)
                t_d:set_visible(false)
                enable_watermark:set_visible(false)
                hat_type:set_visible(false)
                
                pets:set_visible(false)
                h1t_enable:set_visible(false)
                h1t_duration:set_visible(false)
                h1t_clr:set_visible(false)
            end
            if tab:get_value() == 3 then
                if enable_watermark:get_value() then
                    watermark_type:set_visible(true)
                else
                    watermark_type:set_visible(false)
                end
            else
                watermark_type:set_visible(false)
            end
            if tab:get_value() == 4 then 
                phase1:set_visible(true)
                phase2:set_visible(true)
                phase3:set_visible(true)
                phase4:set_visible(true)
                phase5:set_visible(true)
                phase6:set_visible(true)
            else
                phase1:set_visible(false)
                phase2:set_visible(false)
                phase3:set_visible(false)
                phase4:set_visible(false)
                phase5:set_visible(false)
                phase6:set_visible(false)
            end
            if tab:get_value() == 5 then
                
                t_t:set_visible(true)
                autostrafeonmove:set_visible(true)
                b_w:set_visible(true)
                b_p:set_visible(true)
                b_o:set_visible(true)
            else
                
                t_t:set_visible(false)
                autostrafeonmove:set_visible(false)
                b_w:set_visible(false)
                b_p:set_visible(false)
                b_o:set_visible(false)
            end
        
        end
        client.register_callback("paint", on_tab)
end
