import SwiftUI

struct HabitProps {
    var selectedColor: Color = .blue
    var days: Int = 0
    var name: String = "Meditate"
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
                            Text("\(props.days)")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Image(systemName: "flame.fill")
                                .font(.title3)
                                .foregroundStyle(props.selectedColor)
                        }
                        
                        Text("Days")
                            .font(.body)
                            .fontWeight(.thin)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        // TODO: Mutate days from props
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .foregroundStyle(props.selectedColor)
                            .frame(width: 30, height: 30)
                    }
                }
            }
            
            Text(props.name)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.top, 15)
            
            // TODO: Add calendar widget here
        }
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(props.selectedColor.opacity(0.2))
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
