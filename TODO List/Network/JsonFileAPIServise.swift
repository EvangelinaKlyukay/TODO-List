//
//  APIService.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 18.03.2021.
//

import Foundation


class JsonFileAPIServise: APIService {
    
    private let fileName = "DataBase"
    private let fileExtension = "json"
    
    private var allTasks: [Task]?

    func loadTasks() -> [Task]! {
        if allTasks != nil {
            return allTasks
        }
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let container = try decoder.decode(TasksContainer.self, from: data)
                allTasks = container.tasks
            } catch {
                allTasks = [Task]()
                print("error:\(error)")
            }
        }
        
        return allTasks
    }
    
}
