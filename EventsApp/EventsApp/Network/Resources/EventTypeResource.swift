//
//  EventTypeResource.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import Foundation

struct EventsTypeResource {
    static func eventType() -> Resource<[EventType]> {
        let endpoint = Endpoint(path: "/eventtypes", queryItems: [])
        var url: URL? {
            var components = URLComponents()
            components.scheme = "http"
            components.host = NetworkConstants.baseUrl
            components.path = endpoint.path
            return components.url
        }
        return Resource<[EventType]>(get: url!)
    }
}
