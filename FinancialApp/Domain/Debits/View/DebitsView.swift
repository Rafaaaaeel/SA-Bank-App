import UIKit

final class DebitsView: UIView {
    
    private var animationHeightAnchor: NSLayoutConstraint = NSLayoutConstraint()
    
    private lazy var animationView: UIView = {
        let view = UIView(frame: CGRect(x: 168, y: 400, width: 60, height: 60))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.transform = CGAffineTransform(scaleX: 1000, y: 1000)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        animation()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}

extension DebitsView: CodableViews {
    
    func configView() {
        backgroundColor = .primaryBackground
    }
    
    func setupHiearchy() {
        addSubview(animationView)
    }
    
    func setupContraints() {
        
    }

}


extension DebitsView {
    
    func animation() {
        
        UIView.animate(withDuration: 1.2) {

            self.animationView.transform = CGAffineTransform(scaleX: 50, y: 50)
            self.layoutIfNeeded()
        } completion: { _ in
            
            UIView.animate(withDuration: 0.7, delay: 0.3) {
                self.animationView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            }
            
        }
    }
    
}
