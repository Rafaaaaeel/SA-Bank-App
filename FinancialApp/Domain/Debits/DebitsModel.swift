import Foundation


typealias Debits = DebitsModel.Response

struct DebitsModel {
    
    struct Request: RequestProtocol  {
        
        var endpoint: String = "debits"
        var params: [String : String]?
    
    }
    
    struct Response: Codable {
        let data: [Debit]
    }
    
    struct ViewModel { }
    
}
