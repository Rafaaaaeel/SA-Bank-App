final class DebitsPresenter: DebitsPresenterOutput {

    var view: DebitsViewControllerProtocol?
    
    func succededView(_ viewModel: DebitsModel.ViewModel) {
        view?.didLoadData(viewModel)
    }
    
    func failedView() {
        
    }
    
    func deleteDebitSucceded() {
        view?.didDeleted()
    }
    
    
}
