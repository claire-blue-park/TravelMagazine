//
//  CityViewController.swift
//  TravelMagazine
//
//  Created by Claire on 1/8/25.
//

import UIKit

class CityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private let originalCityInfos = CityInfo().city
    private var sortedCities: [City] = []
    
    @IBOutlet var cityCollectionView: UICollectionView!
    @IBOutlet var citySegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityCollectionView.delegate = self
        cityCollectionView.dataSource = self
        
        onSegmentValueChanged(citySegment)
        
        let xib = UINib(nibName: CityCollectionViewCell.identifier, bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: CityCollectionViewCell.identifier)
        
        cityCollectionView.collectionViewLayout = getFlowLayout()

    }
    
    private func getFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 12 // 행의 최소 간격
        layout.minimumInteritemSpacing = 12 // cell 사이 간격
        layout.sectionInset = UIEdgeInsets(top: 12, left: 0, bottom: 20, right: 0) // 컬렉션뷰 - 셀 간격
        
        let width = (cityCollectionView.frame.width / 2 - 12)
        print(width)
        layout.itemSize = CGSize(width: width, height: width * 1.5)
//        layout.itemSize = CGSize(width: 150, height: 240)
        
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sortedCities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath) as! CityCollectionViewCell
        let imageCornerRadius = (cityCollectionView.frame.width / 2 - 12) / 2.2
        cell.configureData(sortedCities[indexPath.row], imageCornerRadius: imageCornerRadius)
        
        return cell
    }
    
    @IBAction func onSegmentValueChanged(_ sender: UISegmentedControl) {
        sortedCities = switch sender.selectedSegmentIndex {
        case 1: originalCityInfos.filter({ city in
            city.domestic_travel == true
        })
        case 2: originalCityInfos.filter({ city in
            city.domestic_travel == false
        })
        default: originalCityInfos
        }
        cityCollectionView.reloadData()
    }
    
}
