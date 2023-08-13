import UIKit

protocol DebitsCollectionViewDelegate: AnyObject {
    
    func didTouchItem(at index: Int)
    func didScroll(_ scrollView: UIScrollView)
    
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
    
    func append(_ model: DebitsModel.ViewModel?) {
        source.model = model
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
    }
    
}

extension DebitsCollectionView: DebitsAdapterDelegate {
    
    func didTouchItem(at index: Int) {
        collectionDelegate?.didTouchItem(at: index)
    }
    
    func didScroll(_ scrollView: UIScrollView) {
        collectionDelegate?.didScroll(scrollView)
    }
    
}
