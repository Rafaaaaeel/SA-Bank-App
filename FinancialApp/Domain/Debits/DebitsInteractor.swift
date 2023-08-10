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
        let viewModel = DebitsModel.ViewModel(model: ["title": response.data.compactMap( { $0.name } ), "color": response.data.compactMap( { $0.color } )])
        presenter?.succededView(viewModel)
    }
    
    
    func getDebitFailed(error: Error) {
        presenter?.failedView()
    }
    
    
}
