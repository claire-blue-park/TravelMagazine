//
//  ChecklistTableViewCell.swift
//  TravelMagazine
//
//  Created by Claire on 1/3/25.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: ChecklistTableViewCell.self)
    
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var listLabel: UILabel!
    
    func configureData(checkList: CheckList) {
        listLabel.text = checkList.list
        
        let checkImage = checkList.check ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "square")
        checkButton.setImage(checkImage, for: .normal)

        let likeImage = checkList.like ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        likeButton.setImage(likeImage, for: .normal)
    }
}
