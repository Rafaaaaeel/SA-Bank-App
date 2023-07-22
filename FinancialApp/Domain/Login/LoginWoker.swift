class LoginWoker: LoginWorkerProtocol {
    
    var apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
    func didLogin() {
        
    }
    
}

