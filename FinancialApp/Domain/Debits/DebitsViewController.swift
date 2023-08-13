import UIKit

final class DebitsViewController: CommonViewController, DebitsViewControllerProtocol {

    var interactor: DebitsInteractorInput?
    var router: DebitsRouterProtocol?
    
    private let debitsView = DebitsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didLoadView()
    }
    
    override func loadView() {
        super.loadView()
        debitsView.animationDelegate = self
        view = debitsView
    }
    
    func didLoadView() {
        interactor?.getDebits()
    }

    func didLoadData(_ viewModel: DebitsModel.ViewModel) {
        debitsView.model = viewModel
    }

}

extension DebitsViewController: DebitsViewAnimationDelegate {
    
    func didEndAnimation() {
        toggleTabbar()
        updateUI()
    }
    
}

extension DebitsViewController {
    
    private func updateUI() {
        debitsView.width = (view.frame.size.width / 2.0) - 30.0
    }
    
}
