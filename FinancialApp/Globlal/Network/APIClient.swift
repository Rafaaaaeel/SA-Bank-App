import Foundation



public class APIClient: APIClientProtocol {

    static public let shared = APIClient()
    
    private let session = URLSession.shared
    private let baseURL = "https://debits-service-bff.onrender.com"
    private let urlSession = URLSession.shared
    private let jsonDecoder = Decoder().decoder

    private init() { }
    
    public func request<T: Decodable, Request: RequestProtocol>(request: Request) async throws -> T {
        do {
            guard let url = URL(string: baseURL + request.url + (request.id ?? "")) else {
                throw RequestError.invalidEndpoint
            }

            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = request.method.rawValue
            
            let (data, response) = try await session.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw RequestError.invalidResponse
            }
            
            return try self.jsonDecoder.decode(T.self, from: data)
            
        } catch _ {
            
            throw RequestError.serializationError
            
        }
        
    }
    
}
