//
//  ChecklistTableViewController.swift
//  TravelMagazine
//
//  Created by Claire on 1/3/25.
//

import UIKit

class ChecklistTableViewController: UITableViewController {
    
//    private var checkLists: [CheckList] = [CheckList(list: "test", check: true, like: false)]
    private var checkLists: [CheckList] = []
    
    @IBOutlet var listTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHeader()
    }
    
    // MARK: - setup TableViewController
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkLists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChecklistTableViewCell.identifier) as! ChecklistTableViewCell
        
        let checkList = checkLists[indexPath.row]
        
        cell.configureData(checkList: checkList)
        
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // MARK: - Delete onSwipe
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            checkLists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    // MARK: - setup Header
    private func setupHeader() {
        listTextField.borderStyle = .none
        listTextField.layer.cornerRadius = 8
        
        addButton.layer.cornerRadius = 8
    }
    
    // MARK: - Button actions
    @objc private func checkButtonTapped(_ sender: UIButton) {
        checkLists[sender.tag].check.toggle()
        tableView.reloadData()
    }
    
    @objc private func likeButtonTapped(_ sender: UIButton) {
        checkLists[sender.tag].like.toggle()
        tableView.reloadData()
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        if listTextField.text!.isEmpty {
            return
        }
        
        checkLists.append(CheckList(list: listTextField.text!, check: false, like: false))
        
        listTextField.text = ""
        listTextField.endEditing(true)
        
        print(checkLists)
        tableView.reloadData()
    }
}
