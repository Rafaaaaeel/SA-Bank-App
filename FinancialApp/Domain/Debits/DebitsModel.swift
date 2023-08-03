import Foundation

struct DebitsModel {
    
    struct Request: RequestProtocol  {
        
        var endpoint: String = "debits"
        var params: [String : String]?
    
    }
    
    struct Response {
        
    }
    
    struct ViewModel {
        
    }
    
}
