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
    
    func getDebitSucceded(response: DebitsModel.Response) {
        let viewModel = DebitsModel.ViewModel(data: response.data)
        presenter?.succededView(viewModel)
    }
    
    
    func getDebitFailed(error: Error) {
        presenter?.failedView()
    }
    
    
}
