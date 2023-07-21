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
    /*var is_one_top: Bool
    var cook_time_minutes: Int = 0
    var promotion: String = ""
    var keywords: String = ""
    //var show: []
    var servings_noun_plural:String = ""
    var canonical_id: String = ""
    var show_id: Int = 0
    var draft_status: String = ""
//var sections: []
    //var tags: []
    var thumbnail_alt_text: String = ""
    //var credits: []
    //var topics: []
    var slug: String = ""
    var servings_noun_singular: String = ""
    var video_url: String = ""
    var prep_time_minutes: Int = 0
    var name: String = ""
    var buzz_id: Int = 0
    var thumbnail_url: String = ""
    var is_shoppable: Bool
    var video_id: Int = 0
    //var compilations: []
    var num_servings: Int = 0
    var brand: Int = 0
    //var nutrition: []
    var tips_and_ratings_enabled: Bool
    var video_ad_content: String = ""
    var seo_title: String = ""
    var country: String = ""
    //var instructions:[]
    var language: String = ""
    var brand_id: Int = 0
    var aspect_ratio: String = ""
    var description: String = ""
    var inspired_by_url: Int = 0
    var total_time_minutes: Int = 0
    var nutrition_visibility: String = ""
    //var facebook_posts: []
    var beauty_url: Int = 0
    //var total_time_tier:[]
    var yields: String = ""
    var original_video_url: String = ""
    var updated_at: Int = 0
    //var renditions: []
    var created_at: Int = 0
    var approved_at: Int = 0
    //var user_ratings: []
    var id: Int = 0*/
    
    let name: String
    let thumbnail_url: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case thumbnail_url = "thumbnail_url"
    }

}

