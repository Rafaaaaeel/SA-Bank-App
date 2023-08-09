import UIKit

final class DebitsInteractor: DebitsInteractorOutput {
    var presenter: DebitsPresenterOutput?
    var worker: DebitsWorkerProtocol?
    
    
}

extension DebitsInteractor: DebitsInteractorInput {
    func getDebits() {
        worker?.getDebits()
    }
    
    
    func didTouchDebit() {}
    
}

extension DebitsInteractor: DebitWokerOutputProtocol {
    
    func getDebitSucceded(viewModel: DebitsModel.ViewModel) {
        presenter?.succededView()
    }
    
    func getDebitFailed(error: Error) {
        presenter?.failedView()
    }
    
    
}
