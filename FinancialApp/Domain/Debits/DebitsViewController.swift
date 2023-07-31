import UIKit

class DebitsViewController: CommonViewController, DebitsViewControllerProtocol {

    var interactor: DebitsInteractorInput?
    var router: DebitsRouterProtocol?
    
    private let debitsView = DebitsView()
    
    override func loadView() {
        super.loadView()
        debitsView.animationDelegate = self 
        view = debitsView
    }
}


extension DebitsViewController: DebitsViewAnimationDelegate {
    
    func didEndAnimation() {
//        toggleTabbar()
    }
    
}
