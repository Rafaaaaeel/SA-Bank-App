import UIKit

protocol DebitsViewAnimationDelegate: AnyObject {
    func didEndAnimation()
}

final class DebitsView: UIView {
    
    weak var animationDelegate: DebitsViewAnimationDelegate?
    
    private var animationHeightAnchor: NSLayoutConstraint = NSLayoutConstraint()
    
    lazy var animationView: UIView = {
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


