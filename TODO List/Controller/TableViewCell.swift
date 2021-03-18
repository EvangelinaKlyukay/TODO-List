//
//  TableViewCell.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 15.03.2021.
//
import UIKit



class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var task: Task? {
        didSet {
            nameLabel.text = task?.name

        }
    }
    
}

