//
//  Extensions.swift
//  WUCC
//
//  Created by Felix Changoo on 9/4/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import Foundation
import UIKit

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
}

extension Properties {
    func getProperties() -> [String : Any]? {
        var properties = [String: Any]()
        let mirror = Mirror(reflecting: self)
        
        guard let style = mirror.displayStyle, style == .struct || style == .class else {
            return nil
        }
        
        for (property, value) in mirror.children {
            guard let property = property else {
                continue
            }
            
            properties[property] = value
        }
        return properties
    }
}

extension String {
    func getInitials() -> String? {
        guard !self.isEmpty else { return .none }
        
        var substrings = self.components(separatedBy: " ")
        let firstStr = substrings[0]
        let firstStrIdx = firstStr.startIndex
        
        let firstLetter = "\(firstStr[firstStrIdx])"
        var secondLetter = ""
        
        if substrings.count > 1 {
            let secondStr = substrings[1]
            let secondStrIdx = secondStr.startIndex
            
            secondLetter = "\(secondStr[secondStrIdx])".capitalized
        }
        
        return firstLetter + secondLetter
    }
}

extension Date {
    static func formatDate(date: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        guard let dateObj = dateFormatterGet.date(from: date) else { return "" }
        
        return dateFormatter.string(from: dateObj)
    }
}

