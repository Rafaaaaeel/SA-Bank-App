import Foundation

protocol APIClientProtocol {
    
    func requestData<T: Decodable, Request: RequestProtocol>(request: Request) async throws -> T
    
}

protocol RequestProtocol {
    
    var endpoint: String { get }
    var params: [String: String]? { get }
    
}
