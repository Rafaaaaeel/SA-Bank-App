import UIKit

final class InstallmentsView: CommonView {
    
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var cardView = CardView(frame: position)
    private lazy var headerView = InstallmentHeaderView()
    private lazy var installmentsTableView = InstallmentsTableView()
    
    private let position: CGRect
    private let model: Debit
    
    var top: CGFloat {
        return UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
    }
    
    init(card position: CGRect, model: Debit) {
        self.position = position
        self.model = model
        super.init(frame: .zero)
        setup()
        NotificationCenter.default.addObserver(self, selector: #selector(didTouchCard), name: Notification.Name("cardTouched"), object: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    @objc func didTouchCard() {
        scrollView.scrollToTop()
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
                self.cardView.frame.origin.y = 50 + self.top
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
        
        UIView.animate(withDuration: 0.2) {
            self.scrollView.contentInset.top = -self.top
            self.installmentsTableView.layer.opacity = 1
        }
        
    }
    
}
