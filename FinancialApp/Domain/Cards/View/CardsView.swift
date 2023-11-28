import UIKit
 
typealias Model = CardsModel.ViewModel

protocol CardsViewDelegate: AnyObject {
    
    func didSelectCard(of id: String, at position: CGRect, model: Debit)
    func didTouchCreate()
    func didTouchDelete(_ id: String)
    func didTouchRetry()
    func didEndAnimation()
    
}

final class CardsView: CommonView {
    
    var model: Model? {
        didSet {
            status = .done
        }
    }
    
    lazy var width: CGFloat = 0 {
        didSet {
            status = .done
        }
    }
    
    weak var delegate: CardsViewDelegate?

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
    
    private let tableView = CardsTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        animation()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func loadSuccess() {
        tableView.append(model?.data ?? [])
    }
    
}

extension CardsView: CodableViews {
    
    func configView() {
        tableView.actionDelegate = self
        backgroundColor = .primaryBackground
    }
    
    func setupHiearchy() {
        addSubviews(tableView, animationView)
    }
    
    func setupContraints() {
    
        let tableviewConstraints = [
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(tableviewConstraints)
    }

}

extension CardsView: CardsTableViewDelegate {
    
    func didTouchCell(at position: CGRect, at index: Int) {
        delegate?.didSelectCard(of: "dawda", at: position, model: model!.data[index])
    }
    
}
