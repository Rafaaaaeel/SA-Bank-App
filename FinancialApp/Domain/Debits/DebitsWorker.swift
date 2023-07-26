final class DebitsWorker: DebitsWorkerProtocol {
    var apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
}

