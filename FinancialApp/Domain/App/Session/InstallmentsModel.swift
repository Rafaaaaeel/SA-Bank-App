import Foundation

struct Installment: Codable {
        
    let name: String
    let description: String
    let value: Decimal
    let total: Decimal
    let initial: String
    let final: String
    
}
