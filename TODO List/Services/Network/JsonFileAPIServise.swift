//
//  APIService.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 18.03.2021.
//

import Foundation


class JsonFileAPIServise: APIService {
    
    private let fileName: String!
    
    private var allTasks: [Task]?
    
    init(fileName: String!) {
        self.fileName = fileName
    }
    
    func loadTasks() -> [Task] {
        if allTasks != nil {
            return allTasks!
        }
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                allTasks = try decoder.decode([Task].self, from: data)
            } catch {
                allTasks = [Task]()
                print("error:\(error)")
            }
        } else {
            allTasks = [Task]()
        }
        
        return allTasks!
    }
    
}
