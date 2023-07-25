import UIKit

final class CommonTextField: UIView {
    
    var height: CGFloat = 60
    var radius: CGFloat = 20
    
    enum State {
        case selected
        case deselected
    }
    
    weak var actionDelegate: CommonTextFieldActionDelegate?
    
    public var isButtonHidden = false {
        didSet {
            configActionButtton()
        }
    }
    
    public var commonPlaceholder: String? {
        didSet {
            configPlaceholder()
        }
    }
    
    public var iconImage: String? {
        didSet {
            configIconImage()
        }
    }
    
    public var buttonImage: String? {
        didSet {
            configActionButtton()
        }
    }
    
    private var state: State = .deselected {
        didSet {
            updateUI()
        }
    }
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryText
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .secondaryText
        return imageView
    }()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .secondaryText
        button.addTarget(self, action: #selector(didTouchRightButton), for: .touchUpInside)
        return button
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.textColor = .primaryText
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    

}

// MARK: - Private Methods
private extension CommonTextField {
    
    @objc func didTouchRightButton() {
        textField.isSecureTextEntry = textField.isSecureTextEntry == true ? false : true
        actionDelegate?.didTouchButton()
    }
    
    func configPlaceholder() {
        placeholderLabel.text = commonPlaceholder
    }
    
    func configIconImage() {
        guard let iconImage else { return }
        iconImageView.image = UIImage(systemName: iconImage)
    }
    
    func configActionButtton() {
        actionButton.isHidden = isButtonHidden
        guard let buttonImage else { return }
        actionButton.setImage(UIImage(systemName: buttonImage), for: .normal)
    }
    
    func updateUI() {
        iconImageView.isHidden = state == .selected ? true : false
        placeholderLabel.isHidden = state == .selected ? true : false
    }
    
}

// MARK: - CodableViews
extension CommonTextField: CodableViews {
    
    func configView() {
        backgroundColor = .secundaryBackground
        layer.borderColor = UIColor.borderColors.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = radius
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupHiearchy() {
        addSubview(textField)
        addSubview(placeholderLabel)
        addSubview(iconImageView)
        addSubview(actionButton)
    }
    
    func setupContraints() {
        let constraints = [
            heightAnchor.constraint(equalToConstant: height)
        ]
        
        let textFieldConstraints = [
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60)
        ]
        
        let iconImageViewConstraints = [
            iconImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let placeholderConstrainst = [
            placeholderLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: iconImageView.trailingAnchor, multiplier: 2),
            placeholderLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        let actionButtonConstraints = [
            actionButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activeAll(constraints,
                                     textFieldConstraints,
                                     iconImageViewConstraints,
                                     placeholderConstrainst,
                                     actionButtonConstraints)
    }
    
}

extension CommonTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        state = .selected
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        state = textField.text.nilOrEmpty.isEmpty ? .deselected : .selected
    }
    
}


