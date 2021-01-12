import SwiftUI

public struct ClassesView: View {
    @ObservedObject private var model = ClassesViewModel()
    @EnvironmentObject private var navigation: NavControllerViewModel
    
    public var body: some View {
        ZStack {
            VStack {
                Text("Hearthstone classes")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                ScrollView {
                    ForEach(model.state.classes, id:\.self) { className in
                        Text(className)
                            .foregroundColor(Color.black)
                            .padding(10)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                navigation.push(ClassCardsView(selectedClass: className))
                            }
                    }
                }
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            if model.state.isLoading {
                ProgressView()
            }
        }
        .background(Color.white)
        .onAppear {
            model.fetchCharacters()
        }
    }
}

public struct ClassesView_Previews: PreviewProvider {
    public static var previews: some View {
        ClassesView()
    }
}
