//
//  EventsListResource.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import Foundation

struct EventsListResource {
    static func eventsList(eventType: String, page: String) -> Resource<[Event]> {
        let endpoint = Endpoint.eventsList(eventType: eventType, page: page)
        return Resource<[Event]>(get: endpoint.url!)
    }
}
