extension Double {
    
    public var toString: String {
        return String(self)
    }
    
    public var asCurrencyValue: String {
        
        guard self > 0 else {  return .empty }
        return Text.Common.currency + self.toString
        
    }
}
