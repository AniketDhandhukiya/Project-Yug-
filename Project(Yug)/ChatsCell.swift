//
//  ChatsCell.swift
//  Project(Yug)
//
//  Created by R89 on 03/10/22.
//

import UIKit

class ChatsCell: UITableViewCell {

    @IBOutlet weak var myStack1: UIStackView!
    
    @IBOutlet weak var MyLbl1: UILabel!
    @IBOutlet weak var MyChatsCellVw: UIView!
    @IBOutlet weak var MyLblchatCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        myStack1.layer.cornerRadius = 20
        // Initialization code
        MyLblchatCell.layer.borderColor = .init(gray: 20, alpha: 20)
    }


}
