////
////  ModelNew.swift
////  iReference
////
////  Created by AmirHossein EramAbadi on 12/25/22.
////
//
//import Foundation
//
//
//// MARK: - Welcome
//struct Welcome: Codable {
//    let data: [Datum]
//}
//
//// MARK: - Datum
//struct Datum: Codable {
//    let major, image: String
//    let minor: [Minor]
//    let revisions: [[Revision?]]
//}
//
//// MARK: - Minor
//struct Minor: Codable {
//    let version: String
//    let url: String?
//    let date: Int
//}
//
//struct Revision: Codable {
//    let version: String
//    let url: String?
//    let date: DateUnion
//}
//
//enum DateUnion: Codable {
//    case integer(Int)
//    case string(String)
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode(Int.self) {
//            self = .integer(x)
//            return
//        }
//        if let x = try? container.decode(String.self) {
//            self = .string(x)
//            return
//        }
//        throw DecodingError.typeMismatch(DateUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for DateUnion"))
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .integer(let x):
//            try container.encode(x)
//        case .string(let x):
//            try container.encode(x)
//        }
//    }
//}
