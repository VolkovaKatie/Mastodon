//
//  TimeLineCellView.swift
//  mastodonTimeLine
//
//  Created by Екатерина Волкова on 14/04/2018.
//  Copyright © 2018 VolkovaKatie. All rights reserved.
//

import UIKit

class TimeLineCellView: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillCellView(with status: TimeLineCellViewModel) {
        self.displayNameLabel.text = status.displayNameText
        self.usernameLabel.text = "@\(status.usernameText)"
        self.timeLabel.text = status.timeText
        self.contentLabel.text = status.contentText.string
        
        status.avatarLoadedClosure = {
            DispatchQueue.main.async {
                self.avatarImageView.image = status.avatarImage
            }
        }
        
        
        status.loadAvatarImage()
    }
    
    static func getCellID() -> String {
        return "statusCellID"
    }
}
