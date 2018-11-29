//
//  MemoListCell.swift
//  MemoApp
//
//  Created by 503-26 on 29/11/2018.
//  Copyright © 2018 memo. All rights reserved.
//

import UIKit

class MemoListCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var regdate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
