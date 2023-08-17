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
    
    private func render() {
        switch self.status {
        case .done:
            loadSucces()
        case .failed:
            loadError()
        case .loading:
            loadLoading()
        case .empty:
            loadEmpty()
        }
    }
    
    
    public func loadLoading() { }
    
    public func loadSucces() { }
    
    public func loadError() { }
    
    public func loadEmpty() { }
    
}

