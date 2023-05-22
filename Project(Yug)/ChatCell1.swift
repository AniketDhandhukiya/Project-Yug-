//
//  ChatCell1.swift
//  Project(Yug)
//
//  Created by R89 on 01/01/18.
//

import UIKit

class ChatCell1: UITableViewCell {

    @IBOutlet weak var myStack: UIStackView!
    
    @IBOutlet weak var MyLbl2: UILabel!
    @IBOutlet weak var MyChatsCell1Vw: UIView!
    @IBOutlet weak var MylblChatCell1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myStack.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
