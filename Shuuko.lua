--[[
    Author: SQWAT#5585
    Version: v1.5[Stable]
]]--


local user = client.get_username()






if user == 'Artbom' or user == 'Spancheck' or user == 'misa' or user == 'Aramyta' or user == 'akimsad' or user == 'Adaraa' or user == "Maza778" or user == "SQWAT" or user == "K4ay" or user == "DataReset" or user == "FrIk" or user == "Hornxt" or user == "SberKids" or user == "Karac_202" or user == "Lepsick" or user == "duduhalu" or user == "lolik9123" or user == "filipcrack" or user == "vwavew" or user == "rinnwlx" then
    engine.execute_client_cmd("clear")
    engine.execute_client_cmd("cl_disablehtmlmotd 1")
    engine.execute_client_cmd("r_cheapwaterend 1")
    engine.execute_client_cmd("r_cheapwaterstart 1")
    engine.execute_client_cmd("r_eyemove 0")
    engine.execute_client_cmd("r_eyegloss 0")
    engine.execute_client_cmd("muzzleflash_light 0")

    

    local tab = ui.add_combo_box("Tab", "tab", {"Main", "Anti-aim", "Visuals", "Misc"}, 0)



    local dt = ui.add_key_bind("Double Tap", "dt", 0, 2)
    local hs = ui.add_key_bind("Hide shots", "hs", 0, 2)


    local fd = ui.add_key_bind("Fake Duck", "fd", 0, 2)
    local screen = engine.get_screen_size()
    local font = renderer.setup_font("nix/fonts/Tahoma.ttf", 50, 0)
   
    




    

    local dt_recharge = ui.add_check_box("DT Fast Recharge", "dt_recharge", false)
    local fk_enable = ui.get_check_box("antihit_fakelag_enable")
    local e = ui.get_combo_box("rage_active_exploit")
    local e_b = ui.get_key_bind("rage_active_exploit_bind")

    local minimumdamage = ui.add_key_bind("Damage Override", "minimumdamage", 0, 2)
    local minimum_damage_value = ui.add_slider_int("Damage Override Value", "minimumdamage_value", 0, 100, 1)
    local baimb = ui.add_key_bind("Force Baim", "baimb", 0, 2)

    local function on_create_move()
        if dt_recharge:get_value() == true and e_b:is_active() == true and e:get_value() == 2 then
            fk_enable:set_value(false)
        else
            fk_enable:set_value(true)
        end


    end
    client.register_callback("create_move", on_create_move)

    local function on_tab()
        if tab:get_value() == 0 then
            dt:set_visible(true)
            hs:set_visible(true)
            fd:set_visible(true)
            dt_recharge:set_visible(true)
            minimumdamage:set_visible(true)
            minimum_damage_value:set_visible(true)
            baimb:set_visible(true)
        else
            dt:set_visible(false)
            hs:set_visible(false)
            fd:set_visible(false)
            dt_recharge:set_visible(false)
            minimumdamage:set_visible(false)
            minimum_damage_value:set_visible(false)
            baimb:set_visible(false)
        end
    end
    client.register_callback("paint", on_tab)

    local wm = ui.get_check_box("visuals_other_watermark")
    wm:set_value(false)

   

    --------------
    ---Anti-Aim---
    --------------




    local font = renderer.setup_font("nix/fonts/Tahoma.ttf", 50, 0)


    
    
    local fds = ui.add_check_box("Fast Desync Switch", "fds", false)
    local antihit_antiaim_flip_bind = ui.get_key_bind("antihit_antiaim_flip_bind")

        

    client.register_callback("create_move", function()
        
        if fds:get_value() == true then
                
            if clientstate.get_choked_commands() == 0 then

                antihit_antiaim_flip_bind:set_key(0)
                if antihit_antiaim_flip_bind:get_type() == 0 then
                        antihit_antiaim_flip_bind:set_type(2)
                else
                        antihit_antiaim_flip_bind:set_type(0)
                end
            end
        end
        


    end)


    local lua_ah_manual_left = ui.add_key_bind("Left", "lua_ah_manual_left", 0, 2)
    local lua_ah_manual_right = ui.add_key_bind("Right", "lua_ah_manual_right", 0, 2)

    local yaw = ui.get_combo_box("antihit_antiaim_yaw")

        

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


    local pz = ui.add_key_bind("Pitch Zero", "pz", 0, 2)
    local aap = ui.get_combo_box("antihit_antiaim_pitch")

    client.register_callback("create_move", function()
        if pz:is_active() then
            aap:set_value(2)
        else
            aap:set_value(1)
        end

    end)

    local antihit_antiaim_at_targets = ui.get_check_box("antihit_antiaim_at_targets")
    local at = ui.add_key_bind("At Targets", "at", 0, 2)
    antihit_antiaim_at_targets:set_value(false)
    local font = renderer.setup_font("nix/fonts/Tahoma.ttf", 50, 0)


    local screen = engine.get_screen_size()

    local function on_create_move()

        if at:is_active()  then
            antihit_antiaim_at_targets:set_value(true)
        else
            antihit_antiaim_at_targets:set_value(false)	
        end
    end

    client.register_callback("create_move", on_create_move)


    local lowdelta123 = ui.add_key_bind("Little Delta","low_delta123", 0, 1)
    local desync1 = ui.get_slider_int("antihit_antiaim_desync_length")
    local ds_length = ui.add_slider_int("Desync Length", "ds_length", 0, 60, 47)

    local function ltd()

        if lowdelta123:is_active() then
            desync1:set_value(17) --- Desync value when lowdelta bind actived
        else
            desync1:set_value(ds_length:get_value()) --- Desync value when lowdelta bind not actived
        end
    end


    client.register_callback("paint", ltd)

    local function on_tab2()
        if tab:get_value() == 1 then
            pz:set_visible(true)
            at:set_visible(true)
            fds:set_visible(true)
            lua_ah_manual_left:set_visible(true)
            lua_ah_manual_right:set_visible(true)
            lowdelta123:set_visible(true)
            ds_length:set_visible(true)
        else
            pz:set_visible(false)
            at:set_visible(false)
            fds:set_visible(false)
            lua_ah_manual_left:set_visible(false)
            lua_ah_manual_right:set_visible(false)
            lowdelta123:set_visible(false)
            ds_length:set_visible(false)
        end
    end
    client.register_callback("paint", on_tab2)
    --Start Notify
    client.notify("Welcome back, "..client.get_username().."!")
    client.notify("Lua Version: 1.5")
    client.notify("[+]Low Delta,[/]Reworked Visuals,[/]Reworked Indicators")

    --Downlaod files


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

    CreateDir("nix\\icons\\")
    Download('https://raw.githubusercontent.com/SQWAT0/shuuko/main/soufiw.png', 'nix\\icons\\soufiw.png') -- 1params = link, 2params = directory to upload







    local v_t = ui.add_combo_box("Visuals Type", "v_t", {"Screen", "World"}, 0)

    --indicators near crosshair 

    local c_c2 = ui.add_color_edit("Indicators near crosshair", "c_c2", true, color_t.new(132, 161, 255, 255))
    local indicators = ui.add_check_box("Indicator near crosshair", "indicators", true)
    local s_i = ui.add_combo_box("Desync Side indicator", "s_i", {"Shuuko.lua", "<>"}, 0)

    if indicators:get_value() == true then
        s_i:set_visible(true)
    end
    if indicators:get_value() == false then
        s_i:set_visible(false)

    end
   
    
    local font2 = renderer.setup_font("nix/fonts/Tahoma.ttf", 50, 0)

    

    client.register_callback("create_move", function()
        local entity = entitylist.get_players(0)

        if minimumdamage:is_active() then
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

    

    

    client.register_callback("create_move", function()
        local entity = entitylist.get_players(0)

	    if baimb:is_active() then
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
    end)

    local screen = engine.get_screen_size()
    local antihit_antiaim_flip_bind = ui.get_key_bind("antihit_antiaim_flip_bind")
    local rage_active_exploit = ui.get_combo_box("rage_active_exploit")
    local rage_active_exploit_bind = ui.get_key_bind("rage_active_exploit_bind")

    local aef = ui.get_check_box("antihit_extra_fakeduck")
    local aefb = ui.get_key_bind("antihit_extra_fakeduck_bind")
    aef:set_value(true)
    rage_active_exploit_bind:set_key(0)
    local function on_paint()
        
        
        
        
        local aafb = antihit_antiaim_flip_bind:is_active()


        if s_i:get_value() == 0 then

            if aafb == true and engine.is_connected() and indicators:get_value() == true then
                renderer.text("Shuuko", font, vec2_t.new(screen.x/ 2 - 30, screen.y/ 2 - -12), 16, color_t.new(0, 0, 0 ,255))
                renderer.text(".lua", font, vec2_t.new(screen.x/ 2 + 12, screen.y/ 2 - -12), 16, color_t.new(0, 0, 0, 255))
                renderer.text("Shuuko", font, vec2_t.new(screen.x/ 2 - 29, screen.y/ 2 - -12), 16, color_t.new(255, 255, 255 ,255))
                renderer.text(".lua", font, vec2_t.new(screen.x/ 2 + 13, screen.y/ 2 - -12), 16, c_c2:get_value()) 
            end
            if aafb == false and engine.is_connected() and indicators:get_value() == true then
                renderer.text("Shuuko", font, vec2_t.new(screen.x/ 2 - 30, screen.y/ 2 - -12), 16, color_t.new(0, 0, 0 ,255))
                renderer.text(".lua", font, vec2_t.new(screen.x/ 2 + 12, screen.y/ 2 - -12), 16, color_t.new(0, 0, 0, 255))
                renderer.text("Shuuko", font, vec2_t.new(screen.x/ 2 - 29, screen.y/ 2 - -12), 16, c_c2:get_value())
                renderer.text(".lua", font, vec2_t.new(screen.x/ 2 + 13, screen.y/ 2 - -12), 16, color_t.new(255, 255, 255 ,255))
            end
        else
            if aafb == true and engine.is_connected() and indicators:get_value() == true then
                renderer.text("Shuuko", font, vec2_t.new(screen.x/ 2 - 30, screen.y/ 2 - -12), 16, color_t.new(0, 0, 0 ,255))
                renderer.text(".lua", font, vec2_t.new(screen.x/ 2 + 12, screen.y/ 2 - -12), 16, color_t.new(0, 0, 0, 255))
                renderer.text("Shuuko", font, vec2_t.new(screen.x/ 2 - 29, screen.y/ 2 - -12), 16, color_t.new(255, 255, 255 ,255))
                renderer.text(".lua", font, vec2_t.new(screen.x/ 2 + 13, screen.y/ 2 - -12), 16, color_t.new(255, 255, 255 ,255))
                
                
            end
            if aafb == false and engine.is_connected() and indicators:get_value() == true then
                renderer.text("Shuuko", font, vec2_t.new(screen.x/ 2 - 30, screen.y/ 2 - -12), 16, color_t.new(0, 0, 0 ,255))
                renderer.text(".lua", font, vec2_t.new(screen.x/ 2 + 12, screen.y/ 2 - -12), 16, color_t.new(0, 0, 0, 255))
                renderer.text("Shuuko", font, vec2_t.new(screen.x/ 2 - 29, screen.y/ 2 - -12), 16, color_t.new(255, 255, 255 ,255))
                renderer.text(".lua", font, vec2_t.new(screen.x/ 2 + 13, screen.y/ 2 - -12), 16, color_t.new(255, 255, 255 ,255)) 
            end
        end
       
        if s_i:get_value() == 1 and indicators:get_value() == true and aafb == true and engine.is_connected() then
            renderer.text("<", font, vec2_t.new(screen.x / 2 - 50, screen.y / 2 - 15), 30, color_t.new(255, 255, 255, 255))
            renderer.text(">", font, vec2_t.new(screen.x / 2 + 35, screen.y / 2 - 15), 30, c_c2:get_value())
        end
        
        if s_i:get_value() == 1 and indicators:get_value() == true and aafb == false and engine.is_connected() then
                renderer.text("<", font, vec2_t.new(screen.x / 2 - 50, screen.y / 2 - 15), 30, c_c2:get_value())
                renderer.text(">", font, vec2_t.new(screen.x / 2 + 35, screen.y / 2 - 15), 30, color_t.new(255, 255, 255, 255))
        end
     
        
        if indicators:get_value() == true and engine.is_connected() then
            offset = 35
            renderer.line(vec2_t.new(screen.x / 2 - 28, screen.y / 2 + 36), vec2_t.new(screen.x / 2 + 29, screen.y / 2 + 36), color_t.new(0, 0, 0, 255))
            renderer.line(vec2_t.new(screen.x / 2 - 29, screen.y / 2 + 35), vec2_t.new(screen.x / 2 + 30, screen.y / 2 + 35), color_t.new(255, 255, 255, 255))
        end

        if dt:is_active() and engine.is_connected() and indicators:get_value() == true then
            rage_active_exploit:set_value(2)
            rage_active_exploit_bind:set_key(dt:get_key())
            rage_active_exploit_bind:set_type(dt:get_type())
            renderer.text(">Doubletap", font2, vec2_t.new(screen.x/ 2 - 31, screen.y/ 2 - -offset), 15, color_t.new(0, 0, 0, 255))
            renderer.text(">Doubletap", font2, vec2_t.new(screen.x/ 2 - 30, screen.y/ 2 - -offset), 15, color_t.new(163, 245, 39, 255))
            offset = offset + 10
        end
        if hs:is_active() and engine.is_connected() and indicators:get_value() == true then
            rage_active_exploit:set_value(1)
            rage_active_exploit_bind:set_key(hs:get_key())
            rage_active_exploit_bind:set_type(hs:get_type())
            renderer.text(">Hideshots", font2, vec2_t.new(screen.x/ 2 - 31, screen.y/ 2 - -offset), 15, color_t.new(0, 0, 0, 255))
            renderer.text(">Hideshots", font2, vec2_t.new(screen.x/ 2 - 30, screen.y/ 2 - -offset), 15, color_t.new(39, 245, 215, 255))
            offset = offset + 10
        end

       

        if fd:is_active() and engine.is_connected() and indicators:get_value() == true then
            aefb:set_key(fd:get_key())
            aefb:set_type(fd:get_type())
            renderer.text(">Fakeduck", font2, vec2_t.new(screen.x/ 2 - 31, screen.y/ 2 - -offset), 15, color_t.new(0, 0, 0, 255))
            renderer.text(">Fakeduck", font2, vec2_t.new(screen.x/ 2 - 30, screen.y/ 2 - -offset), 15, color_t.new(245, 40, 145, 255))
            offset = offset + 10
        end

        local au = ui.get_check_box("antihit_extra_autopeek")
        local au_b = ui.get_key_bind("antihit_extra_autopeek_bind")

        if au:get_value() == true and au_b:is_active() and engine.is_connected() and indicators:get_value() == true then
            renderer.text(">Autopeek", font2, vec2_t.new(screen.x / 2 - 31, screen.y / 2 - -offset), 15, color_t.new(0, 0, 0, 255))
            renderer.text(">Autopeek", font2, vec2_t.new(screen.x / 2 - 30, screen.y / 2 - -offset), 15, color_t.new(132, 187, 255, 255))
            offset = offset + 10
        end

        if baimb:is_active() and engine.is_connected() and indicators:get_value() == true then
            renderer.text(">Baim", font2, vec2_t.new(screen.x / 2 - 31, screen.y / 2 - -offset), 15, color_t.new(0, 0, 0, 255))
            renderer.text(">Baim", font2, vec2_t.new(screen.x / 2 - 30, screen.y / 2 - -offset), 15, color_t.new(245, 188, 66, 255))
            offset = offset + 10
        end

        if minimumdamage:is_active() and engine.is_connected() and indicators:get_value() == true then
            renderer.text(">Min-Dmg", font2, vec2_t.new(screen.x / 2 - 31, screen.y / 2 - -offset), 15, color_t.new(0, 0, 0, 255))
            renderer.text(">Min-Dmg", font2, vec2_t.new(screen.x / 2 - 30, screen.y / 2 - -offset), 15, color_t.new(245, 242, 66, 255))
            offset = offset + 10
        end
        
    end
    client.register_callback("paint", on_paint)
    

    local antihit_antiaim_at_targets = ui.get_check_box("antihit_antiaim_at_targets")
    local at = ui.add_key_bind("At Targets", "at", 0, 2)
    antihit_antiaim_at_targets:set_value(false)
    local font = renderer.setup_font("nix/fonts/Tahoma.ttf", 50, 0)


    local screen = engine.get_screen_size()

    local function on_create_move()

        if at:is_active()  then
            antihit_antiaim_at_targets:set_value(true)
        else
            antihit_antiaim_at_targets:set_value(false)	
        end
    end

    client.register_callback("create_move", on_create_move)





    client.register_callback("paint", on_paint)

    









    -------------
    ---Visuals---
    -------------

    local distation = ui.add_slider_int('Thirdperson distation', 'distation', 30, 150, 80)

    --custom thirdperson distance

    local tpp = se.get_convar('cam_idealdist')
    client.register_callback('create_move', function()
    tpp:set_int(distation:get_value())
    end)

    

    --watermark

    local c_c = ui.add_color_edit("Watermark Color", "c_c", true, color_t.new(132, 161, 255, 255))
    local flvalue = ui.get_slider_int("antihit_fakelag_limit")
    local Watermark_enabled = ui.add_check_box("Enable Watermark", "Watermark_enabled", false)
    local verdana = renderer.setup_font("nix/fonts/Tahoma.ttf", 50, 0)
    local screen = engine.get_screen_size()
    local pos, pos2 = vec2_t.new(screen.x - 325, 5), vec2_t.new(screen.x - 5, 30)


    local pos3, pos4 = vec2_t.new(screen.x - 325, 5), vec2_t.new(screen.x - 5, 30)

    function get_fps()
        frametime = globalvars.get_frame_time()
        local fps = math.floor(1000 / (frametime * 1000))
        if fps < 10 then fps = "   " .. tostring(fps)
        elseif fps < 100 then fps = "  " .. tostring(fps) end
        return fps
    end
    function get_time()
        local hours, minutes, seconds = client.get_system_time()
        if hours < 10 then hours = "0" .. tostring(hours) end
        if minutes < 10 then minutes = "0" .. tostring(minutes) end
        if seconds < 10 then seconds = "0" .. tostring(seconds) end
        return hours .. ":" .. minutes .. ":" .. seconds
    end
    function get_ping()
        local ping = math.floor(se.get_latency())
        if ping < 10 then ping = " " .. tostring(ping) end
        return ping
    end

    function get_tickr()
        local tickr = 1.0 / globalvars.get_interval_per_tick()
        return tickr
    end

    local username = client.get_username()

    function draw_watermark()
    if Watermark_enabled:get_value() == true then
        renderer.filled_polygon({ vec2_t.new(screen.x - 280, 6), vec2_t.new(screen.x - 280, 30), vec2_t.new(screen.x - 280, 6) }, color_t.new(0, 0, 0, 0)) --0 25 25
        local inner_pos1, inner_pos2 = vec2_t.new(screen.x - 300, 15), vec2_t.new(screen.x - 100, 65)
        renderer.rect_filled(pos, pos2, color_t.new(30,30,30,100))
        
    
    
        local fpos1, fpos2 = vec2_t.new(screen.x - 325, 3), vec2_t.new(screen.x - 5, 6) 
        renderer.rect_filled_fade(fpos1, fpos2, c_c:get_value(), c_c:get_value(), c_c:get_value(), c_c:get_value())
        
    
        
        local fpos = vec2_t.new(screen.x - 310, 10) 
        renderer.text("Shuuko.lua - " ..username.." - ".."fps:"..get_fps()..  " - delay:" .. get_ping().."ms".." - "..get_time(), verdana, fpos, 15, color_t.new(255, 255, 255, 255))
        
        end

    end

    
    

    local function on_paint()
        if Watermark_enabled:get_value() == true then
            renderer.line(vec2_t.new(screen.x/ 2 + 806, screen.y/ 2 - 505), vec2_t.new(screen.x/ 2 + 940, screen.y/ 2 - 505), c_c:get_value())
            renderer.line(vec2_t.new(screen.x/ 2 + 806, screen.y/ 2 - 506), vec2_t.new(screen.x/ 2 + 940, screen.y/ 2 - 506), c_c:get_value())
            renderer.rect_filled(vec2_t.new(screen.x/ 2 + 806, screen.y/ 2 - 503), vec2_t.new(screen.x/ 2 + 940, screen.y/ 2 - 483), color_t.new(30, 30, 30, 130))
            renderer.text("FL: "..flvalue:get_value().." | ", verdana, vec2_t.new(screen.x/ 2 + 816, screen.y/ 2 - 500), 15, color_t.new(255, 255, 255, 255))
            renderer.text("Pitch:", verdana, vec2_t.new(screen.x/ 2 + 862, screen.y/ 2 - 500), 15, color_t.new(255, 255, 255, 255))
        end

        if aap:get_value() == 1 and Watermark_enabled:get_value() == true then
        
            renderer.text("Down", verdana, vec2_t.new(screen.x/ 2 + 894, screen.y/ 2- 500), 15, color_t.new(255, 255, 255, 255))
               
        end

        if aap:get_value() == 2 and Watermark_enabled:get_value() == true then
        
            renderer.text("Zero", verdana, vec2_t.new(screen.x/ 2 + 894, screen.y/ 2- 500), 15, color_t.new(255, 255, 255, 255))
               
        end

        if aap:get_value() == 3 and Watermark_enabled:get_value() == true then
        
            renderer.text("Up", verdana, vec2_t.new(screen.x/ 2 + 894, screen.y/ 2- 500), 15, color_t.new(255, 255, 255, 255))
               
        end
    end

   

    
    client.register_callback("paint", draw_watermark)
    client.register_callback("paint", on_paint)
    

   
    
    
       

    
    
    

    --Damage Indicator 






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
    local font1 = setup_font("nix/fonts/Tahoma.ttf", 14, 8);
    
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
    local t_p = ui.get_key_bind("visuals_other_thirdperson_bind")
    local t_p2 = ui.get_check_box("visuals_other_thirdperson")
    local my_texture = renderer.setup_texture("nix/icons/soufiw.png")
    local font = renderer.setup_font("nix/fonts/Tahoma.ttf", 50, 0)
    local tpactive = t_p:is_active()
    local screen = engine.get_screen_size()
    local pets = ui.add_combo_box("Pet", "pets", {"None", "Soufiw"}, 0)

    local function on_paint()
        if pets:get_value() == 1 and t_p:is_active() and t_p2:get_value() == true and engine.is_connected() then
            renderer.text("Soufiw", font, vec2_t.new(screen.x/ 2 + 531, screen.y/ 2 + 250), 20, color_t.new(0, 0, 0, 255))
            renderer.text("Soufiw", font, vec2_t.new(screen.x/ 2 + 530, screen.y/ 2 + 250), 20, color_t.new(255, 255, 255, 255))
            renderer.texture(my_texture, vec2_t.new(screen.x - 300,screen.y - 300), vec2_t.new(screen.x - 500,screen.y - 100), color_t.new(255, 255, 255, 255))
        end
    end

    client.register_callback("paint", on_paint)


    local screensize = engine.get_screen_size()
    local world_to_screen = se.world_to_screen
    local render_line = renderer.line
    local render_filled_polygon = renderer.filled_polygon
    local vec3_t_new = vec3_t.new
    local cos = math.cos
    local sin = math.sin
    local hat_type = ui.add_combo_box("Hat type", "hat_type", {"None", "Nimbus", "China hat"}, 0)

    --nimbus color

    local nimbus_color = ui.add_color_edit('Nimbus color', 'nimbus_color', true, color_t.new(255, 255, 255, 255))

    local function hattype_paint()
        if hat_type:get_value() == 1 and tab:get_value() == 2 and v_t:get_value() == 1 then
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


    local function on_paint()
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


    client.register_callback('paint', on_paint)


    --china hat
    local screensize = engine.get_screen_size()
    local world_to_screen = se.world_to_screen
    local render_line = renderer.line
    local render_filled_polygon = renderer.filled_polygon
    local vec3_t_new = vec3_t.new
    local cos = math.cos
    local sin = math.sin

    --china hat color
    local ch_color1 = ui.add_color_edit('China hat color', 'ch_color1', true, color_t.new(255, 255, 255, 120))


    local function hattype_paint2()
        if hat_type:get_value() == 2 and tab:get_value() == 2 and v_t:get_value() == 1 then
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

    local viewmodel_on_scope123 = ui.add_check_box("Viewmodel on scope", "viewmodel_on_scope123", true)



    local function on_paint()
        local player = entitylist.get_local_player()
        local is_scoped = player:get_prop_bool( se.get_netvar( "DT_CSPlayer", "m_bIsScoped" ) )

        local view_scope = viewmodel_on_scope123:get_value()

        
        local fov_cs_debug = se.get_convar("fov_cs_debug")

    

        if view_scope and is_scoped then
            fov_cs_debug:set_float(90)
        else
            fov_cs_debug:set_float(0)
        end
    end
    client.register_callback("paint", on_paint)

    local draw_impact = ui.add_check_box("Server bullet impact", "draw_impact", false)

    local function impacts()

        local sv_showimpacts = se.get_convar("sv_showimpacts")

        if draw_impact:get_value() then
            sv_showimpacts:set_float(1)
        else
            sv_showimpacts:set_float(0)
        end
    end
    client.register_callback("paint", impacts)


    local function on_tab3()
        if tab:get_value() == 2 and v_t:get_value() == 1 then
            distation:set_visible(true)           
            h1t_enable:set_visible(true)            
            hat_type:set_visible(true)
            viewmodel_on_scope123:set_visible(true)
            draw_impact:set_visible(true)
        else           
            distation:set_visible(false)           
            h1t_enable:set_visible(false)          
            hat_type:set_visible(false)
            viewmodel_on_scope123:set_visible(false)
            draw_impact:set_visible(false)
        end

        if v_t:get_value() == 0 and tab:get_value() == 2 then
            c_c2:set_visible(true)
            c_c:set_visible(true)
            Watermark_enabled:set_visible(true)
            indicators:set_visible(true)
            s_i:set_visible(true)
            pets:set_visible(true)
        else
            c_c2:set_visible(false)
            c_c:set_visible(false)
            Watermark_enabled:set_visible(false)
            indicators:set_visible(false)
            s_i:set_visible(false)
            pets:set_visible(false)
        end

        if tab:get_value() == 2 then
            v_t:set_visible(true)
        else
            v_t:set_visible(false)
        end
    end
    client.register_callback("paint", on_tab3)

    local function on_tab3_2()
        if h1t_enable:get_value() == true and tab:get_value() == 2 then
            h1t_duration:set_visible(true)
            h1t_clr:set_visible(true)
        else
            h1t_duration:set_visible(false)
            h1t_clr:set_visible(false)   
        end
    end
    client.register_callback("paint", on_tab3_2)

    

    ----------
    ---Misc---
    ----------

    
  




    
    
    

    


    
    --buybot


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

    b_w = ui.add_combo_box("[BuytBot]Primary", "_weapons", weapons_name_list, 0)
    b_p = ui.add_combo_box("[BuyBot]Second", "_pistols", pistols_name_list, 0)
    b_o = ui.add_multi_combo_box("[BuyBot]Other", "_other", other_name_list, { false, false, false, false, false, false })


    local m_l = ui.add_check_box("Miss logs", "m_l", false)

    client.register_callback("shot_fired", function(shot_info) 
        if shot_info.result ~= "hit" and not shot_info.manual and m_l:get_value() == true then
            client.notify("missed shot due to " .. shot_info.result)
        end
    end)

    local a_b = ui.get_check_box("misc_antidll_bypass")

    local function miss_logs()
        local ml = m_l:get_value()
        local ab = a_b:get_value()
        if ml == true and ab == true then
            client.notify("Please disable Antidll Bypass")
            client.notify("Path Misc>Antidll Bypass")
        end
    end
    client.register_callback("paint", miss_logs)

    

    local function on_tab4()
        if tab:get_value() == 3 then
            
            m_l:set_visible(true)
            b_w:set_visible(true)
            b_p:set_visible(true)
            b_o:set_visible(true)
            
        else
            
            m_l:set_visible(false)
            b_w:set_visible(false)
            b_p:set_visible(false)
            b_o:set_visible(false)
            
            
        end
    end

    
    client.register_callback("paint", on_tab4)


    
    
    
else
    engine.execute_client_cmd("clear")
   
    client.notify("To buy -----> discord.gg/Dnv4jWD3x3")
end