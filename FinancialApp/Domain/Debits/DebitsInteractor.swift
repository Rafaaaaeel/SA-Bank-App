import UIKit

final class DebitsInteractor: DebitsInteractorOutput {
    var presenter: DebitsPresenterOutput?
    var worker: DebitsWorkerProtocol?
    
    
}

extension DebitsInteractor: DebitsInteractorInput {

    func getDebits() {
        worker?.getDebits()
    }
    
    func removeDebit(_ id: String) {
        worker?.removeDebit(id)
    }
    
}

extension DebitsInteractor: DebitWokerOutputProtocol {
    
    func getDebitSucceded(response: DebitsModel.Response) {
        let viewModel = DebitsModel.ViewModel(data: response.data)
        presenter?.succededView(viewModel)
    }
    
    
    func getDebitFailed(error: Error) {
        presenter?.failedView()
    }
    
    func deleteDebitSucced(response: DebitsModel.Response) {
        let viewModel = DebitsModel.ViewModel(data: response.data)
        presenter?.deleteDebitSucceded(viewModel)
    }
    
}
