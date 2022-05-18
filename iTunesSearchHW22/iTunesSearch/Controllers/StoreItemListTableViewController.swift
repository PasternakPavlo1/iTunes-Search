import UIKit

class StoreItemListTableViewController: UITableViewController {
    
    //MARK: - Table View Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


