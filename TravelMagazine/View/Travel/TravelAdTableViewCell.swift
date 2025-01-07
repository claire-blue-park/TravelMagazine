//
//  TravelTableViewCell.swift
//  TravelMagazine
//
//  Created by Claire on 1/3/25.
//

import UIKit

class TravelAdTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: TravelAdTableViewCell.self)
    
    @IBOutlet var adLabel: UILabel!
    @IBOutlet var adBadgeLabel: UILabel!
    
    func configureData(_ travel: Travel) {
        adLabel.text = travel.title
        
        let colors: [UIColor] = [.ad0, .ad1, .ad2, .ad3, .ad4]
        adLabel.backgroundColor = colors.randomElement()
    }

}
