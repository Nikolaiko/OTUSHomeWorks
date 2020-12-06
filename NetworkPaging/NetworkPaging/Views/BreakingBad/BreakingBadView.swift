import SwiftUI

struct BreakingBadView: View {
    @ObservedObject var viewModel = BBViewModel()
    @EnvironmentObject private var navigation: NavControllerViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.state.items) { item in
                Text(item.name ?? "Empty Name")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        navigation.push(BreakingBadCharacterView(character: item))
                    }
                    .onAppear() {
                        if viewModel.state.items.isLastItem(item) {
                            viewModel.fetchCharacters()
                        }
                    }
            }
            
            if viewModel.state.canLoadNextPage {
                Spinner(style: .medium)
                    .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
            }
        }
        .onAppear {
            viewModel.fetchCharacters()
        }
        .navigationBarTitle(Text("Breaking bad"))
    }
}

struct BreakingBadView_Previews: PreviewProvider {
    static var previews: some View {
        BreakingBadView()
    }
}
