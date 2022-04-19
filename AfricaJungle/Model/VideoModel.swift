//
//  VideoModel.swift
//  AfricaJungle
//
//  Created by Sarika on 19.04.22.
//

import Foundation

struct Video: Codable, Identifiable {
    
    let id : String
    let name : String
    let headline: String
    
    //Computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
