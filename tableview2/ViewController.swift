//
//  ViewController.swift
//  tableview2
//
//  Created by Supannee Mutitanon on 9/8/19.
//  Copyright © 2019 Supannee Mutitanon. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    
    var selectIndexPath: [IndexPath] = []
    var arrGroup : [Group] = []
    var selectedGroup : [SelectedGroup] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let listgroup1 = ListGroup(listGroupName: "listgroup1")
        let listgroup2 = ListGroup(listGroupName: "listgroup2")
        let listgroup3 = ListGroup(listGroupName: "listgroup3")
        let group1 = Group(groupName: "group1", listGroup: [listgroup1,listgroup2])
        let group2 = Group(groupName: "group2", listGroup: [listgroup1,listgroup2,listgroup3])
        
        arrGroup = [group1,group2]
        initData(arrGroup: arrGroup)
        print("select \(selectedGroup)")
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "Header")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func initData(arrGroup: [Group]) {
        for arr in arrGroup {
            var listGroup : [SelectedListGroup] = []
            for list in arr.listGroup {
                let list = SelectedListGroup(listGroupName: list.listGroupName, isSelected: false)
                listGroup.append(list)
            }
            let group = SelectedGroup(groupName: arr.groupName, listGroup: listGroup,isSelected: false)
            selectedGroup.append(group)
        }
    }
    
    
    @IBAction func buttonClicked(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        newViewController.selectedGroup = selectedGroup.filter( {$0.listGroup.contains(where: {$0.isSelected})})
        self.present(newViewController, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return selectedGroup.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedGroup[section].listGroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell {
            cell.setupCell(title: selectedGroup[indexPath.section].listGroup[indexPath.row].listGroupName,index: indexPath)
            cell.delegate = self
            cell.button.isSelected = selectedGroup[indexPath.section].listGroup[indexPath.row].isSelected
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as? HeaderView {
            view.setupView(header: selectedGroup[section].groupName,section: section)
            view.button.isSelected = find(section: section)
            view.delegate = self
            return view
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func find(section: Int) -> Bool {
        let totalRow = tableView.numberOfRows(inSection: section)
        var count = 0
        for row in 0..<totalRow {
            let index = IndexPath(row: row, section: section)
            if selectedGroup[index.section].listGroup[index.row].isSelected {
                count += 1
            }
        }
        return count == totalRow
    }
}

extension ViewController: TableViewCellDelegate {
    func didbuttonClicked(_ sender: UIButton, indexPath: IndexPath) {
       selectedGroup[indexPath.section].listGroup[indexPath.row].isSelected = !selectedGroup[indexPath.section].listGroup[indexPath.row].isSelected
        
        tableView.reloadSections(IndexSet(integer: sender.tag), with: .none)
    }
}

extension ViewController: HeaderViewDelegate {
    func buttonClickedInHeader(sender: UIButton) {
        let totalRow = tableView.numberOfRows(inSection: sender.tag)
            for row in 0..<totalRow {
                let index = IndexPath(row: row, section: sender.tag)
                if selectedGroup[index.section].isSelected {
                    selectedGroup[index.section].listGroup[index.row].isSelected = !selectedGroup[index.section].listGroup[index.row].isSelected
                }else {
                    selectedGroup[index.section].listGroup[index.row].isSelected = true
                }
            }
        tableView.reloadSections(IndexSet(integer: sender.tag) ,with: .none)
    }
}
