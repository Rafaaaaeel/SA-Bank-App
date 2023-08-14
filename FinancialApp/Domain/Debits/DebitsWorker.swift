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
                let request = DebitsModel.Request(method: .delete, id: id, endpoint: "delete")
                let response: DebitsModel.Response = try await apiClient.request(request: request)
                output?.deleteDebitSucced(response: response)
            } catch let error {
                print(error)
            }
        }
    }
}

