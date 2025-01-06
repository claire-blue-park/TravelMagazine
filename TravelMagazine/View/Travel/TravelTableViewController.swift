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
            let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell") as! TravelTableViewCell
            let imageUrl = URL(string: travel.travel_image ?? "")
            cell.shopImageView.kf.setImage(with: imageUrl)
            cell.shopNameLabel.text = travel.title
            cell.shopInfoLabel.text = travel.description
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let savedCount = numberFormatter.string(for: travel.save)
            cell.saveCountLabel.text = "저장 " + (savedCount ?? "0")
            
            let likeButtonImage = (travel.like ?? false) ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
            cell.likeButton.tag = indexPath.row
            cell.likeButton.setImage(likeButtonImage, for: .normal)
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            
            return cell
            
        // 2. 광고일 경우
        } else {
            let adCell = tableView.dequeueReusableCell(withIdentifier: "TravelADTableViewCell") as! TravelADTableViewCell
            adCell.adLabel.text = travel.title
            
            let colors: [UIColor] = [.ad0, .ad1, .ad2, .ad3, .ad4]
            adCell.adLabel.backgroundColor = colors.randomElement()
            
            return adCell
        }
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        travels[sender.tag].like?.toggle()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return travels[indexPath.row].ad ? 110 : 240
    }
}
