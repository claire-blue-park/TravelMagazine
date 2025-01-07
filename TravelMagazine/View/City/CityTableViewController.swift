//
//  CityTableViewController.swift
//  TravelMagazine
//
//  Created by Claire on 1/6/25.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    private let originalCityInfos = CityInfo().city // 원본 데이터 배열
    private var sortedCities: [City] = [] // 세그먼트 데이터 배열
    private var searchedCities: [City] = [] // 검색 데이터 배열
    
    private var cities: [City] = []  // 보여줄 데이터 배열
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var citySegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onSegmentValueChanged(citySegment)
    }
    // MARK: - setup TextField
    
    @IBAction func onSearchButtonTapped(_ sender: UITextField) {
        view.endEditing(true)
        
        // 빈문자 검색시 기존 세그먼트 내용 붙이기
        if sender.text!.isEmpty {
            cities = sortedCities
            tableView.reloadData()
            return
        }
        
        let noWS = sender.text?.replacingOccurrences(of: " ", with: "") ?? ""
        let word = noWS.lowercased()
        print(word)
        
        searchedCities = sortedCities.filter({ city in
            city.city_name.contains(word) ||
            city.city_english_name.lowercased().contains(word) ||
            city.city_explain.contains(word)
        })
        
        print(searchedCities)
        cities = searchedCities
        tableView.reloadData()
    }
    
    
    
    // MARK: - setup Segment
    @IBAction func onSegmentValueChanged(_ sender: UISegmentedControl) {
        searchTextField.text = ""
        sortedCities = switch citySegment.selectedSegmentIndex {
        case 1: originalCityInfos.filter({ city in
            city.domestic_travel == true
        })
        case 2: originalCityInfos.filter({ city in
            city.domestic_travel == false
        })
        default: originalCityInfos
        }
        cities = sortedCities
        tableView.reloadData()
    }
    

    // MARK: - setup TableViewController
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier) as! CityTableViewCell
        
        tableView.register(UINib(nibName: CityWithXIBTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CityWithXIBTableViewCell.identifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: CityWithXIBTableViewCell.identifier) as! CityWithXIBTableViewCell
        
        cell.configureData(city: cities[indexPath.row], searchedWord: searchTextField.text!)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

}
