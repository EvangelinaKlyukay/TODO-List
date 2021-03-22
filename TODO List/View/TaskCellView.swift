//
//  TaskView.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 21.03.2021.
//

import Foundation
import UIKit

class TaskCellView: UIView {
    
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var background: UIView!
    
    var task: Task?
    {
        didSet {
            if let task = task {
                nameText.text = task.name

                let formatter = DateFormatter()
                formatter.dateStyle = .short

                let startDate = formatter.string(from: task.dateStart)
                let endDate = formatter.string(from: task.dateFinish)
                dateText.text = "\(startDate) - \(endDate)"
                print("[\(self)]: \(task.name)")
                self.isHidden = false
            } else {
                self.isHidden = true
                print("[\(self)]: hidden")}
        }
    }
    
    func change(task color: UIColor) {
        background.backgroundColor = color
    }

}
