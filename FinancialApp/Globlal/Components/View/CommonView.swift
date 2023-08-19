import UIKit

public class CommonView: UIView {
    
    enum Status {
        case failed
        case empty
        case loading
        case done
    }
    
    var status: Status = .loading {
        didSet {
            render()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        DispatchQueue.main.async {
            switch self.status {
            case .done:
                self.loadSuccess()
            case .failed:
                self.loadError()
            case .loading:
                self.loadLoading()
            case .empty:
                self.loadEmpty()
            }
        }
    }
    
    
    public func loadLoading() { }
    
    public func loadSuccess() { }
    
    public func loadError() { }
    
    public func loadEmpty() { }
    
}

