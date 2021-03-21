//
//  APIService.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 18.03.2021.
//

import Foundation


class JsonFileAPIServise: APIService {
    
    let file = "DataBase.json"

    func loadTasks() -> [Task]! {
        if let url = Bundle.main.url(forResource: file, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let container = try decoder.decode(TasksContainer.self, from: data)
                return container.tasks
            } catch {
                print("error:\(error)")
            }
        }
        return [Task]()
    }
    
}
