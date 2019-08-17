//
//  ViewController2.swift
//  tableview2
//
//  Created by Supannee Mutitanon on 17/8/19.
//  Copyright © 2019 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit

class ViewController2 : UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var arrGroup : [Group] = []
    var selectedIndexPath: [IndexPath] = []
    var selectedGroup: [SelectedGroup] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "Header")
        tableView.delegate = self
        tableView.dataSource = self
        
        
        print(selectedGroup)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
//        return arrGroup.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
//        return arrGroup[section].listGroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell {
            cell.setupCell(title: arrGroup[indexPath.section].listGroup[indexPath.row].listGroupName,index: indexPath)
//            cell.delegate = self
//
//            cell.button.isSelected = selectIndexPath.contains(indexPath)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as? HeaderView {
            view.setupView(header: arrGroup[section].groupName,section: section)
//            view.button.isSelected = find(section: section)
//            view.delegate = self
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

}
