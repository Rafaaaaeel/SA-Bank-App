import UIKit

protocol DebitsAdapterDelegate: AnyObject {
    
    func didTouchItem(at index: Int)
    func didScroll(y: Double)
    
}

final class DebitsAdapter: NSObject, UICollectionViewDelegate {
    
    weak var delegate: DebitsAdapterDelegate?
    
    var width: Double = 0
    var spacing: CGFloat = 30
    
    override init() { }
    
}

extension DebitsAdapter: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTouchItem(at: indexPath.item)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.didScroll(y: scrollView.contentOffset.y)
    }
    
}
