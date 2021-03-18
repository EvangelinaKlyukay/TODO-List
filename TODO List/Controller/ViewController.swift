//
//  ViewController.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 12.03.2021.
//


import UIKit
import FSCalendar

class ViewController: UIViewController {
    
    private var task: [Task]?
    let hoursInDay = 24
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var calendar: FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let index = (sender as! IndexPath).row
        if let tasks = self.task {
            let task = tasks[index]
            (segue.destination as! DescriptionViewController).taskId = task.id
        }
    }

}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hoursInDay
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = hour(for: indexPath.row)

        return cell
    }
    
    func hour(for index: Int) -> String {
        let startHour = index
        let endHour = (index + 1) % hoursInDay
        
        return String(format: "%02d:00 - %02d:00", startHour, endHour)
    }

}

// MARK: - UITableViewDelegate

extension ViewController: UITabBarDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
           self.performSegue(withIdentifier: "show", sender: indexPath)
       }
    
}
