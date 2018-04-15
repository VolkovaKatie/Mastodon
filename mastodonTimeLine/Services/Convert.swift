//
//  Convert.swift
//  mastodonTimeLine
//
//  Created by Екатерина Волкова on 15/04/2018.
//  Copyright © 2018 VolkovaKatie. All rights reserved.
//

import Foundation

class Convert {
    func convertDateDiffToString(createdAt: Date) -> String {
        if createdAt.minutes()<1 && createdAt.hours()==0 && createdAt.days()==0 {
            return "now"
        }
        
        if createdAt.minutes()>=1 && createdAt.hours()==0 && createdAt.days()==0 {
            return "\(createdAt.minutes())m"
        }
        
        if createdAt.hours()>=0 && createdAt.days()==0 {
            return "\(createdAt.hours())h"
        }
        
        if createdAt.days()>=1 && createdAt.months() == 0 {
            return "\(createdAt.days())d"
        }
        
        if createdAt.months()>=1 && createdAt.years()==0 {
            return "\(createdAt.months())m"
        }
        
        if createdAt.years()>=1  {
            return "\(createdAt.years())y"
        }
        return ""
    }
}
