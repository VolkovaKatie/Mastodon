//
//  NetworkService.swift
//  mastodonTimeLine
//
//  Created by Екатерина Волкова on 13/04/2018.
//  Copyright © 2018 VolkovaKatie. All rights reserved.
//

import Foundation
import Moya

public enum MastodonService {
    case accounts(String)
    case statuses(String)
    case timelines
}

extension MastodonService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://mastodon.social/api/v1")!
    }
    
    public var path: String {
        switch self {
        case .accounts(let id):
            return "/accounts/\(id)"
        
        case .statuses(let id):
            return "/statuses/\(id)"
        case .timelines:
            return "timelines/public"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .accounts( _):
            return .requestParameters(parameters: ["" : ""], encoding: URLEncoding.default)
        case .statuses( _):
            return .requestParameters(parameters: ["" : ""], encoding: URLEncoding.default)
        case .timelines:
            return .requestParameters(parameters: ["local" : "yes"], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
