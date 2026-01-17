import SwiftUI

struct HabitView: View {
    @State var presenter: HabitPresenter
    let habit: HabitModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                habitTitle
                daysSection
                completedTodaySection
                currentWeekProgressSection
            }
            completeButton
        }
        .padding(15)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(habit.habitColorCalculated.opacity(0.2))
        }
    }
}

private extension HabitView {
    private var habitTitle: some View {
        Text(habit.name)
            .font(.title)
            .fontWeight(.bold)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var completeButton: some View {
        Button {
            // TODO: Mutate habit progress
            // TODO: Hide this button, change foreground style of completed today component
        } label: {
            VStack {
                Image(systemName: "checkmark.square.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundStyle(habit.habitColorCalculated)
            }
            .foregroundStyle(habit.habitColorCalculated)

        }
    }
    
    private var daysSection: some View {
        HStack {
            Text("\(habit.days)")
                .font(.title)
                .fontWeight(.bold)
            
            Text("DAYS")
                .font(.body)
                .foregroundStyle(.gray)
        }
    }
    
    private var completedTodaySection: some View {
        HStack {
            Text("Completed today")
            
            Image(systemName: "checkmark.square.fill")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundStyle(habit.habitColorCalculated)
        }
    }
    
    // MARK: This code is causing issues with repeated id for each day
    private var currentWeekProgressSection: some View {
        HStack {
//            ForEach(Date.capitalizedFirstLettersOfWeekdays, id: \.self) { day in
//                dayOfTheWeek(day: day)
//            }
        }
    }
}

extension HabitView {
    private func dayOfTheWeek(
        day: String,
        isCompleted: Bool = false
    ) -> some View {
        VStack {
            Text(day)
                .font(.caption)
            RoundedRectangle(cornerRadius: 4)
                .fill(habit.habitColorCalculated)
                .frame(width: 15, height: 15)
        }
    }
}

#Preview("Single habit") {
    let container = DevPreview.shared.container
    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
    
    return RouterView { router in
        builder.createHabitView(
            router: router,
            habit: HabitModel.mock
        )
    }
}

#Preview("Two habits") {
    let container = DevPreview.shared.container
    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
    
    return RouterView { router in
        HStack {
            builder.createHabitView(
                router: router,
                habit: HabitModel.mocks[0]
            )
            builder.createHabitView(
                router: router,
                habit: HabitModel.mocks[1]
            )
        }
    }
}
