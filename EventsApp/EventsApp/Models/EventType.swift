//
//  EventType.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import Foundation

struct EventType : Codable {
    let id : String?
    let name : String?
}

extension EventType: Equatable {
    static func ==(lhs: EventType, rhs: EventType) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}
