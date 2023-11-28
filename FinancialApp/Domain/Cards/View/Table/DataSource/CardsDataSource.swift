import UIKit

final class CardsDataSource: NSObject, UITableViewDataSource {
    
    enum Status {
        case loading
        case success
    }
    
    var status: Status = .loading
    
    var sections: [Debit] = [] {
        didSet {
            status = .success
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch status {
        case .loading:
            return 5
        case .success:
            return sections.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch status {
        case .loading:
            let cell = tableView.dequeueReusableCell(withIdentifier: CardsTableViewSkeletonCell.identifier, for: indexPath) as! CardsTableViewSkeletonCell
            return cell
        case .success:
            let cell = tableView.dequeueReusableCell(withIdentifier: CardsTableViewCell.identifier, for: indexPath) as! CardsTableViewCell
            cell.render(sections[indexPath.row])
            return cell
        }
        
    }
    
}

