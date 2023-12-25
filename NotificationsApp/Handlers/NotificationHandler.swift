//
//  NotificationHandler.swift
//  NotificationsApp
//
//  Created by Amaal Ali Alsaeedi on 07/06/1445 AH.
//

import Foundation
import UserNotifications

class NotificationHandler {
    
    
    func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Access granted!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func sendNotification(date: Date, type: String, timeInterval: TimeInterval, title: String, body: String) {
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = body
            
            let trigger: UNNotificationTrigger
            if type == "time" {
                trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
            } else if type == "date" {
                let components = Calendar.current.dateComponents([.hour, .minute], from: date)
                trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            } else {
                fatalError("Invalid notification type")
            }
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Failed to schedule notification: \(error)")
                }
            }
        }

    
//    func sendNotification(date: Date, type: String, timeInterval: Double = 10, title: String, body: String) {
//        var trigger: UNNotificationTrigger?
//        
//        // Create a trigger (either from date or time based)
//        if type == "date" {
//            let dateComponents = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: date)
//            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
//        } else if type == "time" {
//            trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
//        }
//        
//        // Customise the content
//        let content = UNMutableNotificationContent()
//        content.title = title
//        content.body = body
//        content.sound = UNNotificationSound.default
//        
//        // Create the request
//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//        UNUserNotificationCenter.current().add(request)
//    }

}


