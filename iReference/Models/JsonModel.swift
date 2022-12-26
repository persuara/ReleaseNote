//
//  JsonModel.swift
//  iReference
//
//  Created by AmirHossein EramAbadi on 12/12/22.
//

import Foundation

struct Model: Codable {
    let data: [Versions]
}

// MARK: - Datum
struct Versions: Codable {
    let major, image: String
    let minor: [MinorObject]
    let revisions: [[MinorObject?]]
}

// MARK: - Minor
struct MinorObject: Codable {
    let version: String
    let url: String?
    let date: Int
    
    enum DateUnion: Codable {
        case integer(Int)
        case string(String)
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode(Int.self) {
                self = .integer(x)
                return
            }
            if let x = try? container.decode(String.self) {
                self = .string(x)
                return
            }
            throw DecodingError.typeMismatch(DateUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for DateUnion"))
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .integer(let x):
                try container.encode(x)
            case .string(let x):
                try container.encode(x)
            }
        }
    }
}
