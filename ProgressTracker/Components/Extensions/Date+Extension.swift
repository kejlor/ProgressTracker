//
//  Date+Extension.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 05/01/2026.
//

import Foundation

extension Date {
    static var currentWeekDates: [Date] {
        let calendar = Calendar.current
        let today = Date()
        
        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: today) else {
            return []
        }
        
        return (0..<7).compactMap {
            calendar.date(byAdding: .day, value: $0, to: weekInterval.start)
        }
    }
}
