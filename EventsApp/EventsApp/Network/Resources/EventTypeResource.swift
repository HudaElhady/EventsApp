//
//  EventTypeResource.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import Foundation

struct EventsTypeResource {
    static func eventType() -> Resource<[EventType]> {
        let endpoint = Endpoint.eventTypes()
        return Resource<[EventType]>(get: endpoint.url!)
    }
}
