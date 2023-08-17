import UIKit

final class CreatorInterector: CreatorInteractorOutput {
    var presenter: CreatorPresenterOutput?
    
    var worker: CreatorWorkerProtocol?
}

extension CreatorInterector: CreatorInteractorInput  {

    
}

extension CreatorInterector: CreatorWokerOutputProtocol {
    
}
