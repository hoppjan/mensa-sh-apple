//
//  Item.swift
//  Mensa SH
//
//  Created by Jan Torben Hopp on 12.05.26.
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
