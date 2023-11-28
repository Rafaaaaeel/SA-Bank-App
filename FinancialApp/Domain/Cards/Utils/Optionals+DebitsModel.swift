extension Optional where Wrapped == CardsModel.ViewModel {
    
    var orEmpty: CardsModel.ViewModel {
        return self ?? CardsModel.ViewModel(data: [])
    }
    
}
