import UIKit

final class DebitsCollectionView: UICollectionView {
    
    var adapter: DebitsDelegate
    var source: DebitsDataSource
    
    init(adapter: DebitsDelegate = DebitsDelegate(), source: DebitsDataSource = DebitsDataSource(), width: Double) {
        self.adapter = adapter
        self.source = source
        self.adapter.width = width
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        configure()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}

extension DebitsCollectionView {
    
    private func configure() {
        dataSource = source
        delegate = adapter
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
    }
    
}

