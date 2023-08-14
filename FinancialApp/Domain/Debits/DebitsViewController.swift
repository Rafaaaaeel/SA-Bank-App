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
        debitsView.delegate = self
        view = debitsView
    }
    
    func didLoadView() {
        interactor?.getDebits()
    }

    func didLoadData(_ viewModel: DebitsModel.ViewModel) {
        debitsView.model = viewModel
    }

    func didDeleted() {
//        debitsView.model = viewModel
    }
}

extension DebitsViewController: DebitsViewDelegate {
    
    func didTouchDebit(_ id: String) {
        router?.didTouchDebit(id)
    }
    
    func didTouchCreate() {
        router?.didTouchCreate()
    }
    
    func didTouchDelete(_ id: String) {
        interactor?.removeDebit(id)
    }
    
    func didEndAnimation() {
//        toggleTabbar()
        updateUI()
    }
    
}

extension DebitsViewController {
    
    private func updateUI() {
        debitsView.width = (view.frame.size.width / 2.0) - 30.0
    }
    
}
