//
//  HabitModel.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 15/01/2026.
//

import SwiftUI

struct HabitModel: Hashable, Codable {
    var id: String {
        habitId
    }
    
    let habitId: String
    let habitColorHex: String
    private(set) var days: Int
    private(set) var name: String
    let dateCreated: Date?
    let completedDates: [Date]?
    
    init(
        habitId: String,
        habitColorHex: String,
        days: Int,
        name: String,
        dateCreated: Date? = nil,
        completedDates: [Date]? = nil
    ) {
        self.habitId = habitId
        self.habitColorHex = habitColorHex
        self.days = days
        self.name = name
        self.dateCreated = dateCreated
        self.completedDates = completedDates
    }
    
    var habitColorCalculated: Color {
        Color(hex: habitColorHex)
    }
    
    mutating func updateName(name: String) {
        self.name = name
    }
    
    mutating func updateDays(days: Int) {
        self.days = days
    }
    
    static func newHabit(
        habitColorHex: String,
        days: Int,
        name: String
    ) -> Self {
        HabitModel(
            habitId: UUID().uuidString,
            habitColorHex: habitColorHex,
            days: days,
            name: name,
            dateCreated: .now
        )
    }
    
    static var mock: Self {
        mocks[0]
    }
    
    static var mocks: [Self] {
        [
            HabitModel(
                habitId: UUID().uuidString,
                habitColorHex: "#87CEEB",
                days: 123,
                name: "Drawing",
                dateCreated: .now
            ),
            HabitModel(
                habitId: UUID().uuidString,
                habitColorHex: "#EE4B2B",
                days: 456,
                name: "Programming",
                dateCreated: .now
            ),
            HabitModel(
                habitId: UUID().uuidString,
                habitColorHex: "#228B22",
                days: 789,
                name: "Gym",
                dateCreated: .now
            )
        ]
    }
}
