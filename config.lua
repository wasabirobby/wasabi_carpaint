-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
Config = {}

Config.checkForUpdates = true -- Check for Updates?

Config.SprayTime = 10 -- Time in seconds

Config.Paint = {--Follow syntax when adding/removing/editing the configurable car paints.
    {
        item = 'blue_paint', -- Item name of usable car paint
        primary_color = 83, -- Primary color of vehicle when using this paint. See https://pastebin.com/pwHci0xK for more options.
        secondary_color = 83, -- Secondary color of vehicle when using this paint. See https://pastebin.com/pwHci0xK for more options.
        particleColor = {-- Particle color of spray from paint can
            r = 0, --Red
            g = 0, --Green
            b = 1.0 --Blue
        }
    },

    {
        item = 'red_paint',
        primary_color = 39,
        secondary_color = 39,
        particleColor = {
            r = 1.0,
            g = 0,
            b = 0
        }
    },

    {
        item = 'green_paint',
        primary_color = 128,
        secondary_color = 128,
        particleColor = {
            r = 0,
            g = 1.0,
            b = 0
        }
    },

    {
        item = 'black_paint', 
        primary_color = 12, 
        secondary_color = 12,
        particleColor = {
            r = 1.0,
            g = 1.0,
            b = 1.0,
        }
    },

    {
        item = 'white_paint', 
        primary_color = 131, 
        secondary_color = 131,
        particleColor = {
            r = 1.0,
            g = 1.0,
            b = 1.0,
        }
    },
}




RegisterNetEvent('wasabi_carpaint:notify')
AddEventHandler('wasabi_carpaint:notify', function(message)
    -- Place notification system info here, ex: exports['mythic_notify']:SendAlert('inform', message)
    ESX.ShowNotification(message)
end)

Language = {
    ['someone_driving'] = 'Can not paint while someone is in driver seat!',
    ['no_nearby'] = 'No nearby vehicle that you can paint.',
    ['not_in_car'] = 'You can\'t do this right now.',
    ['cheater_kick'] = 'Nice try.',
}
