final class RegisterWoker: RegisterWorkerProtocol {
    var apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }
    
}
