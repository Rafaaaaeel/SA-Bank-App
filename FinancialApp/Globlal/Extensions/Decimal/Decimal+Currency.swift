import Foundation

extension Decimal {
    
    func asNSNumber() -> NSNumber {
        return self as NSNumber
    }
    
    var asCurrencyValue: String {
        let currencyFormatter = NumberFormatter()

        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = "R$"
        currencyFormatter.locale = Locale(identifier: "pt_BR")

        guard let brCurrencyString = currencyFormatter.string(from: asNSNumber()) else {
            print("[ERROR] Problem to convert Decimal to currency from file: \(#file) \(#line)")
            return ""
        }

        return brCurrencyString
    }
    
}
