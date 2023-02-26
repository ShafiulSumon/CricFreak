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
        guard let date1 = dateFormatter.date(from: currDate) else {
            return "0"
        }
        let calendar = Calendar.current
        let startOfToday = calendar.startOfDay(for: Date())
        let startOfDate1 = calendar.startOfDay(for: date1)
        let components = calendar.dateComponents([.day], from: startOfToday, to: startOfDate1)
        return String(components.day ?? 0)
    }
    
    func makeTime(date: String) -> String {
        if(date.count < 17) {
            return "00:00"
        }
        let startIndex = date.index(date.startIndex, offsetBy: 11)
        let endIndex = date.index(date.startIndex, offsetBy: 16)
        let substr = String(date[startIndex..<endIndex])
        return substr
    }
    
    func get_start_and_end_date_Tuple(byMonths: Int) -> (String,String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let today = Date()
        
        let calender = Calendar.current
        
        let otherDay = calender.date(byAdding: .month, value: byMonths, to: today)
        
        let _today = dateFormatter.string(from: today)
        let _otherDay = dateFormatter.string(from: otherDay!)
        
        if(byMonths < 0) {
            return (_otherDay, _today)
        }
        else {
            return (_today, _otherDay)
        }
    }
    
    func localTime(startIndex: Int, offset: Int, originalString: String) -> String {
        
        let utcDateString = originalString
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")

        let utcDate = dateFormatter.date(from: utcDateString)

        dateFormatter.timeZone = TimeZone(identifier: "Asia/Dhaka")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let utcDate = utcDate else {
            return ""
        }
        
        let dhakaDateString = dateFormatter.string(from: utcDate)
        
        let startIndex = dhakaDateString.index(dhakaDateString.startIndex, offsetBy: startIndex)
        let endIndex = dhakaDateString.index(startIndex, offsetBy: offset)
        let firstSubstring = dhakaDateString[startIndex..<endIndex]
        return String(firstSubstring)
    }
    
    func remainingTime(matchTime: String) -> TimeInterval {
        let dateString = matchTime
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        guard let date = dateFormatter.date(from: dateString) else {
            fatalError("Invalid date format")
        }

        let currentDate = Date()
        let timeInterval = date.timeIntervalSince(currentDate)
        
        return timeInterval
    }
}
