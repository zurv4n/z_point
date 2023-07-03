local keypress = 0x80F28E95 --'L' by default


print('z_point loaded')

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        -- https://github.com/mja00/redm-shit/blob/master/nuiweaponspawner/config.lua
        -- L
        if IsControlJustPressed(0,keypress) and IsInputDisabled(0)  then
            local ped = PlayerPedId()
            if DoesEntityExist(ped) and not IsEntityDead(ped) then
                RequestAnimDict("ai_react@point@base")    
                while not HasAnimDictLoaded("ai_react@point@base") do 
                    Citizen.Wait(100)
                end
                if IsEntityPlayingAnim(ped, "ai_react@point@base", "point_fwd", 3) then
                    ClearPedSecondaryTask(ped)
                else
                    TaskPlayAnim(ped, "ai_react@point@base", "point_fwd", 2.0, -1.0, 120000, 31, 0, true, 0, false, 0, false)
                end
            end
        end
    end
end)