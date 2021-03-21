//
//  APIService2.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 21.03.2021.
//

import Foundation

protocol APIService {

    func loadTasks() -> [Task]!
    
}
