//
//  Status.swift
//  mastodonTimeLine
//
//  Created by Екатерина Волкова on 13/04/2018.
//  Copyright © 2018 VolkovaKatie. All rights reserved.
//

import Foundation

struct Status: Codable {
    let id: String
    let createdAt: String
    let content: String
    let account: Account
    let attachments: [Attachment]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "created_at"
        case content = "content"
        case account = "account"
        case attachments = "media_attachments"
    }
}
