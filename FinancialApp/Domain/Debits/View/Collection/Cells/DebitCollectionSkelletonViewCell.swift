import UIKit

final class DebitCollectionSkelletonViewCell: CommonBaseCollectionCell, Reusable {
    
    var gradientColorOne : CGColor = UIColor(white: 0.85, alpha: 1.0).cgColor
    var gradientColorTwo : CGColor = UIColor(white: 0.95, alpha: 1.0).cgColor
    let animation = CABasicAnimation(keyPath: "locations")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configCell()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func configCell() {
        startAnimating()
    }
    
    func startAnimating() {
        let gradientLayer = CAGradientLayer()
    
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = 20
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [gradientColorOne, gradientColorTwo,   gradientColorOne]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.duration = 1.2
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: animation.keyPath)
    
      self.layer.addSublayer(gradientLayer)
    }
}

