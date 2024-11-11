//
//  ListItem.swift
//  packIt
//
//  Created by Dominik Woźniak on 11/11/2024.
//

import Foundation
import SwiftData

@Model
final class ListItem {
    var id: UUID
    var name: String
    
    var isChecked: Bool = false
    var category: Category?
    
    var createdAt: Date = Date.now
    var updatedAt: Date = Date.now
    
    init(name: String, category: Category?) {
        self.id = UUID()
        self.name = name
        self.category = category
    }
    
    func toggleChecked() {
        self.isChecked.toggle()
        category?.updateIsChecked()
    }
}
