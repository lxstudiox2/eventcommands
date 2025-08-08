local destinoEvento = nil
local anuncioVisible = false
local yaFueUsado = false

RegisterNetEvent('m7_eventoanuncio:mostrar', function(data)
    destinoEvento = data.coords
    yaFueUsado = false
    anuncioVisible = true

    SendNUIMessage({
        type = "mostrarAnuncio",
        texto = data.texto,
        autor = data.autor
    })

    CreateThread(function()
        Wait(60000)
        if anuncioVisible then
            SendNUIMessage({ type = "ocultarAnuncio" })
            anuncioVisible = false
            destinoEvento = nil
        end
    end)
end)

RegisterNUICallback("teleportarEvento", function(_, cb)
    if yaFueUsado then
        lib.notify({
            type = 'error',
            title = 'Evento',
            description = 'Ya usaste la teletransportación.',
            position = 'center-right'
        })
    elseif destinoEvento then
        SetEntityCoords(PlayerPedId(), destinoEvento.x, destinoEvento.y, destinoEvento.z, false, false, false, true)
        yaFueUsado = true
        lib.notify({
            type = 'success',
            title = 'Evento',
            description = 'Fuiste teletransportado al evento.',
            position = 'center-right'
        })
    end
    cb("ok")
end)

RegisterKeyMapping('eventof4', 'Ir al evento (anuncio)', 'keyboard', 'F4')

RegisterCommand('eventof4', function()
    if not anuncioVisible then return end

    if yaFueUsado then
        lib.notify({
            type = 'error',
            title = 'Evento',
            description = 'Ya usaste la teletransportación.',
            position = 'center-right'
        })
        return
    end

    SendNUIMessage({ type = "presionoF3" })
end, false)
