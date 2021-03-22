//
//  ViewController.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 12.03.2021.
//


import UIKit
import FSCalendar

class TimelineViewController: UIViewController {
    
    private var task: [Task]?
    let hoursInDay = 24
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var calendar: FSCalendar!
    
    private var allCels = [TaskCellView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            let today = Date()
            self.calendar.select(today)
            self.dateSelected(today)
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

    private func dateSelected(_ date: Date) {
        let c = Calendar.current
        let dayStart = c.startOfDay(for: date)
        let dayEnd = c.date(byAdding: .day, value: 1, to: dayStart)!
        
        let tasks = AppRoot.shared.TaskReceive.getTask(dayStart: dayStart, dayEnd: dayEnd)
        
        var leftBorder = dayStart
        
        for i in 0..<tasks.count {
            let currentCell: TaskCellView
            if (self.allCels.count <= i) {
                currentCell = TaskCellView.loadFromXib()
                currentCell.change(task: UIColor.random())
                self.tableView.addSubview(currentCell)
                self.allCels.append(currentCell)
            } else {
                currentCell = self.allCels[i]
            }
            currentCell.task = tasks[i]
            setPosition(forTask: currentCell, dayStart: dayStart, dayEnd: dayEnd, leftBorder: leftBorder)
            leftBorder = Date.maxDate(left: leftBorder, right: tasks[i].dateFinish)
        }
        
        for i in tasks.count..<allCels.count {
            self.allCels[i].task = nil
        }
    }
    
    private func setPosition(forTask cell: TaskCellView!, dayStart: Date, dayEnd: Date, leftBorder: Date) {
        guard let task = cell.task else { return }
        
        let minInDay = 24 * 60.0
        let secInMin = 60.0
        
        let leftDate = Date.maxDate(left: leftBorder, right: dayStart)
        let rightDate = Date.minDate(left: task.dateFinish, right: dayEnd)
        let contentHeight = Double(tableView.contentSize.height)
        
        let timeSinceDayStart = Double(leftDate.timeIntervalSince(dayStart)) / secInMin
        let y = CGFloat(contentHeight * timeSinceDayStart / minInDay)
        
        let taskInterval = Double(rightDate.timeIntervalSince(leftDate)) / secInMin
        let height = CGFloat(contentHeight * taskInterval / minInDay)
        
        let oldFrame = cell.frame
        cell.frame = CGRect(x: oldFrame.minX, y: y, width: oldFrame.width, height: height)
    }
    
}

// MARK: - FSCalendarDelegate

extension TimelineViewController: FSCalendarDelegate {

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        dateSelected(date)
    }
    
}

// MARK: - UITableViewDataSource

extension TimelineViewController: UITableViewDataSource {

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

extension TimelineViewController: UITabBarDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
           self.performSegue(withIdentifier: "show", sender: indexPath)
       }
    
}

extension UIView {

    class func loadFromXib<T>(withOwner: Any? = nil, options: [UINib.OptionsKey: Any]? = nil) -> T where T: UIView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: String(describing: self), bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: withOwner, options: options).first as? T else {
            fatalError("Could not load view from nib file.")
        }
        return view
    }
}

extension Date {
    
    static func minDate(left: Date, right: Date) -> Date {
        return left < right ? left : right
    }
    
    static func maxDate(left: Date, right: Date) -> Date {
        return left > right ? left : right
    }
    
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
