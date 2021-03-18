//
//  DescriptionViewController.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 18.03.2021.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    var taskId: Int!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var task: Task? {
        didSet {
            nameLabel.text = task?.name
            //dateLabel.text = String(format: task!.date_start)
            descriptionLabel.text = task?.description

        }
    }


}
