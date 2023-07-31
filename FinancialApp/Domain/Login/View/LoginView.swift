import UIKit

protocol LoginViewDelegate: AnyObject {
    func didTouchLogin()
    func didTouchRegister()
    func didTouchForgetPassword()
}

final class LoginView: UIView {
    
    weak var delegate: LoginViewDelegate?
    
    var leftConstraint = NSLayoutConstraint()
    var rightConstraint = NSLayoutConstraint()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
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
    
    lazy var forgotPasswordButton: CommonTextButton = {
        let button = CommonTextButton()
        button.title = Text.forgotPasswordTitle
        return button
    }()
    
    lazy var loginButton: CommonWhiteButton = {
        let button = CommonWhiteButton()
        button.title = Text.loginButtonTitle
        button.height = 200
        button.addTarget(self, action: #selector(didTouchLogin), for: .touchUpInside)
        button.isPressAnimationActive = false
        return button
    }()
    
    private lazy var createAccountButton: CommonTextButton = {
        let button = CommonTextButton()
        button.shouldShowPlaceholder = true
        button.title = Text.signUpTitle
        button.addTarget(self, action: #selector(didTouchCreateAccount), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        return nil
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
        addSubview(titleLabel)
        mainStackView.addArrangedSubviews(emailTextField, passwordTextField)
        forgotPasswordStackView.addArrangedSubviews(placeholderView, forgotPasswordButton)
        mainStackView.addArrangedSubviews(forgotPasswordStackView)
        addSubview(createAccountButton)
        addSubview(mainStackView)
        addSubview(loginButton)
    }
    
    func setupContraints() {
        
        let titleLabelConstriants = [
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 3),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
        ]
        
        let mainStackViewConstriants = [
            mainStackView.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 5),
            mainStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: mainStackView.trailingAnchor, multiplier: 2)
        ]
        
        leftConstraint = loginButton.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor)
        rightConstraint = loginButton.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor)
        
        let loginButtonConstraints = [
            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: mainStackView.bottomAnchor, multiplier: 2),
            leftConstraint,
            rightConstraint
        ]
        
        let createAccountButtonConstraint = [
            createAccountButton.topAnchor.constraint(equalToSystemSpacingBelow: loginButton.bottomAnchor, multiplier: 1),
            createAccountButton.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            createAccountButton.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor)
        ]
        
        NSLayoutConstraint.activeAll(titleLabelConstriants, mainStackViewConstriants, loginButtonConstraints, createAccountButtonConstraint)
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
    
    @objc func didTouchLogin() {
        animation()
    }
    
    @objc func didTouchCreateAccount() {
        delegate?.didTouchRegister()
    }
    
}



