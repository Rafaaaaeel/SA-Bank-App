import Foundation

//public typealias Response = (Result<Decodable, RequestError>) -> Void

public protocol APIClientProtocol {
    
    func request<T: Decodable, Request: RequestProtocol>(request: Request) async throws -> T
    
}

public enum HTTPMethods: String {
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
}

public protocol RequestProtocol {
    
    var id: String? { get }
    var url: String { get }
    var method: HTTPMethods { get }
    var endpoint: String { get }
    var endpoints: [String: String] { get }
    var params: [String: String]? { get }
    
}
