import Foundation

final class DebitsWorker: DebitsWorkerProtocol {

    var apiClient: APIClientProtocol
    var output: DebitWokerOutputProtocol?
    
    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }
    
    func getDebits() {
        Task {
            do {
                let request = DebitsModel.Request()
                let response: DebitsModel.Response = try await apiClient.request(request: request)
                output?.getDebitSucceded(response: response)
            } catch let error {
                print(error)
            }
        }
    }
    
    func removeDebit(_ id: String) {
        Task {
            do {
                var request = DebitsModel.Request(method: .delete, endpoint: "deleteAll")
                let response: Test = try await apiClient.request(request: request)
                print(response.message)
            } catch let error {
                print(error)
            }
        }
    }
}

