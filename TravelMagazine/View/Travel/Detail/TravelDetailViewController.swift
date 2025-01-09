//
//  TravelDetailViewController.swift
//  TravelMagazine
//
//  Created by Claire on 1/7/25.
//

import UIKit
import Kingfisher

class TravelDetailViewController: UIViewController {
    
    static let identifier = String(describing: TravelDetailViewController.self)

    var travel: Travel?
    var saveCount = "0"
    
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var saveCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        let url = URL(string: travel?.travel_image ?? "")
        travelImageView.kf.setImage(with: url)
        titleLabel.text = travel?.title
        descriptionLabel.text = travel?.description
        saveCountLabel.text = saveCount
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func showTravelListButton(_ sender: UIButton) {
        backButtonTapped()
    }
}
