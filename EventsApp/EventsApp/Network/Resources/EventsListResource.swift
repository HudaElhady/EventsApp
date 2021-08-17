//
//  EventsListResource.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import Foundation

struct EventsListResource {
    static func eventsList(eventType: String, page: String) -> Resource<[Event]> {
        let endpoint = Endpoint(
            path: "/events",
            queryItems: [
                URLQueryItem(name: "event_type", value: eventType),
                URLQueryItem(name: "page", value: page)
            ]
        )
        var url: URL? {
            var components = URLComponents()
            components.scheme = "http"
            components.host = NetworkConstants.baseUrl
            components.path = endpoint.path
            components.queryItems = endpoint.queryItems
            return components.url
        }
        return Resource<[Event]>(get: url!)
    }
}
