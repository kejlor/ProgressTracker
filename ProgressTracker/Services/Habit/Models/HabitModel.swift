//
//  HabitModel.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 15/01/2026.
//

import Foundation

struct HabitModel: Hashable, Codable {
    var id: String {
        habitId
    }
    
    let habitId: String
    let selectedColor: String
    private(set) var days: Int
    private(set) var name: String
    let dateCreated: Date?
    
    init(
        habitId: String,
        selectedColor: String,
        days: Int,
        name: String,
        dateCreated: Date? = nil
    ) {
        self.habitId = habitId
        self.selectedColor = selectedColor
        self.days = days
        self.name = name
        self.dateCreated = dateCreated
    }
    
    mutating func updateName(name: String) {
        self.name = name
    }
    
    mutating func updateDays(days: Int) {
        self.days = days
    }
    
    static func newHabit(
        selectedColor: String,
        days: Int,
        name: String
    ) -> Self {
        HabitModel(
            habitId: UUID().uuidString,
            selectedColor: selectedColor,
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
                selectedColor: "#87CEEB",
                days: 123,
                name: "Drawing",
                dateCreated: .now
            ),
            HabitModel(
                habitId: UUID().uuidString,
                selectedColor: "#EE4B2B",
                days: 456,
                name: "Programming",
                dateCreated: .now
            ),
            HabitModel(
                habitId: UUID().uuidString,
                selectedColor: "#228B22",
                days: 789,
                name: "Gym",
                dateCreated: .now
            )
        ]
    }
}
