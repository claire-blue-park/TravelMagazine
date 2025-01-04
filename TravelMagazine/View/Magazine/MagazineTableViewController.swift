//
//  MagazineTableViewController.swift
//  TravelMagazine
//
//  Created by Claire on 1/3/25.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {
    
    private let magazines = MagazineInfo().magazines

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazines.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineTableViewCell") as! MagazineTableViewCell
        
        let magazine = magazines[indexPath.row]
        let imageUrl = URL(string: magazine.photo_image)
        cell.magazineImage.kf.setImage(with: imageUrl)
        cell.magazineLabel.text = magazine.title
        cell.magazineSubLabel.text = magazine.subtitle
        
        // TODO: - 데이터로 받아오는 날짜 포맷 수정 필요
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일"
        let date = formatter.date(from: magazine.date)
        cell.magazineDateLabel.text = formatter.string(from: date ?? Date())
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }

}
