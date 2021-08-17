//
//  Constants.swift
//  ProjectClothes
//
//  Created by Hojin Ryu on 15/08/21.
//

import Foundation

struct Constants {
    
    func recommendationPhrase(temperatures: Int) -> String {
        
        if temperatures >= 30 {
            return clothesRecommendation[0]
        }
        else if temperatures < 30 && temperatures >= 25 {
            return clothesRecommendation[1]
        }
        else if temperatures < 25 && temperatures >= 20 {
            return clothesRecommendation[2]
        }
        else if temperatures < 20 && temperatures >= 15 {
            return clothesRecommendation[3]
        }
        else if temperatures < 15 && temperatures >= 10 {
            return clothesRecommendation[4]
        }
        else {
            return clothesRecommendation[5]
        }
    }
    
    private let clothesRecommendation: [String] = [
        "tecidos leves e frescos. ",
        "roupas de manga comprida, desde que o tecido seja leve e fresco. ",
        "um casaco característico da meia estação. ",
        "casacos quentes e blusas de gola alta. ",
        "gola alta para proteger o pescoço e não arriscar um resfriado nesse momento. ",
        "seus blusões bem quentes e proteja seu pescoço com golas altas ou cachecóis. Sapatos quentes e calças confortáveis são ideias pra lidar com a temperatura de hoje. "
    ]
}
