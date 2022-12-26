//
//  Network.swift
//  iReference
//
//  Created by AmirHossein EramAbadi on 12/13/22.
//

import Foundation

struct VersionFile : Codable {
    let nameVersion: String
}
enum NetWorkErrors: String, Error {
    case corruptedData = "Data is corrupted"
    case urlNotFound = "Url was not found baby!"
    case parseError = "Parsing could not return a result! \n There was an error while parsing! "
}

class Network {
    
    public func fetchJson(_ model: inout Model?) {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json")  {
            
            let data = try? Data(contentsOf: url)
            guard let data = data else {
                print("no data to present")
                return
            }
            let decoder = JSONDecoder()
            model = try? decoder.decode(Model.self, from: data)
            
        }
    }
        
        public func fetchOnBoardingJson(_ model: inout ModelOnBoard?) {
            if let url = Bundle.main.url(forResource: "OBdata", withExtension: "json") {
                
                let data = try? Data(contentsOf: url)
                guard let data = data else {
                    print("No available data!")
                    return
                }
                let decoder = JSONDecoder()
                model = try? decoder.decode(ModelOnBoard.self, from: data)
                
            }
        }
    }
    
