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
            self.installmentsTableView.layer.opacity = 0
            self.cardView.frame.origin.y = self.position.origin.y
        }
    }
    
}

extension InstallmentsView: CodableViews {
    
    func configView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        cardView.translatesAutoresizingMaskIntoConstraints = true
        cardView.render(model)
        installmentsTableView.add(model.installments)
    }
    
    func setupHiearchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(cardView)
    }
    
    func setupContraints() {

        let heightAnchor = contentView.heightAnchor.constraint (equalTo: scrollView.heightAnchor)
        heightAnchor.isActive = true
        heightAnchor.priority = UILayoutPriority(50)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: 0.4) {
                self.cardView.frame.origin.y = 50
            } completion: { _ in
                self.showTableView()
            }
        }
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        let contentViewConstraints = [
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ]
        
        NSLayoutConstraint.activeAll(scrollViewConstraints, contentViewConstraints)
        
    }
    
    private func showTableView() {
        contentView.addSubview(installmentsTableView)
        let installmentsTableViewConstraints = [
            installmentsTableView.topAnchor.constraint(equalToSystemSpacingBelow: cardView.bottomAnchor, multiplier: 2),
            installmentsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            installmentsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            installmentsTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(installmentsTableViewConstraints)
        
        if let top = UIApplication.shared.windows.first?.safeAreaInsets.top {
            scrollView.contentInset.top = -top
        }
        
        UIView.animate(withDuration: 0.2) {
            self.installmentsTableView.layer.opacity = 1
        }
        
    }
    
}
