import UIKit

final class LoginView: UIView {
    
    var textfieldHeight: CGFloat = 60
    var textfieldRadius: CGFloat = 20
    
    var leftConstraint = NSLayoutConstraint()
    var rightConstraint = NSLayoutConstraint()
    
    private lazy var titleLabel: CommonTitleLabel = {
        let label = CommonTitleLabel()
        label.text = Text.login
        return label
    }()
    
    private lazy var emailTextField: CommonTextField = {
        let field = CommonTextField()
        field.commonPlaceholder = Text.emailPlaceholder
        field.iconImage = SFImages.envelope
        field.actionDelegate = self
        field.isButtonHidden = true
        field.layer.cornerRadius = textfieldRadius
        return field
    }()
    
    private lazy var passwordTextField: CommonTextField = {
        let field = CommonTextField()
        field.commonPlaceholder = Text.passwordPlaceholder
        field.iconImage = SFImages.lock
        field.buttonImage = SFImages.eye
        field.actionDelegate = self
        field.isButtonHidden = false
        field.layer.cornerRadius = textfieldRadius
        return field
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot password?", for: .normal)
        button.tintColor = .primaryText
        return button
    }()
    
    private lazy var loginButton: CommonButton = {
        let button = CommonButton()
//        button.setTitle("Login", for: [])
        button.addTarget(self, action: #selector(didTouchLogin), for: .touchUpInside)
        button.isPressAnimationActive = false
        return button
    }()
    
    @objc func didTouchLogin() {
        animation()
    }
    
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
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(forgotPasswordButton)
        addSubview(loginButton)
    }
    
    func setupContraints() {
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 0),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2)
        ]
        
        let emailTextfieldConstraints = [
            emailTextField.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 2),
            emailTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: emailTextField.trailingAnchor, multiplier: 2),
            emailTextField.heightAnchor.constraint(equalToConstant: textfieldHeight),
        ]
        
        let passwordTextfieldConstraints = [
            passwordTextField.topAnchor.constraint(equalToSystemSpacingBelow: emailTextField.bottomAnchor, multiplier: 1),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: textfieldHeight),
        ]
        
        let forgotPasswordButtonConstraints = [
            forgotPasswordButton.topAnchor.constraint(equalToSystemSpacingBelow: passwordTextField.bottomAnchor, multiplier: 1),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor)
        ]
        
        leftConstraint = loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor)
        rightConstraint = loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor)
        
        let loginButtonConstraints = [
            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: forgotPasswordButton.bottomAnchor, multiplier: 3),
            leftConstraint,
            rightConstraint
        ]
        
        NSLayoutConstraint.activeAll(titleLabelConstraints,
                                     emailTextfieldConstraints,
                                     passwordTextfieldConstraints,
                                     forgotPasswordButtonConstraints,
                                     loginButtonConstraints)
    }
    
    func renders() {
        dismissKeyboard()
    }
    
}

extension LoginView: CommonTextFieldActionDelegate {
    
    func didTouchButton() {
 
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
