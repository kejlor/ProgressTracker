import SwiftUI

struct HabitView: View {
    @State var presenter: HabitPresenter
    let habit: HabitModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(habit.days)")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Image(systemName: "flame.fill")
                            .foregroundStyle(habit.habitColorCalculated)
                    }
                    
                    Text("DAYS")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    // TODO: Mutate habit progress
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .foregroundStyle(habit.habitColorCalculated)
                        .frame(width: 25, height: 25)
                }
            }
            .padding(.bottom, 20)
            
            Text(habit.name)
                .font(.footnote)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            // MARK: This code is causing issues with repeated id for each day
            HStack {
//                ForEach(Date.capitalizedFirstLettersOfWeekdays, id: \.self) { day in
//                    dayOfTheWeek(day: day)
//                }
            }
        }
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(habit.habitColorCalculated.opacity(0.2))
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
