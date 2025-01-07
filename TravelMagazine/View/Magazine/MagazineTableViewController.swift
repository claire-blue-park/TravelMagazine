//
//  MagazineTableViewController.swift
//  TravelMagazine
//
//  Created by Claire on 1/3/25.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {
    
    private let magazines = MagazineInfo().magazines

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazines.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MagazineTableViewCell.identifier) as! MagazineTableViewCell
        
        let magazine = magazines[indexPath.row]
        cell.configureData(magazine: magazine)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }

}
