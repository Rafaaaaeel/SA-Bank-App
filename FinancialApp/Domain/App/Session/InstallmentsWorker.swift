final class InstallmentsWorker: InstallmentWorkerProtocol {
    
    var apiClient: APIClientProtocol
    var output: InstallmentsWokerOutputProtocol?
    
    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }
}
