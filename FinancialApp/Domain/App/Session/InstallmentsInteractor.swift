final class InstallmentsInteractor: InstallmentsInteractorInput, InstallmentsInteractorOutput {
    
    var presenter: InstallmentsPresenterOutput?
    var worker: InstallmentWorkerProtocol?
    
}

extension InstallmentsInteractor: InstallmentsWokerOutputProtocol {
    
}
