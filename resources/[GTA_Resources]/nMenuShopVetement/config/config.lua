--> Voici comment fonctionne le systeme de vêtement : 
--> Site pour le system de vêtement : https://wiki.rage.mp/index.php?title=Clothes
--[[
    EXEMPLE ICI : https://wiki.rage.mp/index.php?title=Male_Tops
    ["T-Shirt Blanc"] = {1, 0, 5, 0}, 
    Le premier chiffre représente le draw id[Torsos]
    Le deuxieme représente la couleur
    Le troisieme reprèsente le prix.
    Le quatrième reprèsente les bras[Torsos].
    Le 5ieme reprèsente le sous tshirt [Undershirts].
]]

Config = {
    sexe = "mp_m_freemode_01",
    Locations = {
        [1] = {
            ["MagasinDeVetement"] = { ["x"] = -828.87, ["y"] = -1074.06, ["z"] = 11.32 },

            ["Homme"] = { 
                ["Tshirt"] = {
                    ["T-Shirt blanc"] = {1, 0, 5, 0, 15}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                    ["T-Shirt gris"] = {16, 0, 5, 0, 15}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                    ["T-Shirt gris rayé"] = {33, 0, 5, 0, 15}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                    ["T-Shirt gris noir"] = {34, 0, 5, 0, 15}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                    ["T-Shirt gris noir"] = {34, 0, 5, 0, 15}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                    ["Polo gris"] = {9, 1, 5, 0, 15}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                },

                ["Pull"] = {
                    ["Pull gris"] = {38, 0, 5, 8, 15}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                },

                ["Veste"] = {
                    ["Veste en cuir"] = {37, 0, 5, 14, 15}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                    ["Chemise blanche"] = {13, 0, 5, 11, 15}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                    ["Veste légère"] = {3, 0, 5, 14, 15}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                },

                ["Pantalon"] = {
                    ["Jean bleu marine"] = {0, 0, 5}, --> DrawID, CouleurID, Prix.
                    ["Jean noir"] = {1, 0, 5}, --> DrawID, CouleurID, Prix.
                },

                ["Chaussure"] = {
                    ["Pied nu"] = {34, 0, 5}, --> DrawID, CouleurID, Prix.
                    ["Tong basic"] = {5, 0, 5}, --> DrawID, CouleurID, Prix.
                },

                ["Chapeau"] = {
                    ["Bonnet noir"] = {2, 5}, --> DrawID, Prix.
                    ["Casquette ls"] = {4, 5}, --> DrawID, Prix.
                    ["Bob vert"] = {20, 5}, --> DrawID, Prix.
                    ["Rien"] = {11, 0}, --> DrawID, Prix.
                },

                ["Accessoire"] = {
                    ["Cravate blanche"] = {12, 5}, --> DrawID, Prix.
                    ["Cravate rouge"] = {18, 5}, --> DrawID, Prix.
                    ["Cravate bleu"] = {21, 5}, --> DrawID, Prix.
                    ["Echarpe blanche"] = {31, 5}, --> DrawID, Prix.
                    ["Echarpe rouge"] = {34, 5}, --> DrawID, Prix.
                    ["Rien"] = { 0, 5}, --> DrawID, Prix.
                },

                ["Mask"] = {
                    ["Porc"] = {1, 5}, --> DrawID, Prix.
                    ["Skelet"] = {2, 5}, --> DrawID, Prix.
                    ["Singe"] = {3, 5}, --> DrawID, Prix.
                    ["Jason Voorhees"] = {4, 5}, --> DrawID, Prix.
                    ["Demon"] = {7, 5}, --> DrawID, Prix.
                    ["Père noel"] = { 8, 5}, --> DrawID, Prix.
                    ["Masquer"] = { 11, 5}, --> DrawID, Prix.
                    ["Ange térrifiant"] = { 13, 5}, --> DrawID, Prix.
                    ["Jason Voorhees 2"] = { 15, 5}, --> DrawID, Prix.
                    ["Loup"] = { 26, 5}, --> DrawID, Prix.
                    ["Pingouin"] = { 31, 5}, --> DrawID, Prix.
                    ["Pain d'épice"] = { 33, 5}, --> DrawID, Prix.
                    ["Lutin"] = { 34, 5}, --> DrawID, Prix.
                    ["Mask à gaz"] = { 36, 5}, --> DrawID, Prix.
                    ["Monstre"] = { 39, 5}, --> DrawID, Prix.
                    ["Captain kurk"] = { 43, 5}, --> DrawID, Prix.
                    ["Mask à gaz 2"] = { 46, 5}, --> DrawID, Prix.
                    ["Gringe noel"] = { 83, 5}, --> DrawID, Prix.
                    ["Mamie"] = { 88, 5}, --> DrawID, Prix.
                    ["Chien"] = { 100, 5}, --> DrawID, Prix.
                },
            },

            ["Femme"] = { 
                ["Tshirt"] = {
                    ["Polo blanc"] = {14, 0, 5, 14, 15}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                    ["Débardeur rouge"] = {16, 0, 5, 12, 2}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                    ["Débardeur à capuche bleu militaire"] = {210, 0, 5, 12, 2}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                },

                ["Pull"] = {
                    ["Pull gris"] = {192, 0, 5, 1, 15}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                    ["Pull vert à  capuche"] = {259, 0, 5, 1, 15}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                    ["Pull gris à capuche"] = {271, 0, 5, 1, 15}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                    ["Pull jaune à capuche"] = {202, 0, 5, 1, 9}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                },

                ["Veste"] = {
                    ["Veste détente"] = {266, 0, 5, 3, 2}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                    ["Veste légère blanche"] = {3, 0, 5, 3, 2}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                    ["Veste jean"] = {1, 0, 5, 5, 2}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                    ["Veste manteau à capuche"] = {189, 0, 5, 5, 2}, --> DrawID, CouleurID, Prix, Torsos, Undershirts.
                },

                ["Pantalon"] = {
                    ["Jean bleu marine"] = {0, 0, 5}, --> DrawID, CouleurID, Prix.
                },

                ["Chaussure"] = {
                    ["Pied nu"] = {34, 0, 0}, --> DrawID, CouleurID, Prix.
                },

                ["Chapeau"] = {
                    ["Bonnet noir"] = {2, 5}, --> DrawID, Prix.
                    ["Casquette ls"] = {4, 5}, --> DrawID, Prix.
                    ["Bob vert"] = {20, 5}, --> DrawID, Prix.
                    ["Rien"] = {57, 0}, --> DrawID, Prix.
                },

                ["Accessoire"] = {
                    ["Cravate blanche"] = {12, 5}, --> DrawID, Prix.
                    ["Cravate rouge"] = {18, 5}, --> DrawID, Prix.
                    ["Cravate bleu"] = {21, 5}, --> DrawID, Prix.
                    ["Echarpe blanche"] = {31, 5}, --> DrawID, Prix.
                    ["Echarpe rouge"] = {34, 5}, --> DrawID, Prix.
                    ["Rien"] = {0, 0}, --> DrawID, Prix.
                },

                ["Mask"] = {
                    ["Porc"] = {1, 5}, --> DrawID, Prix.
                    ["Skelet"] = {2, 5}, --> DrawID, Prix.
                    ["Singe"] = {3, 5}, --> DrawID, Prix.
                    ["Jason Voorhees"] = {4, 5}, --> DrawID, Prix.
                    ["Demon"] = {7, 5}, --> DrawID, Prix.
                    ["Père noel"] = { 8, 5}, --> DrawID, Prix.
                    ["Masquer"] = { 11, 5}, --> DrawID, Prix.
                    ["Ange térrifiant"] = { 13, 5}, --> DrawID, Prix.
                    ["Jason Voorhees 2"] = { 15, 5}, --> DrawID, Prix.
                    ["Loup"] = { 26, 5}, --> DrawID, Prix.
                    ["Pingouin"] = { 31, 5}, --> DrawID, Prix.
                    ["Pain d'épice"] = { 33, 5}, --> DrawID, Prix.
                    ["Lutin"] = { 34, 5}, --> DrawID, Prix.
                    ["Cagoule"] = { 35, 5}, --> DrawID, Prix.
                    ["Mask à gaz"] = { 36, 5}, --> DrawID, Prix.
                    ["Cagoule 2"] = { 37, 5}, --> DrawID, Prix.
                    ["Monstre"] = { 39, 5}, --> DrawID, Prix.
                    ["Captain kurk"] = { 43, 5}, --> DrawID, Prix.
                    ["Mask à gaz 2"] = { 46, 5}, --> DrawID, Prix.
                    ["Bandana"] = { 51, 5}, --> DrawID, Prix.
                    ["Super Cool Ninja"] = { 55, 5}, --> DrawID, Prix.
                    ["Demon 2"] = { 72, 5}, --> DrawID, Prix.
                    ["Gringe noel"] = { 83, 5}, --> DrawID, Prix.
                    ["Mamie"] = { 88, 5}, --> DrawID, Prix.
                    ["Chien"] = { 100, 5}, --> DrawID, Prix.
                    ["Sauveur masquer"] = { 148, 5}, --> DrawID, Prix.
                    ["Citron"] = { 150, 5}, --> DrawID, Prix.
                    ["Ananas"] = { 152, 5}, --> DrawID, Prix.
                    ["Fraise"] = { 149, 5}, --> DrawID, Prix.
                    ["Joker"] = { 155, 5}, --> DrawID, Prix.
                },
            }
        },
    },
}