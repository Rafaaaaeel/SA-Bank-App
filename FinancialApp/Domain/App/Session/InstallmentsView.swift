import UIKit

final class InstallmentsView: CommonView {
    
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var cardView = CardView(frame: position)
    private lazy var installmentsTableView = InstallmentsTableView()
    
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
        cardView.translatesAutoresizingMaskIntoConstraints = true
        cardView.render(model)
        installmentsTableView.add(model.installments)
    }
    
    func setupHiearchy() {
        addSubview(cardView)
    }
    
    func setupContraints() {

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: 0.4) {
                self.cardView.frame.origin.y = 50
            }
        }
        
//        let installmentsTableViewConstraints = [
//            installmentsTableView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
//            installmentsTableView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
//            trailingAnchor.constraint(equalToSystemSpacingAfter: installmentsTableView.trailingAnchor, multiplier: 2),
//            installmentsTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
//        ]
//        
//        NSLayoutConstraint.activate(installmentsTableViewConstraints)
    }
    
    
}
