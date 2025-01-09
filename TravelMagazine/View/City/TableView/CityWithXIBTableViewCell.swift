//
//  CityWithXIBTableViewCell.swift
//  TravelMagazine
//
//  Created by Claire on 1/6/25.
//

import UIKit
import Kingfisher

class CityWithXIBTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: CityWithXIBTableViewCell.self)
    
    @IBOutlet var labelBackgroundView: UIView!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityTitleLabel: UILabel!
    @IBOutlet var cityDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        makeCornerRadius(view: cityImageView, isImageView: true)
        makeCornerRadius(view: labelBackgroundView, isImageView: false)
    }

    func configureData(city: City, searchedWord: String) {
        let imageUrl = URL(string: city.city_image)
        cityImageView.kf.setImage(with: imageUrl)
        
        if !searchedWord.isEmpty {
            makeAttributeString(text: city.city_title, highlightText: searchedWord, label: cityTitleLabel)
            makeAttributeString(text: city.city_explain, highlightText: searchedWord, label: cityDetailLabel)
        } else {
            cityTitleLabel.text = city.city_title
            cityDetailLabel.text = city.city_explain
        }
    }
    
    // MARK: - 이미지 코너
    private func makeCornerRadius(view: UIView, isImageView: Bool) {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        let mask = isImageView ? CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMaxYCorner)
                               : CACornerMask(arrayLiteral: .layerMaxXMaxYCorner)
        view.layer.maskedCorners = mask
    }
    
    // MARK: - 검색어 폰트 색상
    private func makeAttributeString(text: String, highlightText: String, label: UILabel) {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.foregroundColor, value: UIColor.highlight, range: (text as NSString).range(of: highlightText))
        label.attributedText = attributedString
    }
}
