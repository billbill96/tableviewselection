//
//  TableViewCell.swift
//  tableview2
//
//  Created by Supannee Mutitanon on 9/8/19.
//  Copyright © 2019 Supannee Mutitanon. All rights reserved.
//

import UIKit

protocol TableViewCellDelegate {
    func didbuttonClicked(_ sender: UIButton, indexPath: IndexPath)
}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var delegate : TableViewCellDelegate?
    var indexPath: IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(title: String, index: IndexPath){
        button.setTitle("no", for: .normal)
        button.setTitle("click", for: .selected)
        button.tag = index.section
        label.text = title
        indexPath = index
    }

    
    @IBAction func buttonClick(_ sender: UIButton) {
        button.isSelected = !button.isSelected
        delegate?.didbuttonClicked(sender, indexPath: indexPath!)
    }
}
