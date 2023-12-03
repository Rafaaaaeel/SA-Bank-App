import UIKit

final class InstallmentsViewController: CommonViewController, InstallmentsViewControllerProtocol {
    
    var interactor: InstallmentsInteractorInput?
    var router: InstallmentsRouterProtocol?
    
    private let installmentsView: InstallmentsView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        NotificationCenter.default.addObserver(self, selector: #selector(didTouchCard), name: Notification.Name("cardTouched"), object: nil)
    }
        
    init(card position: CGRect, model: Debit) {
        self.installmentsView = InstallmentsView(card: position, model: model)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        super.loadView()
        view = installmentsView
        
    }
    
    @objc func didTouchCard() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.dismiss(animated: false)
        }
    }
    
}

class Observable {
    
}
