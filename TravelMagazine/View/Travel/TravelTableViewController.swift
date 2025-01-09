//
//  TravelTableViewController.swift
//  TravelMagazine
//
//  Created by Claire on 1/3/25.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    
    private var travels = TravelInfo().travel
    private let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberFormatter.numberStyle = .decimal
    }
    
    // 셀 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travels.count
    }
    
    // 셀 높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return travels[indexPath.row].ad ? 110 : 240
    }
    
    // 셀 내용
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travel = travels[indexPath.row]
        
        // 1. 여행 정보일 경우
        if !travel.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier) as! TravelTableViewCell
            
            cell.configureData(travel, saveCount: getFormattedSaveCount(saveCount: travel.save))
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            return cell
            
            // 2. 광고일 경우
        } else {
            let adCell = tableView.dequeueReusableCell(withIdentifier: TravelAdTableViewCell.identifier) as! TravelAdTableViewCell
            adCell.configureData(travel)
            return adCell
        }
    }
    
    // 셀 액션
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let travel = travels[indexPath.row]
        
        // 1. 여행 정보일 경우
        if !travel.ad {
            let viewController = storyboard?.instantiateViewController(withIdentifier: TravelDetailViewController.identifier) as! TravelDetailViewController
            viewController.travel = travel
            viewController.saveCount = getFormattedSaveCount(saveCount: travel.save)
            navigationController?.pushViewController(viewController, animated: true)
            // 2. 광고일 경우
        } else {
            let viewController = storyboard?.instantiateViewController(withIdentifier: TravelAdDetailViewController.identifier) as! TravelAdDetailViewController
            viewController.adText = travel.title
            let navigation = UINavigationController(rootViewController: viewController)
            navigation.modalPresentationStyle = .fullScreen
            present(navigation, animated: true)
        }
    }
    
    private func getFormattedSaveCount(saveCount: Int?) -> String {
        guard let saveCount else {
            return "0"
        }
        let savedCount = numberFormatter.string(for: saveCount)
        return "저장 " + (savedCount ?? "0")
    }
    
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        travels[sender.tag].like?.toggle()
        tableView.reloadData()
    }
}
