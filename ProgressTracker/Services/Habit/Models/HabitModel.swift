//
//  HabitModel.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 15/01/2026.
//

import SwiftUI

struct HabitModel: Hashable, Codable {
    let id: UUID
    let habitColorHex: String
    private(set) var days: Int
    private(set) var name: String
    let dateCreated: Date?
    
    init(
        id: UUID,
        habitColorHex: String,
        days: Int,
        name: String,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.habitColorHex = habitColorHex
        self.days = days
        self.name = name
        self.dateCreated = dateCreated
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
            id: UUID(),
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
                id: UUID(),
                habitColorHex: "#87CEEB",
                days: 123,
                name: "Drawing",
                dateCreated: .now
            ),
            HabitModel(
                id: UUID(),
                habitColorHex: "#EE4B2B",
                days: 456,
                name: "Programming",
                dateCreated: .now
            ),
            HabitModel(
                id: UUID(),
                habitColorHex: "#228B22",
                days: 789,
                name: "Gym",
                dateCreated: .now
            )
        ]
    }
}
