import UIKit

final class CreatorWorker: CreatorWorkerProtocol {
    
    var apiClient: APIClientProtocol
    var output: CreatorWokerOutputProtocol?
    
    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }
    
}
