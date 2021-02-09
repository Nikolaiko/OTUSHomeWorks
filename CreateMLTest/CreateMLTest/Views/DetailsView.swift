import SwiftUI
import Vision

struct DetailsView: View {
    var image: UIImage
    @EnvironmentObject var navigation: NavigationControllerViewModel
    @State var resultId: String = "Undefined"
    @State var confidence: String = "Undefined"
    
    var classifier = ModelClassifier()
    
    var body: some View {
        VStack {
            Button(action: { navigation.pop() }, label: {
                Text("BACK")
            })
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(resultId)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .bold()
            Text(confidence)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .bold()
        }
        .onAppear {
            classifier.createModelAndRequest { request, error in
                DispatchQueue.main.async {
                    guard let results = request.results else { return }
                    var classifications = results as! [VNClassificationObservation]
                    classifications.sort { a, b -> Bool in
                        a.confidence > b.confidence
                    }
                    resultId = classifications.first!.identifier
                    confidence = String(classifications.first!.confidence)
                }
            }
            classifier.processImage(image: image.cgImage!)
        }
    }
}
