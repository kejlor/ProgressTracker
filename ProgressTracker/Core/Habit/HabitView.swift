import SwiftUI

struct HabitView: View {
    @State var presenter: HabitPresenter
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                habitTitle
                daysSection
                if presenter.hasCompletedToday {
                    completedTodaySection
                }
                currentWeekProgressSection
            }
            if !presenter.hasCompletedToday {
                completeButton
            }
        }
        .padding(15)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(presenter.habit.habitColorCalculated.opacity(0.2))
        }
    }
}

private extension HabitView {
    private var habitTitle: some View {
        Text(presenter.habit.name)
            .font(.title)
            .fontWeight(.bold)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var completeButton: some View {
        Button {
            presenter.markTodayAsCompleted()
        } label: {
                Image(systemName: "checkmark.square.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
        }
        .foregroundStyle(presenter.habit.habitColorCalculated)
        .buttonStyle(.plain)
    }
    
    private var daysSection: some View {
        HStack {
            Text("\(presenter.habit.days)")
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
                .foregroundStyle(presenter.habit.habitColorCalculated)
        }
    }
    
    private var currentWeekProgressSection: some View {
        return HStack {
            ForEach(presenter.weekDays, id: \.self) { date in
                dayOfTheWeek(date: date)
            }
        }
    }
}

extension HabitView {
    private func dayOfTheWeek(date: Date) -> some View {
        VStack {
            Text(presenter.formatDate(date))
                .font(.caption)
            RoundedRectangle(cornerRadius: 4)
                .fill(presenter.hasCompleted(for: date) ? presenter.habit.habitColorCalculated : .gray)
                .frame(width: 15, height: 15)
        }
    }
}

#Preview("Single habit") {
    let container = DevPreview.shared.container
    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
    
    return RouterView { router in
        builder.habitListView(
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
            builder.habitListView(
                router: router,
                habit: HabitModel.mocks[0]
            )
            builder.habitListView(
                router: router,
                habit: HabitModel.mocks[1]
            )
        }
    }
}
