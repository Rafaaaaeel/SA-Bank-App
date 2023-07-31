import UIKit

extension NSLayoutConstraint {
    
    static func activeAll(_ constrainst: [NSLayoutConstraint]...) {
        constrainst.forEach { NSLayoutConstraint.activate($0) }
    }
    
}
