import UIKit

final class DebitsDelegate: NSObject, UICollectionViewDelegate {
    
    var width: Double = 0
    
    override init() { }
    
}

extension DebitsDelegate: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
//
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = width
        
        return CGSize(width: width, height: height)
    }
    
}
