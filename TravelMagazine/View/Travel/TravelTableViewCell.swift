//
//  TravelTableViewCell.swift
//  TravelMagazine
//
//  Created by Claire on 1/3/25.
//

import UIKit
import Kingfisher

class TravelTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: TravelTableViewCell.self)
    
    @IBOutlet var shopImageView: UIImageView!
    @IBOutlet var shopNameLabel: UILabel!
    @IBOutlet var shopInfoLabel: UILabel!
    
    @IBOutlet var rateImageView: UIImageView!
    @IBOutlet var saveCountLabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    
    func configureData(_ travel: Travel) {
        let imageUrl = URL(string: travel.travel_image ?? "")
        shopImageView.kf.setImage(with: imageUrl)
        shopNameLabel.text = travel.title
        shopInfoLabel.text = travel.description
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let savedCount = numberFormatter.string(for: travel.save)
        saveCountLabel.text = "저장 " + (savedCount ?? "0")
        
        let likeButtonImage = (travel.like ?? false) ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        likeButton.setImage(likeButtonImage, for: .normal)
        
    }

}
