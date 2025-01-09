//
//  CityTableViewCell.swift
//  TravelMagazine
//
//  Created by Claire on 1/6/25.
//

import UIKit
import Kingfisher

class CityTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: CityTableViewCell.self)

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var cityInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // TODO: -코너값
        
    }
    
    func configureData(city: City) {
        let imageUrl = URL(string: city.city_image)
        cityImageView.kf.setImage(with: imageUrl)
        cityLabel.text = city.city_title
        cityInfoLabel.text = city.city_explain
    }

}
