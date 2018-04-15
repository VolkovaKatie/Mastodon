//
//  API.swift
//  mastodonTimeLine
//
//  Created by Екатерина Волкова on 15/04/2018.
//  Copyright © 2018 VolkovaKatie. All rights reserved.
//

import Foundation
import Moya

enum Result<T> {
    case success(T)
    case error(Error)
}

protocol APIProtocol {
    func timeline(completion: @escaping (Result<[Status]>) -> Void)
}

class API: APIProtocol {
    private let provider = MoyaProvider<MastodonService>()
    
    func timeline(completion: @escaping (Result<[Status]>) -> Void) {
        provider.request(.timelines) { (result) in
            switch(result) {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let decoder = JSONDecoder()
                if let timeline = try? decoder.decode([Status].self, from: data) {
                    completion(.success(timeline))
                } else {
                    completion(.error("Can't decode JSON"))
                }
            case let .failure(error):
                completion(.error(error))
            }
        }

    }
}

