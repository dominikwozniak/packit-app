//
//  Category.swift
//  packIt
//
//  Created by Dominik Woźniak on 11/11/2024.
//

import Foundation
import SwiftData

@Model
final class Category {
    var id: UUID
    var name: String
    
    var isChecked: Bool = false
    var items: [ListItem] = []
    var travelList: TravelList?
    
    var createdAt: Date = Date.now
    var updatedAt: Date = Date.now
    
    init(name: String, travelList: TravelList?) {
        self.id = UUID()
        self.name = name
        self.travelList = travelList
    }
    
    func updateIsChecked() {
        isChecked = items.allSatisfy { $0.isChecked }
    }
    
    func toggleIsChecked() {
        self.isChecked.toggle()
        
        for item in items {
            item.isChecked = self.isChecked
        }
    }
}
