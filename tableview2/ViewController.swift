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
    var selectIndexPath: [IndexPath] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "Header")
        tableView.delegate = self
        tableView.dataSource = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell {
            cell.setupCell(index: indexPath)
            cell.delegate = self
            
            if selectIndexPath.contains(indexPath) {
                cell.button.isSelected = true
            }else {
                cell.button.isSelected = false
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as? HeaderView {
            view.setupView(section: section)
            let totalRow = tableView.numberOfRows(inSection: section)
            for row in 0..<totalRow {
                let index = IndexPath(row: row, section: section)
                if selectIndexPath.contains(index) {
                    view.button.isSelected = true
                }else {
                     view.button.isSelected = false
                }
            }
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
}

extension ViewController: TableViewCellDelegate {
    func didbuttonClicked(_ sender: UIButton, indexPath: IndexPath) {
        print("click cell \(indexPath)")
        let totalRow = tableView.numberOfRows(inSection: sender.tag)
//        for row in 0..<totalRow {
//            if selectIndexPath.contains(indexPath) {
//                selectIndexPath.remove(at: selectIndexPath.firstIndex(of: indexPath)!)
//            }else {
//                selectIndexPath.append(indexPath)
//            }
//        }
        
        tableView.reloadSections(IndexSet(integer: sender.tag), with: .none)
    }
}

extension ViewController: HeaderViewDelegate {
    func buttonClickedInHeader(sender: UIButton) {
        print("click header \(sender.tag)")

        let totalRow = tableView.numberOfRows(inSection: sender.tag)
        for row in 0..<totalRow {
            let index = IndexPath(row: row, section: sender.tag)
            print(index)
            if selectIndexPath.contains(index) {
                selectIndexPath.remove(at: selectIndexPath.firstIndex(of: index)!)
            }else {
                selectIndexPath.append(index)
            }
        }
        print(selectIndexPath)

        tableView.reloadSections(IndexSet(integer: sender.tag) ,with: .none)
    }
}
