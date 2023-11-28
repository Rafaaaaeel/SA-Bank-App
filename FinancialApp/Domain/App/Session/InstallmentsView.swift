import UIKit

final class InstallmentsView: CommonView {
    
    private lazy var cardView = CardView(frame: position)
//    let testView = UIView()
    
    private let position: CGRect
    private let model: Debit
    
    init(card position: CGRect, model: Debit) {
        self.position = position
        self.model = model
        super.init(frame: .zero)
        setup()
        NotificationCenter.default.addObserver(self, selector: #selector(didTouchCard), name: Notification.Name("cardTouched"), object: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    @objc func didTouchCard() {
        UIView.animate(withDuration: 0.3) {
            self.cardView.frame.origin.y = self.position.origin.y
        }
    }
    
}

extension InstallmentsView: CodableViews {
    
    func configView() {
        cardView.render(model)
    }
    
    func setupHiearchy() {
        cardView.translatesAutoresizingMaskIntoConstraints = true
        addSubview(cardView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: 0.4) {
                self.cardView.frame.origin.y = 50
            }
        }
        
    }
    
    func setupContraints() {
        
    }
    
    
}
