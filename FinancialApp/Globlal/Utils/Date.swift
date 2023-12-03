import Foundation

struct DateManager {
    
    static func currentMonth() -> String? {
        let currentDate = Date()
        guard let futureDate = Calendar.current.date(byAdding: .month, value: 1, to: currentDate) else { return nil }
        return futureDate.monthName()
    }
    
    static func dateConversor(_ date: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        if let date = dateFormatter.date(from: date) {
            return date
        } else {
            return nil
        }
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
