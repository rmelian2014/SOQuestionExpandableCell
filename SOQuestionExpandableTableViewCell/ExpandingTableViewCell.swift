//
//  ExpandingTableViewCell.swift
//  SOQuestionExpandableTableViewCell
//
//  Created by Reinier Melian on 18/06/2017.
//  Copyright © 2017 Pruebas. All rights reserved.
//

import UIKit

protocol OptionButtonsDelegate{
    func closeFriendsTapped(at index:IndexPath)
}

class ExpandingTableViewCellContent {
    var pickupLocation: String?
    var dropLocation: String?
    var expanded: Bool
    
    init(pickupLocation: String, dropLocation: String) {
        self.pickupLocation = pickupLocation
        self.dropLocation = dropLocation
        self.expanded = false
    }
}

class ExpandingTableViewCell: UITableViewCell {
    
    @IBOutlet var lblPickupLocation: UILabel!
    @IBOutlet var lblDropLocation: UILabel!
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnDropProposal: UIButton!
    var delegate:OptionButtonsDelegate!
    var indexPath:IndexPath!
    
    static let collapsedHeigth : CGFloat = 80
    static let expandedHeigth : CGFloat = 210
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        self.delegate?.closeFriendsTapped(at: indexPath)
    }
    
    func set(content: ExpandingTableViewCellContent) {
        self.lblPickupLocation.text = content.pickupLocation
        self.lblDropLocation.text = content.dropLocation
        if content.expanded {
            self.backgroundColor = UIColor(red: 223/255.0, green: 236/255.0, blue: 255/255.0, alpha: 1)
        }
        else
        {
            self.backgroundColor = UIColor.white
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.btnFacebook.layer.cornerRadius = self.btnFacebook.bounds.size.height/2
        self.btnFacebook.layer.masksToBounds = true
        self.btnDropProposal.layer.cornerRadius = self.btnDropProposal.bounds.size.height/2
        self.btnDropProposal.layer.masksToBounds = true
    }
}
