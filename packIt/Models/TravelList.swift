//
//  TravelList.swift
//  packIt
//
//  Created by Dominik Woźniak on 11/11/2024.
//

import Foundation
import SwiftData

@Model
final class TravelList {
    var id: UUID
    var name: String
    var categories: [Category] = []
    
    var isActive: Bool = true
    var travelDate: Date
    var reminderDate: Date?
    
    var createdAt: Date = Date.now
    var updatedAt: Date = Date.now

    init(name: String, travelDate: Date, reminderDate: Date? = nil) throws {
        guard travelDate > Date.now else {
            throw TravelListError.invalidTravelDate
        }
        
        self.id = UUID()
        self.name = name
        self.travelDate = travelDate
        self.reminderDate = reminderDate
    }
    
    // run method during app statup
    func updateIsActive() {
        let travelEndOfDay = Calendar.current.startOfDay(for: travelDate).addingTimeInterval(86400)
        self.isActive = Date.now < travelEndOfDay
    }
    
    enum TravelListError: Error {
        case invalidTravelDate
    }
}
