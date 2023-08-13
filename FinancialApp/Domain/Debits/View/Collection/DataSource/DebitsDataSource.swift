import UIKit

final class DebitsDataSource: NSObject, UICollectionViewDataSource {
    
    var model: DebitsModel.ViewModel?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.cout ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let model, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DebitCollectionViewCell.identifier, for: indexPath) as? DebitCollectionViewCell else { return UICollectionViewCell() }
        let data = model.data[indexPath.item]
        cell.render(title: data.name, color: data.color, value: data.total?.asCurrencyValue ?? Double(0).asCurrencyValue)
        return cell
    }
    
}
