config = {}

config.data = {}

config.Parents = {mom = 0, dad = 0, ShapeMixData = 0.5, SkinMixData  = 0.5, ressemblance = 5, couleur = 5}
config.Parents.momIndex = 1
config.Parents.dadIndex = 1

config.isMenuEnable = false
config.Camera = {
    face = {x = 402.92, y = -1000.72, z = -98.35, fov = 7.00},
    body = {x = 402.92, y = -1000.72, z = -99.01, fov = 30.00},
    torso = {x = 402.92, y = -1000.72, z = -98.80, fov = 10.00},
    cam = nil,
    cam2 = nil,
    cam3 = nil
}

config.CamPerso = nil
config.PlayerSpawnPos = {x = -1042.635, y =-2745.828, z = 21.359, h = -30.0}

config.Sex = "mp_m_freemode_01"
config.Character = {
    sex = {"Homme", "Femme"},
    index_sex = 1,
    mom = { "Hannah", "Aubrey", "Jasmine", "Gisele", "Amelia", "Isabella", "Zoe", "Ava", "Camila", "Violet", "Sophia", "Evelyn", "Nicole", "Ashley", "Gracie", "Brianna", "Natalie", "Olivia", "Elizabeth", "Charlotte", "Emma" },
    dad = { "Benjamin", "Daniel", "Joshua", "Noah", "Andrew", "Juan", "Alex", "Isaac", "Evan", "Ethan", "Vincent", "Angel", "Diego", "Adrian", "Gabriel", "Michael", "Santiago", "Kevin", "Louis", "Samuel", "Anthony", " Claude", "Niko" },
    hairCut = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ,16, 17, 18, 19, 20, 21, 22, 23},
    hairIndex = 1,
    hairColors = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ,16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40},
    hairColorIndex = 1,
    eyesColor = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20},
    eyesColorIndex = 21,
    barbe = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ,16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, "sans"},
    barbe_index = 29,
    couleur_barbe = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ,16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40},
    couleur_barbe_index = 1,
    sourcil = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ,16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33},
    sourcil_index = 1,
    sourcil_couleur = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ,16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40},
    sourcil_couleur_index = 1,
    acnee = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ,16, 17, 18, 19, 20, 21, 22, "sans"},
    acnee_index = 24,
    ride = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, "sans"},
    ride_index = 15,
    maquillage = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ,16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, "sans"},
    maquillage_index = 72,
    maquillage_levre = {0, 1, 2, 3, 4, 5, 6, 7, 8, "sans"},
    maquillage_levre_index = 10,
    couleur_maquillage_levre = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ,16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40},
    couleur_maquillage_levre_index = 1,
    poil = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, "sans"},
    poil_index = 16,
    couleur_poil = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ,16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40},
    couleur_poil_index = 1,
    nom = "Sans Nom",
    prenom = "Sans Prenom",
    age = 0,
    nationaliter = "N/A"
}

config.Outfit = {
	{
		label = 'Plage',
		id = {
			male = {
				Tops = {componentId = 11, drawableId = 36, textureId = 0, paletteId = 0},
                Undershirts = {componentId = 8, drawableId = 15, textureId= 0,paletteId = 0},
                Shoes = {componentId = 6, drawableId = 5, textureId = 0, paletteId = 0},
                Accessories = {componentId = 7, drawableId = 0, textureId = 0, paletteId = 0},
                Legs = {componentId = 4, drawableId = 15, textureId = 0,  paletteId = 0},
                Torsos = {componentId = 3, drawableId = 5, textureId = 0, paletteId = 0}
			},
			female = {
                Tops = {componentId = 11, drawableId = 17, textureId = 0, paletteId = 0},
                Undershirts = {componentId = 8, drawableId = 15, textureId= 0,paletteId = 0},
                Shoes = {componentId = 6, drawableId = 5, textureId = 0, paletteId = 0},
                Accessories = {componentId = 7, drawableId = 0, textureId = 0, paletteId = 0},
                Legs = {componentId = 4, drawableId = 25, textureId = 0,  paletteId = 0},
                Torsos = {componentId = 3, drawableId = 0, textureId = 0, paletteId = 0}
			}
		}
	},
	{
		label = 'Tenue maison',
		id = {
			male = {
                Tops = {componentId = 11, drawableId = 80, textureId = 0, paletteId = 0},
                Undershirts = {componentId = 8, drawableId = 15, textureId= 0,paletteId = 0},
                Shoes = {componentId = 6, drawableId = 6, textureId = 0, paletteId = 0},
                Accessories = {componentId = 7, drawableId = 0, textureId = 2, paletteId = 0},
                Legs = {componentId = 4, drawableId = 55, textureId = 0, paletteId = 0},
                Torsos = {componentId = 3, drawableId = 11, textureId = 0,paletteId = 0}
			},
			female = {
                Tops = {componentId = 11, drawableId = 76, textureId = 0, paletteId = 0},
                Undershirts = {componentId = 8, drawableId = 10, textureId= 0,paletteId = 0},
                Shoes = {componentId = 6, drawableId = 16, textureId = 0, paletteId = 0},
                Accessories = {componentId = 7, drawableId = 0, textureId = 0, paletteId = 0},
                Legs = {componentId = 4, drawableId = 58, textureId = 0, paletteId = 0},
                Torsos = {componentId = 3, drawableId = 14, textureId = 0,paletteId = 0}
			}
		}
	},

    {
		label = "Tenue Tape-à-l'oeil",
		id = {
			male = {
                Tops = {componentId = 11, drawableId = 29, textureId = 0, paletteId = 0},
                Undershirts = {componentId = 8, drawableId = 31, textureId= 0,paletteId = 0},
                Shoes = {componentId = 6, drawableId = 10, textureId = 0, paletteId = 0},
                Accessories = {componentId = 7, drawableId = 0, textureId = 0, paletteId = 0},
                Legs = {componentId = 4, drawableId = 24, textureId = 0, paletteId = 0},
                Torsos = {componentId = 3, drawableId = 4, textureId = 0,paletteId = 0}
			},
			female = {
                Tops = {componentId = 11, drawableId = 6, textureId = 0, paletteId = 0},
                Undershirts = {componentId = 8, drawableId = 41, textureId= 0,paletteId = 0},
                Shoes = {componentId = 6, drawableId = 6, textureId = 0, paletteId = 0},
                Accessories = {componentId = 7, drawableId = 0, textureId = 0, paletteId = 0},
                Legs = {componentId = 4, drawableId = 7, textureId = 0, paletteId = 0},
                Torsos = {componentId = 3, drawableId = 5, textureId = 0,paletteId = 0}
			}
		}
	}
}