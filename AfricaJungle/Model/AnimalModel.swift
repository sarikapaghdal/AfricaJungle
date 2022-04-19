//
//  AnimalModel.swift
//  AfricaJungle
//
//  Created by Sarika on 19.04.22.
//

import Foundation

struct Animal: Codable, Identifiable {
    let id, name, headline, description: String
    let link: String
    let image: String
    let gallery, fact: [String]
}
