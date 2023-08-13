import UIKit

final class DebitCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "DebitCollectionViewCell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}

extension DebitCollectionViewCell: CodableViews {
    
    func configView() {
        layer.cornerRadius = 20
    }
    
    func setupHiearchy() {
        addSubviews(titleLabel, valueLabel)
    }
    
    func setupContraints() {
        let titleLabelConstraint = [
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 2)
        ]
        
        let valueLabelConstraint = [
            valueLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            valueLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

        ]
        
        NSLayoutConstraint.activeAll(titleLabelConstraint, valueLabelConstraint)
    }

}

extension DebitCollectionViewCell {
    
    func render(title: String, color: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
        backgroundColor = UIColor(hex: color)
    }
    
}

extension DebitCollectionViewCell {
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
        super.touchesBegan(touches, with: event)
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform.identity
        }
        super.touchesEnded(touches, with: event)
    }
    
}

