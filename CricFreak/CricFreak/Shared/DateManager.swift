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
            // handle invalid date string
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
        dateFormatter.dateFormat = "YYYY-MM-dd"
        
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
}
