extension Optional where Wrapped == DebitsModel.ViewModel {
    
    var orEmpty: Int {
        return self?.cout ?? 0
    }
    
}
