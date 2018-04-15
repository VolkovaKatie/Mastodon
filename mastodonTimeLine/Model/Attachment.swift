//
//  Attachment.swift
//  mastodonTimeLine
//
//  Created by Екатерина Волкова on 14/04/2018.
//  Copyright © 2018 VolkovaKatie. All rights reserved.
//

import Foundation

struct Attachment: Codable {
    let id: String
    let type: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case url = "url"
    }
}
