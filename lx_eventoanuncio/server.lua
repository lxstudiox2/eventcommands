ESX = exports['es_extended']:getSharedObject()

local allowedGroups = {
    admin = true,
    superadmin = true,
    adminevo = true
}

RegisterCommand('evento', function(source, args, raw)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local group = xPlayer.getGroup()
    if not allowedGroups[group] then
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            title = 'Evento',
            description = 'No tenés permisos para usar /evento'
        })
        return
    end

    local texto = table.concat(args, " ")
    if texto == "" then
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            title = 'Evento',
            description = 'Uso correcto: /evento [mensaje]'
        })
        return
    end

    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)

    TriggerClientEvent('m7_eventoanuncio:mostrar', -1, {
        texto = texto,
        autor = GetPlayerName(source),
        coords = coords
    })
end, false)
