extension Optional where Wrapped == String {
    
    var nilOrEmpty: String {
        return self ?? ""
    }
    
}
