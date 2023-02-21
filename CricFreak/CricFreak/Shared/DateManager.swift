//
//  DateManager.swift
//  CricFreak
//
//  Created by Admin on 21/2/23.
//

import Foundation

class DateManager {
    static let shared = DateManager()
    private init() {}
    
    func daysBetween(currDate: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date1 = dateFormatter.date(from: currDate)!
        
        return String(Calendar.current.dateComponents([.day], from: Date(), to: date1).day!)
    }
    
    func makeTime(date: String) -> String {
        if(date.count < 17) {
            return "10:10"
        }
        let startIndex = date.index(date.startIndex, offsetBy: 11)
        let endIndex = date.index(date.startIndex, offsetBy: 16)
        let substr = String(date[startIndex..<endIndex])
        return substr
    }
}
