//
//  MagazineTableViewCell.swift
//  TravelMagazine
//
//  Created by Claire on 1/3/25.
//

import UIKit
import Kingfisher

class MagazineTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: MagazineTableViewCell.self)
    
    @IBOutlet var magazineImage: UIImageView!
    @IBOutlet var magazineLabel: UILabel!
    @IBOutlet var magazineSubLabel: UILabel!
    @IBOutlet var magazineDateLabel: UILabel!
    
    func configureData(magazine: Magazine, formattedDate: String) {
        let imageUrl = URL(string: magazine.photo_image)
        magazineImage.kf.setImage(with: imageUrl)
        magazineLabel.text = magazine.title
        magazineSubLabel.text = magazine.subtitle
    
//        let tempFormatter = DateFormatter()
//        tempFormatter.dateFormat = "yyMMdd"
//        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yy년 MM월 dd일"
//        if let date = tempFormatter.date(from: magazine.date) {
//            magazineDateLabel.text = formatter.string(for: date)
//        }
        
        magazineDateLabel.text = formattedDate
    }
    
}
