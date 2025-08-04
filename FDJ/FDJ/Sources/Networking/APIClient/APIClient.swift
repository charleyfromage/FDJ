import Foundation

protocol APIClient: AnyObject {
    func getData<T: Decodable>(type: T.Type, from endpoint: Endpoint) async throws -> T
}

final class APIClientImpl: APIClient {
    private typealias Result = (data: Data, response: URLResponse)
    
    private let contentTypeHeader = Strings.API.HTTPRequestHeader.Keys.contentType
    private let jsonContentType = Strings.API.HTTPRequestHeader.Values.applicationJson
    
    private let session = URLSession(configuration: .default)
    private let jsonDecoder = JSONDecoder()
    
    func getData<T: Decodable>(type: T.Type, from endpoint: Endpoint) async throws -> T {
        guard var urlComponents = URLComponents(string: endpoint.path)
        else {
            throw APIError.invalidPath
        }
        
        if let parameters = endpoint.parameters {
            urlComponents.queryItems = parameters
        }
        
        guard let url = urlComponents.url
        else {
            throw APIError.invalidParameters
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.setValue(jsonContentType, forHTTPHeaderField: contentTypeHeader)
        
        let result: Result = try await session.data(for: request)
        
        return try jsonDecoder.decode(T.self, from: result.data)
    }
}
