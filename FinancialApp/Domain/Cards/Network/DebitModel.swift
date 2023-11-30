import Foundation

struct Debit: Codable {
    
    let name: String
    let colour: String
    let image: String
    let description: String
    let total: Decimal
    let installments: [Installment]
    
}
