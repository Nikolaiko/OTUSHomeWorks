import Foundation

protocol URLQueryParameterStringConvertible {
    var queryParameters: String {get}
}

extension URL {
    func appendingQueryParameters(_ parametersDictionary : Dictionary<String, Any>) -> URL {
        let URLString : String = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
        return URL(string: URLString)!
    }
}
