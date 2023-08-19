extension Optional where Wrapped == DebitsModel.ViewModel {
    
    var orEmpty: DebitsModel.ViewModel {
        return self ?? DebitsModel.ViewModel(data: [])
    }
    
}
