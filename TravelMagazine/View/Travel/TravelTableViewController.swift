//
//  TravelTableViewController.swift
//  TravelMagazine
//
//  Created by Claire on 1/3/25.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    
    private var travels = TravelInfo().travel

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let travel = travels[indexPath.row]
      
        // 1. 여행 정보일 경우
        if !travel.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier) as! TravelTableViewCell
            cell.configureData(travel)
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            return cell
            
        // 2. 광고일 경우
        } else {
            let adCell = tableView.dequeueReusableCell(withIdentifier: TravelADTableViewCell.identifier) as! TravelADTableViewCell
            adCell.configureData(travel)
            return adCell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return travels[indexPath.row].ad ? 110 : 240
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        travels[sender.tag].like?.toggle()
        tableView.reloadData()
    }
}
