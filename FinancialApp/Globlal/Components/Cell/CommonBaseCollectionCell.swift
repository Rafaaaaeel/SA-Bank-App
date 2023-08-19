import UIKit

public protocol Reusable: AnyObject {
    
    static var identifier: String { get }
    
}

public extension Reusable {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

public class CommonBaseCollectionCell: UICollectionViewCell {
    
    public func render<T>(model: T) { }
    
}
