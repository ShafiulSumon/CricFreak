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
