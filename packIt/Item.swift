//
//  Item.swift
//  packIt
//
//  Created by Dominik Woźniak on 03/11/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
