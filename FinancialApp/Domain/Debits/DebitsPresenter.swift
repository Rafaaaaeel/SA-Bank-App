final class DebitsPresenter: DebitsPresenterOutput {

    var view: DebitsViewControllerProtocol?
    
    func succededView(_ viewModel: DebitsModel.ViewModel) {
        view?.didLoadData(viewModel)
    }
    
    func failedView() {
        view?.didLoadFailed()
    }
    
    func deleteDebitSucceded(_ viewModel: DebitsModel.ViewModel) {
        view?.didDeleted(viewModel)
    }
    
    
}
