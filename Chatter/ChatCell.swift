//
//  ChatCell.swift
//  Chatter
//
//  Created by Harjas Monga on 2/1/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        messageView.layer.cornerRadius = 16
        messageView.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
