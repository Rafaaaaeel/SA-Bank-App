final class RegisterWoker: RegisterWorkerProtocol {
    var apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
}
