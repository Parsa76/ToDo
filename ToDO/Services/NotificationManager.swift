//
//  NotificationManager.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 02.01.24.
//

import Foundation
import UserNotifications
import Combine
class NotificationManager {
    
    init() {
        self.requestAuthorization()
        
    }
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert , .sound , .badge ]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success , error)  in
            if let error = error {
                print("Error\(error.localizedDescription)")
            } else {
                print("Success")
            }
        }
    }
    func scheduleNotification(title: String , subtitle: String , id:String , date: Date) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = .default

        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request = UNNotificationRequest(identifier: id,
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request)

    }
    func cancelNotification(id: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
    }
    
    
}
