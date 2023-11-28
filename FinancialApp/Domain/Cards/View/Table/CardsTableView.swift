import UIKit

protocol CardsTableViewDelegate: AnyObject {
    
    func didTouchCell(at position: CGRect, at index: Int)
    
}

final class CardsTableView: UITableView, UITableViewDelegate {
    
    var source: CardsDataSource
    var adapter: CardsAdapter
    
    weak var actionDelegate: CardsTableViewDelegate?
    
    init(source: CardsDataSource = CardsDataSource(), adapter: CardsAdapter = CardsAdapter()) {
        self.source = source
        self.adapter = adapter
        super.init(frame: .zero, style: .plain)
        configure()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func append(_ sections: [Debit]) {
        source.sections = sections
        reloadData()
    }
    
    private func configure() {
        adapter.delegate = self
        delegate = adapter
        register(CardsTableViewCell.self, forCellReuseIdentifier: CardsTableViewCell.identifier)
        register(CardsTableViewSkeletonCell.self, forCellReuseIdentifier: CardsTableViewSkeletonCell.identifier)
        dataSource = source
        backgroundColor = .clear
        showsVerticalScrollIndicator = false
        separatorStyle = .none
        translatesAutoresizingMaskIntoConstraints = false
        rowHeight = 220
    }
    
}

extension CardsTableView: CardsAdapterDelegate {
    
    func didTouchCell(at position: CGRect, at index: Int) {
        actionDelegate?.didTouchCell(at: position, at: index)
    }
    
}
