import UIKit

final class RegisterView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}

extension RegisterView: CodableViews {
    
    func configView() {
        backgroundColor = .primaryBackground
    }
    
    func setupHiearchy() {
        
    }
    
    func setupContraints() {
        
    }
    
    
}
