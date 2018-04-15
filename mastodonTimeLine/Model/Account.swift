//
//  Account.swift
//  mastodonTimeLine
//
//  Created by Екатерина Волкова on 13/04/2018.
//  Copyright © 2018 VolkovaKatie. All rights reserved.
//

import Foundation

struct Account: Codable {
    let id: String
    let username: String
    let displayName: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case username = "username"
        case displayName = "display_name"
        case avatarURL = "avatar"
    }
}
