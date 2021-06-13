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
    nom = "N/A",
    prenom = "N/A",
    age = 0,
    nationaliter = "N/A"
}

config.Outfit = {
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