class LoginWoker: LoginWorkerProtocol {
    
    var apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }
    
    func didLogin() {
        
    }
    
}

