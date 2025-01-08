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
    
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var rateImageView: UIImageView!
    @IBOutlet var saveCountLabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    
    func configureData(_ travel: Travel, saveCount: String) {
        let imageUrl = URL(string: travel.travel_image ?? "")
        travelImageView.kf.setImage(with: imageUrl)
        titleLabel.text = travel.title
        descriptionLabel.text = travel.description
        saveCountLabel.text = saveCount
        
        let likeButtonImage = (travel.like ?? false) ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        likeButton.setImage(likeButtonImage, for: .normal)
        
    }

}
