import Foundation

struct CreatorModel {
    
    struct Request: RequestProtocol  {
        
        var id: String?
        
        var method: HTTPMethods = .get
        
        var endpoint: String = "debits"
        
        var endpoints: [String : String] = [:]
        
        var params: [String : String]?
    
        var url: String {
            return ""
        }
    }
    
    struct Response { }
    
    struct ViewModel { }
    
}

