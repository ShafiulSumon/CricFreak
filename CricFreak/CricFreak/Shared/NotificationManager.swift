//
//  NotificationManager.swift
//  CricFreak
//
//  Created by Admin on 26/2/23.
//

import Foundation
import NotificationCenter

class NotificationManager {
    static let shared = NotificationManager()
    private init() {}
    
    func checkForPermission(title: String, hour: Int, minute: Int) {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings() { settings in
            switch settings.authorizationStatus {
            case .authorized :
                self.dispatchNotification(title: title, hour: hour, minute: minute)
            case .notDetermined :
                center.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if didAllow {
                        self.dispatchNotification(title: title, hour: hour, minute: minute)
                    }
                }
            default:
                return
            }
        }
    }
    
    func dispatchNotification(title: String, hour: Int, minute: Int) {
        let identifier = "\(hour)+\(minute)"
        let body = "Match starts now!"
        let isDaily = false
        print(hour)
        print(minute)
        print(title)
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let calendar = Calendar.current
        var dateComponent = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        dateComponent.hour = hour
        dateComponent.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.removePendingNotificationRequests(withIdentifiers: [identifier])
        center.add(request)
        
    }
}
