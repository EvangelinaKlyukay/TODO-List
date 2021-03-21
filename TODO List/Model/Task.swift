//
//  File.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 15.03.2021.
//

import Foundation

struct TasksContainer: Decodable {
    var tasks: [Task]
}

struct Task : Decodable {
    
    let id: Int
    let dateStart: Date
    let dateFinish: Date
    let name: String
    let description: String
 
    enum CodingKeys: String, CodingKey {
        case id
        case date_start
        case date_finish
        case name
        case description
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        dateStart = try container.decode(Double.self, forKey: .date_start).timestampToDate()
        dateFinish = try container.decode(Double.self, forKey: .date_finish).timestampToDate()
    }
    
}

extension Double {
 
    func timestampToDate() -> Date {
        return Date(timeIntervalSince1970: self)
    }
    
}
