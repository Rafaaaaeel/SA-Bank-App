final class CardsPresenter: CardsPresenterOutput {

    var view: CardsViewControllerProtocol?
    
    func succededView(_ viewModel: CardsModel.ViewModel) {
        view?.didLoadData(viewModel)
    }
    
    func failedView() {
        view?.didLoadFailed()
    }
    
    func deleteDebitSucceded(_ viewModel: CardsModel.ViewModel) {
        view?.didDeleted(viewModel)
    }
    
    
}
