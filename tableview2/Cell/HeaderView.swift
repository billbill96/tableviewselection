//
//  HeaderView.swift
//  tableview2
//
//  Created by Supannee Mutitanon on 9/8/19.
//  Copyright © 2019 Supannee Mutitanon. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate {
    func buttonClickedInHeader(sender: UIButton)
}
class HeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var label: UILabel!

    var delegate:HeaderViewDelegate?
    
    func setupView(header: String,section: Int){
        button.setTitle("not", for: .normal)
        button.setTitle("click", for: .selected)
        label.text = header
        button.tag = section
    }
    
    
    @IBAction func didButtonClicked(_ sender: UIButton) {
        button.isSelected = !button.isSelected
        delegate?.buttonClickedInHeader(sender: sender)
    }
    
}
