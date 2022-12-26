//
//  NewTestModel.swift
//  iReference
//
//  Created by AmirHossein EramAbadi on 12/19/22.
//

import Foundation

// MARK: - Welcome
struct ModelSecondary: Codable {
    let data: [VersionsSecondary]
}

// MARK: - Datum
struct VersionsSecondary: Codable {
    let major, image: String
    let minor: [Minor]
    let revisions: [RevisionSecondary]
}

// MARK: - Minor
struct Minor: Codable {
    let version: String
    let url: String?
    let date: Int
}

enum RevisionSecondary: Codable {
    case minor(Minor)
    case minorArray([Minor])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([Minor].self) {
            self = .minorArray(x)
            return
        }
        if let x = try? container.decode(Minor.self) {
            self = .minor(x)
            return
        }
        throw DecodingError.typeMismatch(RevisionSecondary.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Revision"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .minor(let x):
            try container.encode(x)
        case .minorArray(let x):
            try container.encode(x)
        }
    }
}
