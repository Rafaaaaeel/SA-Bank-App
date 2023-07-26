import UIKit

extension LoginView {
    
    func animation() {
        loginButton.hideTitle()
        UIView.animate(withDuration: 0.4) {
            let width = self.forgotPasswordButton.frame.width + 48
            self.leftConstraint.constant = width
            self.rightConstraint.constant = -width
            UIView.animate(withDuration: 0.2, delay: 0.3) {
                self.loginButton.transform = CGAffineTransform(scaleX: 0.80, y: 0.80)
            }
            self.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.loginButton.transform = CGAffineTransform.identity
                let width = self.forgotPasswordButton.frame.width + 48
                self.leftConstraint.constant = width
                self.rightConstraint.constant = -width
                self.layoutIfNeeded()
            } completion: { _ in
                UIView.animate(withDuration: 2, delay: 0.12) {
                    self.loginButton.transform = CGAffineTransform(scaleX: 400, y: 400)
                } completion: { _ in
                    self.delegate?.didTouchLogin()
                }
            }
        }
    }
    
}

