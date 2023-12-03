import UIKit

final class InstallmentHeaderView: UIView {
    
    private let titleLabel = CommonTitleLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension InstallmentHeaderView: CodableViews {
    
    func configView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.opacity = 0
        titleLabel.text = DateManager.currentMonth()
    }
    
    func setupHiearchy() {
        addSubview(titleLabel)
    }
    
    func setupContraints() {
        let titleLabelConstraints = [
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1)
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    
}
