import UIKit

public class CommonBaseDataSource<T>: NSObject, UICollectionViewDataSource {
    
    enum Status {
        case loading
        case done
    }
    
    private var count = 0
    
    public var model: [T]? {
        didSet {
            load()
        }
    }
    
    var cells: [Status: String]
    
    var status: Status = .loading
    
    init(cells: [Status : String]) {
        self.cells = cells
    }
    
    private func load() {
        guard let model else { return }
        count = model.count
        status = .done
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return status == .loading ? 6 : count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let type = cells[status], let cell = collectionView.dequeueReusableCell(withReuseIdentifier: type, for: indexPath) as? CommonBaseCollectionCell else { return UICollectionViewCell() }
        
        if let model, status == .done {
            cell.render(model: model[indexPath.item])
        }
        
        return cell
    }
    
}
