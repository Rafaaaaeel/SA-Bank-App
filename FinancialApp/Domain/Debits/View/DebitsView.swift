import UIKit
 
typealias Model = DebitsModel.ViewModel

protocol DebitsViewDelegate: AnyObject {
    
    func didTouchDebit(_ id: String)
    func didTouchCreate()
    func didTouchDelete(_ id: String)
    func didTouchRetry()
    func didEndAnimation()
    
}

final class DebitsView: CommonView {
    
    var model: Model? {
        didSet {
            self.status = .done
        }
    }
    
    lazy var width: CGFloat = 0 {
        didSet {
            self.status = .done
        }
    }
    
    weak var delegate: DebitsViewDelegate?

    lazy var animationView: UIView = {
        let view = UIView(frame: CGRect(x: 168, y: 400, width: 60, height: 60))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.transform = CGAffineTransform(scaleX: 600, y: 600)
        return view
    }()
    
    private var animationHeightAnchor: NSLayoutConstraint = NSLayoutConstraint()
    private var headerTopAnchor: NSLayoutConstraint = NSLayoutConstraint()
    
    private let headerView = DebitsHeaderView()
    private let tableView = DebitsTableView()
    
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
        headerView.delegate = self
    }
    
    func setupHiearchy() {
        addSubviews(headerView, tableView, animationView)
    }
    
    func setupContraints() {
        
        headerTopAnchor = headerView.topAnchor.constraint(equalTo: topAnchor, constant: 0)
        
        let headerViewConstraints = [
            headerTopAnchor,
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        
        let tableviewConstraints = [
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: headerView.bottomAnchor, multiplier: 0),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        
        
        NSLayoutConstraint.activeAll(headerViewConstraints, tableviewConstraints)
    }

}

extension DebitsView: DebitsCollectionViewDelegate {
    
    func didTouchDelete(_ debit: Debit) {
        delegate?.didTouchDelete(debit._id)
    }
    
    func didTouch(_ debit: Debit) {
        delegate?.didTouchDebit(debit._id)
    }
    
    func didScroll(_ scrollView: UIScrollView) {
        guard let model, model.count > 6 else { return }
        let y = scrollView.contentOffset.y
        let mod = y.truncatingRemainder(dividingBy: scrollView.bounds.size.height )
        let difference = abs((2 * mod / (scrollView.bounds.size.height - 310)) - 1)
        let factor = y > 140 ? 0 : difference
        DispatchQueue.main.async {
            self.headerTopAnchor.constant = -y > -140 ? -y : -140
            if y > 75 {
                self.headerView.animation()
            } else {
                self.headerView.reset()
            }
            self.headerView.titleLabel.alpha = factor
            self.layoutSubviews()
        }
        
    }
    
}

extension DebitsView: DebitsHeaderViewDelegate {

    
    func didTouchCreate() {
        delegate?.didTouchCreate()
    }
    
    func didStartEdditing() {
        
    }
    
    func didEndEdditting() {
        
    }
    
    func didChangedText() {
        
    }
    
}
