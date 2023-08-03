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
