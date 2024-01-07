//
//  HapticManager.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 04.01.24.
//

import Foundation
import SwiftUI

class HapticManager {
    
    private let generator = UINotificationFeedbackGenerator()
    
    func notification(type : UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}
