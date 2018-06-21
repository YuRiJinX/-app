//
//  WordTVC.swift
//  单词app
//
//  Created by 金乃德 on 2018/6/3.
//  Copyright © 2018年 金乃德. All rights reserved.
//

import UIKit

class WordTVC: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var explanation: UILabel!
    @IBOutlet weak var phonetic: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
