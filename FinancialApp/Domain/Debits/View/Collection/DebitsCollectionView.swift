import UIKit

final class DebitsCollectionView: UICollectionView {
    
}

extension DebitsCollectionView: UICollectionViewDelegate {
    
}

extension DebitsCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
