//
//  CustomCalendarMonthView.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 22/03/2026.
//

import SwiftUI

struct CustomCalendarMonthView: View {
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    @State private var days: [Date] = []
    @State private var date = Date.now
    @State private var color: Color = .blue
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(days, id: \.self) { day in
                if day.monthInt != date.monthInt {
                    Rectangle()
                        .frame(width: 14, height: 14)
                        .opacity(0)
                } else {
                    Rectangle()
                        .frame(width: 14, height: 14)
                        .foregroundStyle(.blue)
                    // MARK: GOALS
                    // 1. Color for completed date
                    // 2. Color . black tint for previous and not completed date
                    // 3. Gray color for future dates
                    
                    // MARK: Next view
                    // 1. Build a view for year where user has started habit
                    // 2. Fill each month in 3 column grid
                    // 3. Check how does the spacing will look like
                    // 4. Build on small iPhone SE to check how does it look
                }
            }
        }
        .onAppear {
            days = date.calendarDisplayDays
        }
    }
}

#Preview {
    CustomCalendarMonthView()
}
