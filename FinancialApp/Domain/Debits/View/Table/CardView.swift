import UIKit

final class CardView: UIView {
    
    private let contentView = UIView()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Images.Debits.Cards.c6
        return imageView
    }()

    private lazy var cardDigitsLabel: CommonTextLabel = {
        let label = CommonTextLabel()
        label.text = "9872"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension CardView: CodableViews {
    
    func setupHiearchy() {
        contentView.addSubviews(iconImageView, cardDigitsLabel)
        addSubview(contentView)
    }
    
    func setupContraints() {
        
        let contentViewConstraints = [
            contentView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 1)
            
        ]
        
        let iconImageViewConstraints = [
            iconImageView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            iconImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1)
        ]
        
        let cardDigitsLabelContraints = [
            cardDigitsLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: -1),
            cardDigitsLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1)
        ]
        
        NSLayoutConstraint.activeAll(contentViewConstraints, iconImageViewConstraints, cardDigitsLabelContraints)
    }
    
}
