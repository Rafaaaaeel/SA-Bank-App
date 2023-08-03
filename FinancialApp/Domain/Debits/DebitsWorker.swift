final class DebitsWorker: DebitsWorkerProtocol {
    
    var apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }
    
    func getDebits() {
        let request = DebitsModel.Request(endpoint: "debits")
    }
}

