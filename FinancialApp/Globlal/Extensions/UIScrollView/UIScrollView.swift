import UIKit

extension UIScrollView {
    func scrollToTop() {
        setContentOffset(CGPoint(x: 0, y: 0), animated: true)
   }
}
