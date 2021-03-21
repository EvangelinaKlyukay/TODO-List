//
//  TaskReceiveService.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 21.03.2021.
//

import Foundation

class TaskReceiveService {
    
    private let api: APIService!
    
    init(api: APIService!) {
        self.api = api
    }
    
    func getTask(startDayTimestamp dayStart: Date, endDayTimestamp dayEnd: Date) -> [Task]! {
        return api.loadTasks()?.filter({ (task) -> Bool in
            // если время начала таска больше конца дня, то не подходит
            if task.dateStart > dayEnd { return false }
            // если время начала таска меньше начала дня и время конца таска меньше начала дня, то не подходит
            if task.dateStart < dayStart && task.dateFinish < dayStart { return false }
            // остальные все подходят
            return true
        })
    }
    
}
