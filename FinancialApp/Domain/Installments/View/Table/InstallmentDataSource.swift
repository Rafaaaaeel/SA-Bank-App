import UIKit

final class InstallmentDataSource: NSObject, UITableViewDataSource {
    
    var installments: [Installment] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return installments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InstallmentTableViewCell.identifier, for: indexPath) as! InstallmentTableViewCell
        cell.render(installments[indexPath.row])
        cell.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return cell
    }
    
}
