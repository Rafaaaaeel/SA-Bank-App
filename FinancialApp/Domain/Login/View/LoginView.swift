import UIKit

final class LoginView: UIView {
    
    var leftConstraint = NSLayoutConstraint()
    var rightConstraint = NSLayoutConstraint()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    private lazy var registerStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .center
        return stack
    }()
    
    private lazy var forgotPasswordStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()
    
    private var placeholderView = UIView()
    
    private lazy var titleLabel: CommonTitleLabel = {
        let label = CommonTitleLabel()
        label.text = Text.loginTitle
        return label
    }()
    
    private lazy var emailTextField: CommonTextField = {
        let field = CommonTextField()
        field.commonPlaceholder = Text.emailPlaceholder
        field.iconImage = SFImages.envelope
        field.actionDelegate = self
        field.isButtonHidden = true
        return field
    }()
    
    private lazy var passwordTextField: CommonTextField = {
        let field = CommonTextField()
        field.commonPlaceholder = Text.passwordPlaceholder
        field.iconImage = SFImages.lock
        
        field.actionDelegate = self
        field.isButtonHidden = false
        field.textField.isSecureTextEntry = true
        return field
    }()
    
    private lazy var forgotPasswordButton: CommonTextButton = {
        let button = CommonTextButton()
        button.title = Text.forgotPasswordTitle
        return button
    }()
    
    private lazy var loginButton: CommonWhiteButton = {
        let button = CommonWhiteButton()
        button.title = Text.loginButtonTitle
        button.addTarget(self, action: #selector(didTouchLogin), for: .touchUpInside)
        button.isPressAnimationActive = false
        return button
    }()
    
    private lazy var createAccountButton: CommonTextButton = {
        let button = CommonTextButton()
        button.title = Text.signUpTitle
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    @objc func didTouchLogin() {
        animation()
    }
    
    private func dismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        addGestureRecognizer(tapGesture)
    }
    
}

extension LoginView: CodableViews {
    
    func configView() {
        backgroundColor = .primaryBackground
    }
    
    func setupHiearchy() {
        mainStackView.addArrangedSubviews(titleLabel, emailTextField, passwordTextField)
        forgotPasswordStackView.addArrangedSubviews(placeholderView, forgotPasswordButton)
        mainStackView.addArrangedSubviews(forgotPasswordStackView, loginButton)
        registerStackView.addArrangedSubview(createAccountButton)
        mainStackView.addArrangedSubview(registerStackView)
        addSubview(mainStackView)
    }
    
    func setupContraints() {
        
        let mainStackViewConstriants = [
            mainStackView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 0),
            mainStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: mainStackView.trailingAnchor, multiplier: 2)
        ]
        
        NSLayoutConstraint.activate(mainStackViewConstriants)
    }
    
    func renders() {
        dismissKeyboard()
    }
    
}

extension LoginView: CommonTextFieldActionDelegate {
    
    func didTouchButton() {
        //
    }
    
}

extension LoginView {
    
    func animation() {
        UIView.animate(withDuration: 0.4) {
            let width = self.forgotPasswordButton.frame.width + 8
            self.leftConstraint.constant = width
            self.rightConstraint.constant = -width
            UIView.animate(withDuration: 0.2, delay: 0.3) {
                self.loginButton.transform = CGAffineTransform(scaleX: 0.80, y: 0.80)
            }
            self.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.loginButton.transform = CGAffineTransform.identity
                let width = self.forgotPasswordButton.frame.width + 5
                self.leftConstraint.constant = width
                self.rightConstraint.constant = -width
                self.layoutIfNeeded()
            } completion: { _ in
                UIView.animate(withDuration: 2, delay: 0.12) {
                    self.loginButton.transform = CGAffineTransform(scaleX: 400, y: 400)
                }
            }
        }
    }
    
}
