final class DebitsWorker: DebitsWorkerProtocol {
    
    var apiClient: APIClientProtocol
    var output: DebitWokerOutputProtocol?
    
    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }
    
    func getDebits() {
        Task {
            do {
                let request = DebitsModel.Request(endpoint: "debits")
                let response: DebitsModel.Response = try await apiClient.requestData(request: request)
                output?.getDebitSucceded(response: response)
            } catch let error {
                print(error)
            }
        }
    }
}

