//
//  AppRoot.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 21.03.2021.
//

import Foundation

class AppRoot {
    
    private let tasksFileName = "DataBase"
    
    public static let shared = AppRoot()
    
    let TaskReceive: TaskReceiveService
    
    private init () {
        let api: APIService
        api = JsonFileAPIServise(fileName: tasksFileName)
        
        TaskReceive = TaskReceiveService(api: api)
    }
}
