//
//  TaskView.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 21.03.2021.
//

import Foundation
import UIKit

class TaskCellView: UIView {
    
    @IBOutlet private weak var nameText: UILabel!
    @IBOutlet private weak var dateText: UILabel!
    
    var task: Task? {
        didSet {
            if let task = task {
                nameText.text = task.name
                
                let formatter = DateFormatter()
                formatter.dateStyle = .short
                
                let startDate = formatter.string(from: task.dateStart)
                let endDate = formatter.string(from: task.dateFinish)
                dateText.text = "\(startDate) - \(endDate)"
                self.isHidden = false
            } else {
                self.isHidden = true
            }
        }
    }

}
