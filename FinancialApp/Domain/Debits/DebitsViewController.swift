import UIKit

class DebitsViewController: CommonViewController, DebitsViewControllerProtocol {

    var interactor: DebitsInteractorInput?
    var router: DebitsRouterProtocol?
    
    private let debitsView = DebitsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didLoad()
    }
    
    override func loadView() {
        super.loadView()
        debitsView.animationDelegate = self
        view = debitsView
    }
    
    func didLoad() {
        interactor?.getDebits()
    }
}


extension DebitsViewController: DebitsViewAnimationDelegate {
    
    func didEndAnimation() {
        toggleTabbar()
    }
    
}
