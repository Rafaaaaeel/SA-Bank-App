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
                let data: DebitsModel.Response = try await apiClient.requestData(request: request)
                print(data)
//                let viewModel = data as? DebitsModel.ViewModel
//                output?.getDebitSucceded(viewModel: viewModel!)
            } catch let error {
                print(error)
            }
        }
        
        
    }
}

