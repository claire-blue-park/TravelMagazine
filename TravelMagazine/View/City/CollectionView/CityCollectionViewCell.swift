//
//  CityCollectionViewCell.swift
//  TravelMagazine
//
//  Created by Claire on 1/8/25.
//

import UIKit
import Kingfisher

class CityCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CityCollectionViewCell.self)

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var cityInfoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityImageView.clipsToBounds = true
    }
    
    func configureData(_ city: City, imageCornerRadius: CGFloat) {
        let url = URL(string: city.city_image)
        cityImageView.kf.setImage(with: url)
        cityImageView.layer.cornerRadius = imageCornerRadius
        cityLabel.text = city.city_title
        cityInfoLabel.text = city.city_explain
    }

}
