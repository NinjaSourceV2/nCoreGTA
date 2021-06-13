----------------
-- PLAYER GETTER EXPORTS--
----------------

--exports.nCoreGTA:GetPlayerJob()
function GetPlayerJob()
    return config.Player.job
end

--exports.nCoreGTA:GetPlayerJobGrade()
function GetPlayerJobGrade()
    return config.Player.grade
end

--exports.nCoreGTA:GetIsPlayerInService()
function GetIsPlayerInService()
    return config.Player.enService
end

--exports.nCoreGTA:GetPlayerInv()
function GetPlayerInv()
    return {inventaire = config.Player.inventaire, weight = config.Player.weight}
end

--exports.nCoreGTA:GetIsFirstConnexion()
function GetIsFirstConnexion()
    return config.Player.isFirstConnexion
end

--exports.nCoreGTA:GetIsPlayerAdmin()
function GetIsPlayerAdmin()
    return config.Player.isAdmin
end