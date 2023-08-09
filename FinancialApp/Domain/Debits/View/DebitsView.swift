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
        view.transform = CGAffineTransform(scaleX: 600, y: 600)
        return view
    }()
    
    private lazy var collectionView = DebitsCollectionView(width: frame.size.width.toDouble)
    
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
        addSubview(collectionView)
        addSubview(animationView)
    }
    
    func setupContraints() {
        
        let collectionConstraints = [
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(collectionConstraints)
    }

}
