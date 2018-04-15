//
//  TimeLineCellModel.swift
//  mastodonTimeLine
//
//  Created by Екатерина Волкова on 14/04/2018.
//  Copyright © 2018 VolkovaKatie. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class TimeLineCellViewModel {
    var displayNameText: String
    var usernameText: String
    var contentHTML: String
    var timeText: String = ""
    var avatarLoadedClosure: (() -> Void)?
    var attachmentLoadedClosure: (() -> Void)?
    var timeDiffSetClosure: (() -> Void)?
    var contentConvertedClosure: (() -> Void)?
    private var avatarURL: String
    private var mediaArray: [Attachment]
    
    var contentText = NSAttributedString() {
        didSet {
            self.contentConvertedClosure?()
        }
    }
    
    var avatarImage = UIImage() {
        didSet {
            self.avatarLoadedClosure?()
        }
    }
    
    var attachmentImage = UIImage() {
        didSet {
            self.attachmentLoadedClosure?()
        }
    }
    
    private var attachmentURL: String? {
        return self.mediaArray.filter({ $0.type == "image" }).first?.url
    }
    
    var isAttachmantExists: Bool {
        return self.attachmentURL != nil
    }
    
    init(status: Status)
    {
        self.displayNameText = status.account.displayName
        self.usernameText = status.account.username
        self.contentHTML = status.content
        
        self.avatarURL = status.account.avatarURL
        self.mediaArray = status.attachments
        
        if let dateTime = status.createdAt.convertToDate() {
            self.timeText = Convert().convertDateDiffToString(createdAt: dateTime)
        }
        self.contentText = contentHTML.convertFromHTML()
    }
    
    
    func loadAvatarImage() {
        Alamofire.request(self.avatarURL).responseData { [weak self] (response) in
            if let error = response.error {
                print(error)
            } else {
                if let data = response.data {
                    self?.avatarImage = UIImage(data: data) ?? UIImage()
                }
            }
        }
    }
    
    func loadAttachment() {
        if let url = self.attachmentURL {
            Alamofire.request(url).responseData { [weak self] (response) in
                if let error = response.error {
                    print(error)
                } else {
                    if let data = response.data {
                        self?.attachmentImage = UIImage(data: data) ?? UIImage()
                    }
                }
            }
        }
    }
    
    func convertContent() {
        self.contentText = contentHTML.convertFromHTML()
    }
}

