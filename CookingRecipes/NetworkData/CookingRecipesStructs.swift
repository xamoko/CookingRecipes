//
//  CookingRecipesStructs.swift
//  CookingRecipes
//
//  Created by Xavier Morales on 18/07/23.
//

import Foundation

struct DatasCook: Codable {
    let count: Int
    let results: [CoockList]
}

struct CoockList: Codable {    
    let name: String
    let thumbnail_url: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case thumbnail_url = "thumbnail_url"
        case description = "description"
    }

}

