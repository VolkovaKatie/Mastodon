//
//  StatusHeaderCell.swift
//  mastodonTimeLine
//
//  Created by Екатерина Волкова on 14/04/2018.
//  Copyright © 2018 VolkovaKatie. All rights reserved.
//

import Foundation
import UIKit

class StatusHeaderCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillCell(with status: TimeLineCellViewModel) {
        self.displayNameLabel.text = status.displayNameText
        self.usernameLabel.text = "@\(status.usernameText)"
        self.contentLabel.text = status.contentText.string
        self.timeLabel.text = status.timeText
        
        status.avatarLoadedClosure = {
            DispatchQueue.main.async {
                self.avatarImageView.image = status.avatarImage
            }
        }
        
        status.loadAvatarImage()
    }
    
    static func getCellID() -> String {
        return "statusHeaderCellID"
    }
}
