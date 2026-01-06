import SwiftUI

struct HabitProps {
    var selectedColor: Color = .blue
    var days: Int = 0
    var name: String = "Programming"
}

struct HabitView: View {
    @State var presenter: HabitPresenter
    let props: HabitProps
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(props.days)")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Image(systemName: "flame.fill")
                            .foregroundStyle(props.selectedColor)
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
                        .foregroundStyle(props.selectedColor)
                        .frame(width: 25, height: 25)
                }
            }
            .padding(.bottom, 20)
            
            Text(props.name)
                .font(.footnote)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            HStack {
                ForEach(Date.capitalizedFirstLettersOfWeekdays, id: \.self) { day in
                    dayOfTheWeek(day: day)
                }
            }
        }
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(props.selectedColor.opacity(0.2))
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
                .fill(props.selectedColor)
                .frame(width: 15, height: 15)
        }
    }
}

#Preview("Single habit") {
    let container = DevPreview.shared.container
    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
    let props = HabitProps()
    
    return RouterView { router in
        builder.createHabitView(
            router: router,
            props: props
        )
    }
}

#Preview("Two habits") {
    let container = DevPreview.shared.container
    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
    let props = HabitProps()
    
    return RouterView { router in
        HStack {
            builder.createHabitView(
                router: router,
                props: props
            )
            builder.createHabitView(
                router: router,
                props: props
            )
        }
    }
}
