import SwiftUI

struct HabitProps: Identifiable {
    var id: String = UUID().uuidString
    var selectedColor: Color = .blue
    var days: Int = 0
    var name: String = "Programming"
}

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
//                            .foregroundStyle(habit.selectedColor)
                            .foregroundStyle(Color(uiColor: hexStringToUIColor(hex: habit.selectedColor)))
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
//                        .foregroundStyle(habit.selectedColor)
                        .foregroundStyle(Color(uiColor: hexStringToUIColor(hex: habit.selectedColor)))
                        .frame(width: 25, height: 25)
                }
            }
            .padding(.bottom, 20)
            
            Text(habit.name)
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
//                .fill(habit.selectedColor.opacity(0.2))
                .fill(Color(uiColor: hexStringToUIColor(hex: habit.selectedColor)).opacity(0.2))
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
//                .fill(habit.selectedColor)
                .fill(Color(uiColor: hexStringToUIColor(hex: habit.selectedColor)))
                .frame(width: 15, height: 15)
        }
    }
}

func hexStringToUIColor(hex: String) -> UIColor {
    var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if cString.hasPrefix("#") {
        cString.remove(at: cString.startIndex)
    }
    
    if cString.count != 6 {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

//#Preview("Single habit") {
//    let container = DevPreview.shared.container
//    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
//    let props = HabitProps()
//    
//    return RouterView { router in
//        builder.createHabitView(
//            router: router,
//            props: props
//        )
//    }
//}
//
//#Preview("Two habits") {
//    let container = DevPreview.shared.container
//    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
//    let props = HabitProps()
//    
//    return RouterView { router in
//        HStack {
//            builder.createHabitView(
//                router: router,
//                props: props
//            )
//            builder.createHabitView(
//                router: router,
//                props: props
//            )
//        }
//    }
//}
