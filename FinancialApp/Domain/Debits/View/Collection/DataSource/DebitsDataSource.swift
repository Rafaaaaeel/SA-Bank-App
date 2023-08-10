import UIKit

final class DebitsDataSource: NSObject, UICollectionViewDataSource {
    
    var model: DebitsModel.ViewModel?
    
    var cout: Int {
        return model?.model["title"]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cout
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let model, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DebitCollectionViewCell.identifier, for: indexPath) as? DebitCollectionViewCell else { return UICollectionViewCell() }
        let titles = model.model["title"]
        let colors = model.model["color"]
        cell.render(title: titles![indexPath.item], color: colors![indexPath.item])
        return cell
    }
    
    
}
