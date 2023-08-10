import UIKit
 
typealias Model = DebitsModel.ViewModel

protocol DebitsViewAnimationDelegate: AnyObject {
    func didEndAnimation()
}

final class DebitsView: UIView {
    
    var model: Model? {
        didSet {
            updateUI()
        }
    }
    
    lazy var width: CGFloat = 0 {
        didSet {
            updateUI()
        }
    }
    
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
    
    private lazy var collectionView = DebitsCollectionView(width: width)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        animation()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func updateUI() {
        collectionView.append(model)
        collectionView.set(width: width)
        collectionView.reload()
    }
    
}

extension DebitsView: CodableViews {
    
    func configView() {
        backgroundColor = .primaryBackground
    }
    
    func setupHiearchy() {
        addSubviews(collectionView, animationView)
    }
    
    func setupContraints() {
        let collectionConstraints = [
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(collectionConstraints)
    }

}
