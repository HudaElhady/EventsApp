//
//  Endpoints.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {
    static func eventsList(eventType: String, page: String) -> Endpoint {
        return Endpoint(
            path: "/events",
            queryItems: [
                URLQueryItem(name: "event_type", value: eventType),
                URLQueryItem(name: "page", value: page)
            ]
        )
    }
    
    static func eventTypes() -> Endpoint {
        return Endpoint(path: "/eventtypes", queryItems: [])
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = NetworkConstants.baseUrl
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}
