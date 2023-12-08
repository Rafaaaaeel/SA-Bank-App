import Foundation

final class CardsWorker: CardsWorkerProtocol {

    var apiClient: APIClientProtocol
    var output: CardsWokerOutputProtocol?
    
    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }
    
    func getDebits() {
//        Task {
//            do {
//                let request = DebitsModel.Request()
//                let response: DebitsModel.Response = try await apiClient.request(request: request)
//                output?.getDebitSucceded(response: response)
//            } catch let error {
//                output?.getDebitFailed(error: error)
//            }
//        }
        mockData()
    }
    
    func removeDebit(_ id: String) {
        Task {
            do {
                let request = CardsModel.Request(method: .delete, id: id, endpoint: "delete")
                let response: CardsModel.Response = try await apiClient.request(request: request)
                output?.deleteDebitSucced(response: response)
            } catch let error {
                print(error)
            }
        }
    }
    
    private func mockData() {
        
        do {
            guard let path = Bundle.main.url(forResource: "cards-mock", withExtension: "json") else { return }
            let data = try Data(contentsOf: path)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(CardsModel.Response.self, from: data)
        
            output?.getDebitSucceded(response: jsonData)
            
        } catch let error {
            print(error)
        }
        
    }
}

