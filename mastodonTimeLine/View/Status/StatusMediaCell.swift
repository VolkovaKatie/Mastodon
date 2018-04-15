//
//  StatusMediaCell.swift
//  mastodonTimeLine
//
//  Created by Екатерина Волкова on 14/04/2018.
//  Copyright © 2018 VolkovaKatie. All rights reserved.
//

import Foundation
import UIKit

class StatusMediaCell: UITableViewCell {
    @IBOutlet weak var mediaImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillCell(with viewModel: TimeLineCellViewModel) {
        viewModel.attachmentLoadedClosure = {
            DispatchQueue.main.async {
                self.mediaImageView.image = viewModel.attachmentImage
            }
        }
        viewModel.loadAttachment()
    }
    
    static func getCellID() -> String {
        return "mediaCellID"
    }
}
