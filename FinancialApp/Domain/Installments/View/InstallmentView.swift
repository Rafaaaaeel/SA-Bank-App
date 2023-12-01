import UIKit

final class InstallmentView: CommonView {
    
    private lazy var nameLabel: CommonTextLabel = {
        let label = CommonTextLabel()
        label.text = "Test"
        return label
    }()
    
    private lazy var valueLabel: CommonTextLabel = {
        let label = CommonTextLabel()
        label.text = "R$ 14,90"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension InstallmentView: CodableViews {
    
    func setupHiearchy() {
        addSubviews(nameLabel, valueLabel)
    }
    
    func setupContraints() {
        
        let nameLabelConstraints = [
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1)
        ]
        
        let valueLabelConstraints = [
            valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: valueLabel.trailingAnchor , multiplier: 1)
        ]
        
        
        NSLayoutConstraint.activeAll(nameLabelConstraints, valueLabelConstraints)
        
    }
    
}
