//
//  TableViewCell.swift
//  ToDOLIST1
//
//  Created by Ivan Christopher BANFOU on 04/01/2024.
//


import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var dejafait: UISwitch!
    
    @IBOutlet weak var Date: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        dejafait.isOn = false
        // Configure the view for the selected state
    }

}


