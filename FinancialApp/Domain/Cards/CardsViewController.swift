import UIKit

final class CardsViewController: CommonViewController, CardsViewControllerProtocol {

    var interactor: CardsInteractorInput?
    var router: CardsRouterProtocol?
    
    private let debitsView = CardsView()
    
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

    func didLoadData(_ viewModel: CardsModel.ViewModel) {
        debitsView.model = viewModel
    }

    func didDeleted(_ viewModel: CardsModel.ViewModel) {
        debitsView.model = viewModel
    }
    
    func didLoadFailed() {
        debitsView.status = .failed
    }
}

extension CardsViewController: CardsViewDelegate {
    
    func didSelectCard(of id: String, at position: CGRect, model: Debit) {
    
        router?.didSelectCard(of: id, at: position, model: model)
        UIView.animate(withDuration: 0.2) {
            self.view.layer.opacity = 0
        }
        
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
    
    func didTouchRetry() {
        interactor?.getDebits()
    }
    
}

extension CardsViewController {
    
    private func updateUI() {
        debitsView.width = (view.frame.size.width / 2.0) - 30.0
    }
    
}
