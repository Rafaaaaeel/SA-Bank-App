import Foundation

typealias Debits = DebitsModel.Response

struct DebitsModel {
    
    struct Request: RequestProtocol  {
        
        var method: HTTPMethods = .get
        
        var id: String?
        
        var endpoint: String = "debits"
        
        var endpoints: [String : String] = [
            
            "debits": "debits",
            "delete": "debits/",
            "deleteAll": "debits/all"
        ]
        
        var params: [String : String]?
    
        var url: String {
            return "/" + (endpoints[endpoint] ?? "")
        }
    }
    
    struct Response: Codable {
        let data: [Debit]
    }
    
    struct ViewModel {
        let data: [Debit]

        var cout: Int {
            return data.count
        }
        
    }
    
}

struct Test: Codable {
    let message: String
}
