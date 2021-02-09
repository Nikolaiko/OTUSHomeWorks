import SwiftUI

struct ListView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Image("cat1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        navigation.push(DetailsView(image: UIImage(named: "cat1")!))
                    }
                
                Image("cat2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        navigation.push(DetailsView(image: UIImage(named: "cat2")!))
                    }
                
                Image("cat3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        navigation.push(DetailsView(image: UIImage(named: "cat3")!))
                    }
                
                Image("lion1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        navigation.push(DetailsView(image: UIImage(named: "lion1")!))
                    }
                
                Image("lion2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        navigation.push(DetailsView(image: UIImage(named: "lion2")!))
                    }
                
                Image("elep1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        navigation.push(DetailsView(image: UIImage(named: "elep1")!))
                    }
                
                Image("elep2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        navigation.push(DetailsView(image: UIImage(named: "elep2")!))
                    }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
