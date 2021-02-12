Config = {
    Locations = {
        [1] = {
            ["Blip"] = { --> Position de l'hopital à changer.
                ["x"] = 459.21, ["y"] = -1008.07, ["z"] = 28.26
            },

            ["Service"] = { --> Position prise de service à changer.
                ["x"] = 450.174, ["y"] = -992.276, ["z"] = 30.6896
            },

            ["Garage"] = {

                --> Position d'accès au garage medic à changer.
                ["GaragePosition"] = {
                    ["x"] = 459.21, ["y"] = -1008.07, ["z"] = 28.26
                },

                --> Position du véhicule pour le ranger à changer.
                ["RentrerVehicule"] = { 
                    ["x"] = 451.89, ["y"] = -997.19, ["z"] = 25.76
                },

                ["MenuGaragePos"] = {
                    ["x"] = 405.467, ["y"] = -951.877, ["z"] = -99.0041
                }
            },
        },
    },
}

Config.Medic = {
    job = " ",
    grade = " ",
    service = false
}
