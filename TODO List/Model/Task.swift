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
    let date_start: Date
    let date_finish: Date
    let name: String
    let description: String
}
