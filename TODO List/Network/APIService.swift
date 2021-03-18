//
//  APIService.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 18.03.2021.
//

import Foundation


class APIServise {
    
    let file = "DataBase.json"

    func loadJson(filename fileName: String) -> [Task]? {
        if let url = Bundle.main.url(forResource: file, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(TaskData.self, from: data)
                return jsonData.task
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
}
