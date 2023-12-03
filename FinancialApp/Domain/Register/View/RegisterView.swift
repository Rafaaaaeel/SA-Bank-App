import UIKit

final class RegisterView: UIView {
    
    // titulo
    // campo nome
    // campo email
    // campo confirmao email
    // regras
    
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
