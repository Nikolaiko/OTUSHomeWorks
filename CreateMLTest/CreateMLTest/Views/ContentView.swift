import SwiftUI

struct ContentView: View {
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    private var classifier: ModelClassifier = ModelClassifier()
    
    var body: some View {
        NavigationControllerView(transition: .custom(
            AnyTransition.move(edge: .top).combined(with: .scale),
            .slide
        )) {
            ListView()
        }
    }
    
    private func createImage(selectedImage: UIImage) -> some View {
        classifier.processImage(image: selectedImage.cgImage!)
        return Image(uiImage: selectedImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .frame(width: 300, height: 300)
    }
}
