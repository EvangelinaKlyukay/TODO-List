//
//  ExtantionTableView.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 17.03.2021.
//

import Foundation

extension ViewController: UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items[indexPath.row]

        cell.textLabel?.text = item.name
        cell.accessoryType = item.enabled ? .checkmark : .none

        return cell

    }

}
