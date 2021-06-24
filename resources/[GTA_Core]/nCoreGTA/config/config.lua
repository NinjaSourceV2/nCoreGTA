--@Super.Cool.Ninja
config = {}
config.Player = {}

config.versionCore = "Version 1.8"
config.activerPoliceWanted = false
config.activerPvp = true 
config.salaireTime = 900000
config.timerSignalEMS = 60000 --> Definis le temps d'attente entre chaque envoi de signal pour les ems si le joueur est dans le coma.
config.timerPlayerSyncPos = 60000 --> Toute les 60 secondes une synchronisation de la position du player est effectuer.
config.timerPlayerSynchronisation = 300000 --> Toute les 5 Minutes une synchronisation du player est effectuer.

--> Valeur de départ Joueur : 
config.argentPropre = 500
config.argentSale = 150
config.banque = 5000


config.maxWeight = 100 --> Max Slot.
config.itemList = {

    --> Medical : 
    ["seringe_adrenaline"] = {label = "Seringe-Adrenaline", weight = 1, type = "medical", prop = "prop_syringe_01"},

    --> Nourriture : 
    ["pain"] = {label = "Pain", weight = 1, type = "nourriture", prop = "v_ret_247_bread1"},

    --> Boissons : 
    ["soda"] = {label = "Soda", weight = 1, type = "boissons", prop = "ng_proc_sodacan_01a"},
    ["eau"] = {label = "Eau", weight = 1, type = "boissons", prop = "prop_ld_flow_bottle"},
    
    --> Armes : 
    ["pistol"] = {label = "Pistolet", weight = 1, type = "armes", prop = "w_pi_pistol"},
    ["pistol_ammo"] = {label = "9mm", weight = 1, type = "armes", prop = "w_pi_sns_pistol_luxe_mag1"},
    ["uzi"] = {label = "Uzi", weight = 1, type = "armes", prop = "w_sb_microsmg_luxe"},
    ["uzi_ammo"] = {label = "Munition Uzi", weight = 1, type = "armes", prop = "w_sb_smgmk2_mag1"},
    ["pistolcombat"] = {label = "Pistolet de combat", weight = 1, type = "armes", prop = "w_pi_combatpistol"},
    ["appistol"] = {label = "AP Pistolet", weight = 1, type = "armes", prop = "w_pi_appistol_luxe"},
    ["pistol50"] = {label = "Pistolet-50", weight = 1, type = "armes", prop = "w_pi_pistol50_luxe"},
    ["microsmg"] = {label = "Micro SMG", weight = 1, type = "armes", prop = "w_sb_microsmg_luxe"},
    ["fusilsmg"] = {label = "Fusil SMG", weight = 1, type = "armes", prop = "w_sb_assaultsmg"},
    ["ak47"] = {label = "AK", weight = 1, type = "armes", prop = "w_ar_assaultrifle_luxe"},
    ["m4"] = {label = "M4", weight = 1, type = "armes", prop = "w_ar_assaultrifle"},
    ["rifle"] = {label = "Fusil", weight = 1, type = "armes", prop = "w_ar_carbinerifle"},
    ["mg"] = {label = "MG", weight = 1, type = "armes", prop = "w_sb_smg"},
    ["combatmg"] = {label = "Fusil Combat MG", weight = 1, type = "armes", prop = "w_sb_smg"},
    ["shotgun"] = {label = "Fusil à pompe", weight = 1, type = "armes", prop = "h4_prop_h4_pumpshotgunh4"},
    ["cannonscie"] = {label = "Fusil à canon scié", weight = 1, type = "armes", prop = "w_sg_pumpshotgun"},
    ["assaultshotgun"] = {label = "Fusil à pompe auto", weight = 1, type = "armes", prop = "w_sg_assaultshotgun"},
    ["fusilbull"] = {label = "Fusil BullPup", weight = 1, type = "armes", prop = "w_sg_bullpupshotgun"},
    ["tazer"] = {label = "Tazer", weight = 1, type = "armes", prop = "w_pi_stungun"},
    ["sniperrifle"] = {label = "Fusil Sniper", weight = 1, type = "armes", prop = "w_sr_sniperrifle"},
    ["heavysniper"] = {label = "Fusil Sniper Lourd", weight = 1, type = "armes", prop = "w_sr_heavysniper"},
    ["remotesniper"] = {label = "Fusil Sniper Elite", weight = 1, type = "armes", prop = "w_sr_heavysnipermk2"},
    ["lancegrenade"] = {label = "Lance grenade", weight = 1, type = "armes", prop = "w_lr_grenadelauncher"},
    ["rpg"] = {label = "Lance-roquettes", weight = 1, type = "armes", prop = "w_lr_rpg"},
    ["minigun"] = {label = "Mini-Gun", weight = 1, type = "armes", prop = "prop_minigun_01"},
    ["grenade"] = {label = "Grenade", weight = 1, type = "armes", prop = "w_ex_grenadefrag"},
    ["grenadecoller"] = {label = "Grenade collante", weight = 1, type = "armes", prop = "w_ex_grenadefrag"},
    ["fumi"] = {label = "Fumigène", weight = 1, type = "armes", prop = "w_ex_grenadesmoke"},
    ["gaz"] = {label = "Grenade lacrymo", weight = 1, type = "armes", prop = "prop_gas_grenade"},
    ["molotov"] = {label = "Cocktail Molotov", weight = 1, type = "armes", prop = "w_ex_molotov"},
    ["extincteur"] = {label = "Extincteur", weight = 1, type = "armes", prop = "prop_fire_exting_2a"},
    ["bidon"] = {label = "Bidon essence", weight = 1, type = "armes", prop = "prop_jerrycan_01a"},
    ["ball"] = {label = "Balle", weight = 1, type = "armes", prop = "w_am_baseball"},
    ["bouteil"] = {label = "Bouteil en verre", weight = 1, type = "armes", prop = "prop_w_me_bottle"},
    ["dagger"] = {label = "Dague", weight = 1, type = "armes", prop = "prop_w_me_dagger"},
    ["pistol_vintage"] = {label = "Pistolet Vintage", weight = 1, type = "armes", prop = "w_pi_vintage_pistol"},
    ["artifice"] = {label = "Lanceur Pyrotechnique", weight = 1, type = "armes", prop = "w_lr_firework"},
    ["neige"] = {label = "Boule de Neige", weight = 1, type = "armes", prop = "w_ex_snowball"},
    ["flaregun"] = {label = "Pistolet de détresse", weight = 1, type = "armes", prop = "w_pi_flaregun"},
    ["hache"] = {label = "Hache", weight = 1, type = "armes", prop = "prop_ld_fireaxe"},
    ["marteau"] = {label = "Marteau", weight = 1, type = "armes", prop = "prop_tool_hammer"},
    ["batte"] = {label = "Batte", weight = 1, type = "armes", prop = "p_cs_bbbat_01"},
    ["golf"] = {label = "Club de golf", weight = 1, type = "armes", prop = "prop_golf_iron_01"},
    ["pied_biche"] = {label = "Pied de biche", weight = 1, type = "armes", prop = "prop_ing_crowbar"},
    ["couteau"] = {label = "Couteau", weight = 1, type = "armes", prop = "prop_cs_bowie_knife"},
    ["matraque"] = {label = "Matraque", weight = 1, type = "armes", prop = "w_me_nightstick"},
    ["machette"] = {label = "Machette", weight = 1, type = "armes", prop = "prop_ld_w_me_machette"},
    ["revolver"] = {label = "Revolver", weight = 1, type = "armes", prop = "w_pi_revolvermk2"},
    ["flashlight"] = {label = "Lampe de poche", weight = 1, type = "armes", prop = "w_me_flashlight"},
    ["flare"] = {label = "Flare", weight = 1, type = "armes", prop = "prop_flare_01b"},
    ["pistol_mk2"] = {label = "Pistolet Mk2", weight = 1, type = "armes", prop = "w_pi_sns_pistolmk2"},
    ["smg_mk2"] = {label = "SMG MK2", weight = 1, type = "armes", prop = "w_sb_smgmk2"},
    ["snipermk2"] = {label = "Fusil Sniper Lourd Mk2", weight = 1, type = "armes", prop = "w_sr_heavysnipermk2"},
    ["firework_ammo"] = {label = "artifice", weight = 1, type = "armes", prop = "w_lr_firework"},
    ["rifle_ammo"] = {label = "Munition carabine", weight = 1, type = "armes", prop = "w_ar_carbinerifle_mag1"},
    ["mg_ammo"] = {label = "Munition mg", weight = 1, type = "armes", prop = "w_ar_carbinerifle_mag1"},
    ["shotgun_ammo"] = {label = "Munition pompe", weight = 1, type = "armes", prop = "w_sg_pumpshotgunh4_mag1"},
    ["stungun_ammo"] = {label = "tazer chargeur", weight = 1, type = "armes", prop = "w_pi_stungun"},
    ["sniper_ammo"] = {label = "Munition sniper", weight = 1, type = "armes", prop = "w_ar_carbinerifle_mag1"},
    ["sniper_remote_ammo"] = {label = "Munition sniper elite", weight = 1, type = "armes", prop = "w_ar_carbinerifle_mag1"},
    ["minigun_ammo"] = {label = "Munition mini-gun", weight = 1, type = "armes", prop = "w_ar_carbinerifle_mag1"},
    ["grenadelauncher_ammo"] = {label = "Munition lance-grenade", weight = 1, type = "armes", prop = "prop_box_ammo03a_set2"},
    ["grenadelauncher_smoke_ammo"] = {label = "munition fumigène", weight = 1, type = "armes", prop ="prop_box_ammo03a_set2"},
    ["rpg_ammo"] = {label = "roquette", weight = 1, type = "armes", prop = "prop_box_ammo03a_set2"},
    ["stinger_ammo"] = {label = "Munition Stinger", weight = 1, type = "armes", prop = "prop_box_ammo03a_set2"},

    --> Aucune action : 
    ["cash"] = {label = "Argent Propre", weight = -1, type = "vide", prop = "prop_anim_cash_pile_01"},
    ["dirty"] = {label = "Argent Sale", weight = -1, type = "vide", prop = "xs_prop_arena_cash_pile_m"},
    ["menotte"] = {label = "Menotte", weight = 1, type = "vide"},
    ["phone"] = {label = "Téléphone", weight = 1, type = "vide", prop = "p_cs_cam_phone"},


    --> Item Storage : 
    ["coffre"] = {label = "Coffre", weight = 1, type = "storage", prop = "prop_drop_crate_01"},
    ["grand_coffre"] = {label = "Grand Coffre", weight = 1, type = "storage", prop = "prop_box_wood05a"},
}

--(Je tien a précisér que je n'ai pas ajouté toutes les armes dispo du jeu par manque de temps a vous de continuer si besoin :)
--> Listes des armes hash : 
config.weapons = {
    WEAPON_PISTOL = {name = "pistol", label = "Pistolet", prop = "w_pi_combatpistol"},
    WEAPON_SMG = {name = "uzi", label = "Uzi", prop = "w_sb_microsmg"},
    WEAPON_COMBATPISTOL = {name = "pistolcombat", label = "Pistolet de combat", prop = "w_pi_combatpistol"},
    WEAPON_APPISTOL = {name = "appistol", label = "AP Pistolet", prop = "w_pi_combatpistol"},
    WEAPON_PISTOL50 = {name = "pistol50", label = "Pistolet-50", prop = "w_pi_combatpistol"},
    WEAPON_MICROSMG = {name = "microsmg", label = "Micro SMG", prop = "w_sb_microsmg"},
    WEAPON_ASSAULTSMG = {name = "fusilsmg", label = "Fusil SMG", prop = "w_sb_microsmg"},
    WEAPON_ASSAULTRIFLE = {name = "ak47", label = "AK", prop = ""},
    WEAPON_CARBINERIFLE = {name = "m4", label = "M4", prop = ""},
    WEAPON_ADVANCEDRIFLE  = {name = "rifle", label = "Fusil", prop = ""},
    WEAPON_MG = {name = "mg", label = "MG", prop = ""},
    WEAPON_COMBATMG = {name = "combatmg", label = "Fusil Combat MG", prop = ""},
    WEAPON_PUMPSHOTGUN = {name = "shotgun", label = "Fusil à pompe", prop = ""},
    WEAPON_SAWNOFFSHOTGUN = {name = "cannonscie", label = "Fusil à canon scié", prop = ""},
    WEAPON_SAWNOFFSHOTGUN = {name = "assaultshotgun", label = "Fusil à pompe auto", prop = ""},
    WEAPON_BULLPUPSHOTGUN  = {name = "fusilbull", label = "Fusil BullPup", prop = ""},
    WEAPON_STUNGUN = {name = "tazer", label = "Tazer", prop = ""},
    WEAPON_SNIPERRIFLE = {name = "sniperrifle", label = "Fusil Sniper", prop = ""},
    WEAPON_HEAVYSNIPER = {name = "heavysniper", label = "Fusil Sniper Lourd", prop = ""},
    WEAPON_HEAVYSNIPER = {name = "snipermk2", label = "Fusil Sniper Lourd Mk2", prop = ""},
    WEAPON_REMOTESNIPER = {name = "remotesniper", label = "Fusil Sniper Elite", prop = ""},
    WEAPON_GRENADELAUNCHER = {name = "lancegrenade", label = "Lance grenade", prop = ""},
    WEAPON_RPG = {name = "rpg", label = "Lance-roquettes", prop = ""},
    WEAPON_MINIGUN = {name = "minigun", label = "Mini-Gun", prop = ""},
    WEAPON_GRENADE = {name = "grenade", label = "Grenade", prop = ""},
    WEAPON_STICKYBOMB = {name = "grenadecoller", label = "Grenade collante", prop = ""},
    WEAPON_SMOKEGRENADE = {name = "fumi", label = "Fumigène", prop = ""},
    WEAPON_BZGAS = {name = "gaz", label = "Grenade lacrymo", prop = ""},
    WEAPON_MOLOTOV = {name = "molotov", label = "Cocktail Molotov", prop = ""},
    WEAPON_FIREEXTINGUISHER = {name = "extincteur", label = "Extincteur", prop = ""},
    WEAPON_PETROLCAN = {name = "bidon", label = "Bidon essence", prop = ""},
    WEAPON_BALL = {name = "ball", label = "Balle", prop = ""},
    WEAPON_BOTTLE = {name = "bouteil", label = "Bouteil en verre", prop = ""},
    WEAPON_DAGGER = {name = "dagger", label = "Dague", prop = ""},
    WEAPON_VINTAGEPISTOL = {name = "pistol_vintage", label = "Pistolet Vintage", prop = ""},
    WEAPON_FIREWORK = {name = "artifice", label = "Feu d'artifice", prop = ""},
    WEAPON_SNOWBALL = {name = "neige", label = "Boule de Neige", prop = ""},
    WEAPON_FLAREGUN = {name = "flaregun", label = "Pistolet de détresse", prop = ""},
    WEAPON_HATCHET = {name = "hache", label = "Hache", prop = ""},
    WEAPON_HAMMER  = {name = "marteau", label = "Marteau", prop = ""},
    WEAPON_BAT  = {name = "batte", label = "Batte", prop = ""},
    WEAPON_GOLFCLUB = {name = "golf", label = "Club de golf", prop = ""},
    WEAPON_CROWBAR = {name = "pied_biche", label = "Pied de biche", prop = ""},
    WEAPON_KNIFE = {name = "couteau", label = "Couteau", prop = ""},
    WEAPON_NIGHTSTICK = {name = "matraque", label = "Matraque", prop = ""},
    WEAPON_MACHETE = {name = "machette", label = "Machette", prop = ""},
    WEAPON_REVOLVER = {name = "revolver", label = "Revolver", prop = ""},
    WEAPON_FLASHLIGHT = {name = "flashlight", label = "Lampe de poche", prop = ""},
    WEAPON_FLARE = {name = "flare", label = "Flare", prop = ""},
    WEAPON_PISTOL_MK2 = {name = "pistol_mk2", label = "Pistolet Mk2", prop = ""},
    WEAPON_SMG_MK2 = {name = "smg_mk2", label = "SMG MK2", prop = ""},
}

--(Je tien a précisér que je n'ai pas ajouté toutes les armes dispo du jeu par manque de temps a vous de continuer si besoin :)
--> Listes des munitions hash : 
config.munitions = {
    AMMO_PISTOL = {name = "pistol_ammo", label = "Munition 9mm", prop = "w_pi_combatpistol"},
    AMMO_SMG = {name = "uzi_ammo", label = "Munition smg", prop = "w_sb_microsmg"},
    AMMO_FIREWORK = {name = "firework_ammo", label = "artifice", prop = ""},
    AMMO_RIFLE = {name = "rifle_ammo", label = "Munition fusil", prop = ""},
    AMMO_MG = {name = "mg_ammo", label = "Munition mg", prop = ""},
    AMMO_SHOTGUN = {name = "shotgun_ammo", label = "Munition pompe", prop = ""},
    AMMO_STUNGUN = {name = "stungun_ammo", label = "tazer chargeur", prop = ""},
    AMMO_SNIPER = {name = "sniper_ammo", label = "Munition sniper", prop = ""},
    AMMO_SNIPER_REMOTE = {name = "sniper_remote_ammo", label = "Munition sniper elite", prop = ""},
    AMMO_MINIGUN = {name = "minigun_ammo", label = "Munition mini-gun", prop = ""},
    AMMO_GRENADELAUNCHER = {name = "grenadelauncher_ammo", label = "Munition lance-grenade", prop = ""},
    AMMO_GRENADELAUNCHER_SMOKE = {name = "grenadelauncher_smoke_ammo", label = "munition fumigène", prop = ""},
    AMMO_RPG = {name = "rpg_ammo", label = "roquette", prop = ""},
    AMMO_STINGER = {name = "stinger_ammo", label = "Munition Stinger", prop = ""},
    AMMO_BALL = {name = "ball", label = "piece balle", prop = ""},
    AMMO_STICKYBOMB = {name = "stickybomb", label = "piece grenade collante", prop = ""},
    AMMO_SMOKEGRENADE = {name = "smokegrenade", label = "piece fumigène", prop = ""},
    AMMO_BZGAS = {name = "gzgas_ammo", label = "piece acrymo", prop = ""},
    AMMO_FLARE = {name = "flare_ammo", label = "piece flare", prop = ""},
}

config.itemDepart = { --> Item reçu a votre arrivé :
    {
        ["item_name"] = "cash",
        ["item_qty"] = config.argentPropre,
    },
    {
        ["item_name"] = "dirty",
        ["item_qty"] = config.argentSale,
    },
    {
        ["item_name"] = "phone",
        ["item_qty"] = 1,
    }
}

--> Pour avoir la license du player, faite le connecter une fois au serveur sans qui puisse rejoindre, il sera afficher sur la console.
config.activerWhitelist = false
config.lienDiscord  = 'https://discord.gg/NKHJTqn'

-- Listes des joueurs whitelist :
config.JoueursWhitelist    = {
    --[[ EXEMPLE :
        'license:40423b6fc9a87b1c16c005a43d3a74863fdd96db'
    ]]
    
    'license:40423b6fc9a87b1c16c005a43d3a74863fdd96db'
}