import Foundation

class APIClient: APIClientProtocol {

    static public let shared = APIClient()
    
    private let baseURL = "https://debits-service-bff.onrender.com/"
    private let urlSession = URLSession.shared
    private let jsonDecoder = Decoder().decoder

    private init() { }
    
    public func requestData<T: Decodable, Request: RequestProtocol>(request: Request) async throws -> T {
        guard let url = URL(string: baseURL + request.endpoint), var urlComponents = URLComponents(url: url , resolvingAgainstBaseURL: false) else {
            throw RequestError.invalidEndpoint
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: nil)]
        
        if let params = request.params {
            queryItems.append(contentsOf: params.map { URLQueryItem(name: $0.key, value: $0.value) })
        }
        
        urlComponents.queryItems = queryItems
        
        guard let finalURL = urlComponents.url else {
            throw RequestError.invalidEndpoint
        }
        
        let (data, response) = try await urlSession.data(from: finalURL)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw RequestError.invalidResponse
        }
        
        return try self.jsonDecoder.decode(T.self, from: data)
    }
    
    
}
