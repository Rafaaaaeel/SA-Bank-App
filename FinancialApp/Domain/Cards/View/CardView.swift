import UIKit

final class CardView: UIView {
    
    private let contentView = UIView()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var cardDigitsLabel = CommonTextLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func render(_ model: Debit) {
        cardDigitsLabel.textColor = .white
        cardDigitsLabel.text = model.description
        contentView.backgroundColor = UIColor(hex: model.colour)
        iconImageView.image = UIImage(named: model.image)
    }
    
    @objc func didTouched() {
        NotificationCenter.default.post(name: NSNotification.Name("cardTouched"), object: nil)
    }
    
}

extension CardView: CodableViews {
    
    func configView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTouched))
        addGestureRecognizer(tap)
        translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layer.cornerRadius = 10
    }
    
    func setupHiearchy() {
        contentView.addSubviews(iconImageView, cardDigitsLabel)
        addSubview(contentView)
    }
    
    func setupContraints() {
        
        let size: CGFloat = 45
        let multiplier: CGFloat = 1
        
        let contentViewConstraints = [
            contentView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: multiplier),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: multiplier),
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: multiplier),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: multiplier)
            
        ]
        
        let iconImageViewConstraints = [
            iconImageView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: multiplier),
            iconImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            iconImageView.heightAnchor.constraint(equalToConstant: size),
            iconImageView.widthAnchor.constraint(equalToConstant: size)
        ]
        
        let cardDigitsLabelContraints = [
            cardDigitsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            cardDigitsLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2)
        ]
        
        NSLayoutConstraint.activeAll(contentViewConstraints, iconImageViewConstraints, cardDigitsLabelContraints)
    }
    
}
