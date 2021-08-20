//
//  StringExtension.swift
//  EventsApp
//
//  Created by huda elhady on 20/08/2021.
//

import Foundation

extension String {
    func toDateString(formate: String) -> String? {
        guard let date = self.detectDate() else {
            return nil
        }
        let formatter = DateFormatter()
        formatter.dateFormat = formate
        return formatter.string(from: date)
    }
    
    func detectDate() -> Date? {
        return (try? NSDataDetector(types: NSTextCheckingAllTypes))?.firstMatch(in: self, range: NSRange(0..<count))?.date
    }
}
