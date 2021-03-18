//
//  File.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 16.03.2021.
//

import UIKit
import FSCalendar

extension FSCalendar {
    func customLayoutViewSehatQ() {
        today = nil

        calendarHeaderView.backgroundColor = .clear

        appearance.headerTitleColor = .black
        appearance.weekdayTextColor = .white
        appearance.titleDefaultColor = .black
        appearance.titlePlaceholderColor = UIColor.gray

        appearance.titleSelectionColor = .white
        appearance.titleTodayColor = .black
        appearance.headerTitleFont = UIFont(name: "HelveticaNeue", size: 17)
        appearance.weekdayFont = UIFont(name: "HelveticaNeue", size: 13)
        headerHeight = 40
        weekdayHeight = 30
        clipsToBounds = true
    }
}

