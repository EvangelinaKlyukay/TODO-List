//
//  File.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 15.03.2021.
//

import Foundation

struct TaskData: Decodable {
    var task: [Task]
}

struct Task : Decodable {
    let id: Int
    let date_start: Double
    let date_finish: Double
    let name: String
    let description: String
}
