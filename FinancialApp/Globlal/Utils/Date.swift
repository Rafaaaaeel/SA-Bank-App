import Foundation

struct DateManager {
    
    static func currentMonth() -> Date? {
        let currentDate = Date()
        guard let futureDate = Calendar.current.date(byAdding: .month, value: 1, to: currentDate) else { return nil }
        return futureDate
    }
    
    static func dateConversor(_ date: String) -> Date? {
        let dateFormatter = DateFormatter()
        let currentLocale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = Locale(identifier: currentLocale.identifier)
        if let date = dateFormatter.date(from: date) {
            return date
        } else {
            return nil
        }
    }
    
    static func currentParcel(purchase date: String, parcel quantity: Int) -> String? {
        let calendar = Calendar.current
        
        guard let initial = dateConversor(date), let end = calendar.date(byAdding: .month, value: quantity, to: initial), let today = currentMonth() else { return nil }
        
        let paids = calendar.dateComponents([.month], from: today, to: end).month

        let totalPaid = quantity - paids!
        return Text.Card.parcels(initial: totalPaid.toString, end: quantity.toString)
    }
    
    static func parcels(initial: String, final: String) -> String? {
        let currentDate = Date()
        
        guard let initial = dateConversor(initial), let final = dateConversor(final), let futureDate = Calendar.current.date(byAdding: .month, value: 1, to: currentDate) else { return nil }
        
        let calendar = Calendar.current
        let actual = calendar.dateComponents([.month], from: futureDate, to: final).month ?? -1
        let finalDate = calendar.dateComponents([.month], from: initial, to: final).month ?? -1
        let paids = finalDate - (actual - 1)
        
        return "\(paids)/\(finalDate)"
    }
    
}

extension Date {
    func monthName() -> String {
            let df = DateFormatter()
            df.setLocalizedDateFormatFromTemplate("MMM")
            return df.string(from: self)
    }
}

extension Int {
    var toString: String {
        return String(self)
    }
}
