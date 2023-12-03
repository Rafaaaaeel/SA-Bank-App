import UIKit

final class InstallmentView: CommonView {
    
    var model: Installment? {
        didSet {
            render()
        }
    }
    
    private let contentView = UIView()
    
    private let contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .top
        return stack
    }()
    
    private let leadingStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    
    private let traillingStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .trailing
        return stack
    }()
    
    private lazy var nameLabel = CommonHeadingLabel()
    private lazy var descriptionLabel = CommonTextLabel()
    private lazy var valueLabel = CommonHeadingLabel()
    private lazy var parcelLabel = CommonTextLabel()
    private lazy var totalLabel = CommonTextLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func render() {
        guard let model else { return }
        totalLabel.isHidden = model.total == model.value
        descriptionLabel.isHidden = model.name.capitalized == model.description.capitalized
        parcelLabel.isHidden = true
        valueLabel.text = model.value.asCurrencyValue
        nameLabel.text = model.name.capitalized
        descriptionLabel.text = model.description.capitalized
        totalLabel.text = model.total.asCurrencyValue

        if model.name == "Nintendo" {
            parcelLabel.isHidden = false
            parcelLabel.text = DateManager.parcels(initial: model.initial, final: model.final)
        }
    }
    
}

extension InstallmentView: CodableViews {
    
    func configView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupHiearchy() {
        addSubview(contentView)
        contentView.addSubview(contentStackView)
        leadingStackView.addArrangedSubviews(nameLabel, descriptionLabel)
        traillingStackView.addArrangedSubviews(valueLabel, totalLabel, parcelLabel)
        contentStackView.addArrangedSubviews(leadingStackView, traillingStackView)
    }
    
    func setupContraints() {
        
        let contentViewConstraints = [
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        let contentStackViewConstraints = [
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1)
        ]
        
        NSLayoutConstraint.activeAll(contentViewConstraints, contentStackViewConstraints)
        
    }
    
}
