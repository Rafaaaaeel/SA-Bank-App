import UIKit

protocol DebitsCollectionViewDelegate: AnyObject {
    
    func didTouch(_ debit: Debit)
    func didScroll(_ scrollView: UIScrollView)
    func didTouchDelete(_ debit: Debit)
    
}

final class DebitsCollectionView: UICollectionView {
    
    var adapter: DebitsAdapter
    var source: DebitsDataSource
    weak var collectionDelegate: DebitsCollectionViewDelegate?
    
    init(adapter: DebitsAdapter = DebitsAdapter(), source: DebitsDataSource = DebitsDataSource(), delegate: DebitsCollectionViewDelegate, width: Double) {
        self.adapter = adapter
        self.source = source
        self.collectionDelegate = delegate
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        configure()
    }
    
    func debit(at index: Int) -> Debit? {
        return source.debit(at: index)
    }
    
    func append(_ model: DebitsModel.ViewModel?) {
        source.viewModel = model
    }
    
    func set(width: CGFloat) {
        adapter.width = width.toDouble
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func reload() {
        DispatchQueue.main.async { [weak self] in
            self?.reloadData()
        }
    }
    
}

extension DebitsCollectionView {
    
    private func configure() {
        adapter.delegate = self
        showsVerticalScrollIndicator = false
        dataSource = source
        delegate = adapter
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        register(DebitCollectionViewCell.self, forCellWithReuseIdentifier:  DebitCollectionViewCell.identifier)
        register(DebitCollectionSkelletonViewCell.self, forCellWithReuseIdentifier:  DebitCollectionSkelletonViewCell.identifier)
    }
    
}

extension DebitsCollectionView: DebitsAdapterDelegate {
    
    func didTouchDelete(at index: Int) {
        guard let debit = debit(at: index) else { return }
        collectionDelegate?.didTouchDelete(debit)
    }
    
    func didTouchItem(at index: Int) {
        guard let debit = debit(at: index) else { return }
        collectionDelegate?.didTouch(debit)
    }
    
    func didScroll(_ scrollView: UIScrollView) {
        collectionDelegate?.didScroll(scrollView)
    }
    
}
