import Vision

class ModelClassifier {
    private var model: VNCoreMLModel? = nil
    private var request: VNCoreMLRequest? = nil
    
    func createModelAndRequest(handler: @escaping VNRequestCompletionHandler) {
        model = try! VNCoreMLModel(for: AnimalsClassifier_1().model)
        request = VNCoreMLRequest(model: model!, completionHandler: handler)
        request!.imageCropAndScaleOption = .centerCrop
    }
    
    func processImage(image: CGImage) {
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(cgImage: image)
            do {
                try handler.perform([self.request!])
            } catch {
                print("Failed to perform classification.\n\(error.localizedDescription)")
            }
        }
    }
    
    private func processClassifications(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let results = request.results else { return }
            var classifications = results as! [VNClassificationObservation]
            classifications.sort { a, b -> Bool in
                a.confidence > b.confidence
            }
            print(classifications.first!.identifier)
        }
    }
}
