//
//  HabitModel.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 15/01/2026.
//

import SwiftUI

struct HabitModel: Hashable, Codable {
    let id: UUID
    var habitColorHex: String
    var days: Int
    var name: String
    let startDate: Date
    
    init(
        id: UUID,
        habitColorHex: String,
        days: Int,
        name: String,
        startDate: Date
    ) {
        self.id = id
        self.habitColorHex = habitColorHex
        self.days = days
        self.name = name
        self.startDate = startDate
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
        name: String,
        startDate: Date
    ) -> Self {
        HabitModel(
            id: UUID(),
            habitColorHex: habitColorHex,
            days: days,
            name: name,
            startDate: startDate
        )
    }
    
    static var mock: Self {
        mocks[0]
    }
    
    static var mocks: [Self] {
        [
            HabitModel(
                id: UUID(),
                habitColorHex: "#87CEEB",
                days: 123,
                name: "Drawing",
                startDate: Date(timeInterval: -604800, since: .now)
            ),
            HabitModel(
                id: UUID(),
                habitColorHex: "#EE4B2B",
                days: 456,
                name: "Programming",
                startDate: .now
            ),
            HabitModel(
                id: UUID(),
                habitColorHex: "#228B22",
                days: 789,
                name: "Gym",
                startDate: .now
            )
        ]
    }
}
