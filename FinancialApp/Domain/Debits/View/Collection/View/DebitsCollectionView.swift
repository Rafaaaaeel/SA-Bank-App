import UIKit

final class DebitsCollectionView: UICollectionView {
    
    var adapter: DebitsDelegate
    var source: DebitsDataSource
    
    init(adapter: DebitsDelegate = DebitsDelegate(), source: DebitsDataSource = DebitsDataSource(), width: Double) {
        self.adapter = adapter
        self.source = source
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
        showsVerticalScrollIndicator = false
        dataSource = source
        delegate = adapter
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        register(DebitCollectionViewCell.self, forCellWithReuseIdentifier:  DebitCollectionViewCell.identifier)
    }
    
}

