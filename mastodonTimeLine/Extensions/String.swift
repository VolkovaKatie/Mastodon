//
//  String.swift
//  mastodonTimeLine
//
//  Created by Екатерина Волкова on 15/04/2018.
//  Copyright © 2018 VolkovaKatie. All rights reserved.
//

import Foundation

extension String {
    func convertToDate() -> Date? {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return formater.date(from: self)
    }
    
    func convertFromHTML() -> NSAttributedString {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            return attributedString
        }
        return NSAttributedString()
    }
}

extension String: Error {
    
}
