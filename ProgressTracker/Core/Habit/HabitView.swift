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
            VStack(spacing: 0) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text(props.name)
                                .font(.title)
                                .fontWeight(.bold)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        // TODO: Mutate habit progress
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .foregroundStyle(props.selectedColor)
                            .frame(width: 30, height: 30)
                    }
                }
                
                HStack {
                    Text("Days")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("\(props.days)")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Image(systemName: "flame.fill")
                        .font(.title3)
                        .foregroundStyle(props.selectedColor)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            HStack(alignment: .bottom) {
                HStack {
                    ForEach(Date.capitalizedFirstLettersOfWeekdays, id: \.self) { day in
                        dayOfTheWeek(day: day)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("7 out of 7")
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
            RoundedRectangle(cornerRadius: 4)
                .fill(props.selectedColor)
//                .fill(isCompleted ? props.selectedColor : .white)
//                    .stroke(props.selectedColor, lineWidth: 1)
                .frame(width: 15, height: 15)
        }
    }
}

#Preview {
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
