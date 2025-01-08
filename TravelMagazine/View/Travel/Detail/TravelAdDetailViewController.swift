//
//  TravelADDetailViewController.swift
//  TravelMagazine
//
//  Created by Claire on 1/7/25.
//

import UIKit

class TravelAdDetailViewController: UIViewController {
    
    static let identifier = String(String(describing: TravelAdDetailViewController.self))

    @IBOutlet var adLabel: UILabel!
    var adText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        
        adLabel.text = adText
    }
    
    private func setupNavigation() {
        navigationItem.title = "AD"
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonTapped))
        leftButton.tintColor = .neutral8
        navigationItem.setLeftBarButton(leftButton, animated: true)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }

}
