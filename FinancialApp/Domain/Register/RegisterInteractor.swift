
final class RegisterInteractor: RegisterInteractorOutput {
    
    weak var presenter: RegisterPresenterOutput?
    weak var worker: RegisterWorkerProtocol? 
}

extension RegisterInteractor: RegisterInteractorInput {
    
    func didRegister() {
        
    }
    
}
