//
//  Date.swift
//  mastodonTimeLine
//
//  Created by Екатерина Волкова on 15/04/2018.
//  Copyright © 2018 VolkovaKatie. All rights reserved.
//

import Foundation

extension Date {
    func days() -> Int {
        let currentDate = Date()
        return Calendar.current.dateComponents([.day], from: self, to: currentDate).day ?? 0
    }
    
    func hours() -> Int {
        let currentDate = Date()
        return Calendar.current.dateComponents([.hour], from: self, to: currentDate).hour ?? 0
    }
    
    func minutes() -> Int {
        let currentDate = Date()
        return Calendar.current.dateComponents([.minute], from: self, to: currentDate).minute ?? 0
    }
    
    func months() -> Int {
        let currentDate = Date()
        return Calendar.current.dateComponents([.month], from: self, to: currentDate).month ?? 0
    }
    
    func years() -> Int {
        let currentDate = Date()
        return Calendar.current.dateComponents([.year], from: self, to: currentDate).year ?? 0
    }
}
