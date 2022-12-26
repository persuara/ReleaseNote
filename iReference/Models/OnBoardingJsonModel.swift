//
//  OnBoardingJsonModel.swift
//  iReference
//
//  Created by AmirHossein EramAbadi on 12/25/22.
//

import Foundation

struct ModelOnBoard: Codable {
    let data: [ContainsOnBoard]
}
struct ContainsOnBoard: Codable {
    let image, title, description: String
    
    enum CodingKeys: String, CodingKey {
           case image, title
           case description
       }
}
