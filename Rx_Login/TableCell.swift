//
//  TableCell.swift
//  Rx_Login
//
//  Created by Keval Patel on 5/5/19.
//  Copyright © 2019 Keval Patel. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var imgViewChannel: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblDj: UILabel!

    var channel : Channel!{
        didSet{
            lblDj.text = channel.dj
            lblTitle.text = channel.title
            lblDescription.text = channel.description
        }
    }
    var selectedChannel : Channel!{
        didSet{
            lblDj.text = channel.dj
            lblTitle.text = "\(channel.title) is Selected"
            lblDescription.text = channel.description
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
