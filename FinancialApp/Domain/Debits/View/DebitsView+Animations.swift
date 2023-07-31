import UIKit

extension DebitsView {
    
    func animation() {
        
        UIView.animate(withDuration: 1.2) {

            self.animationView.transform = CGAffineTransform(scaleX: 50, y: 50)
            self.layoutIfNeeded()
        } completion: { _ in
            
            UIView.animate(withDuration: 0.7, delay: 0.3) {
                self.animationView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            } completion: { _ in
                self.animationDelegate?.didEndAnimation()
            }
            
        }
    }
    
}
