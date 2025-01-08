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
    private let tempFormatter = DateFormatter()
    private let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        tempFormatter.dateFormat = "yyMMdd"
        formatter.dateFormat = "yy년 MM월 dd일"
        

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazines.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MagazineTableViewCell.identifier) as! MagazineTableViewCell
        
        let magazine = magazines[indexPath.row]
        let formattedDate = formatter.string(for: tempFormatter.date(from: magazine.date) ?? Date()) ?? ""
        
        cell.configureData(magazine: magazine, formattedDate: formattedDate)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }

}
