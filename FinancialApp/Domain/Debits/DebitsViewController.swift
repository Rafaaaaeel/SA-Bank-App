import UIKit

class DebitsViewController: CommonViewController, DebitsViewControllerProtocol {

    var interactor: DebitsInteractorInput?
    var router: DebitsRouterProtocol?
    
    private let debitsView = DebitsView()
    
    override func loadView() {
        super.loadView()
        view = debitsView
    }
}
