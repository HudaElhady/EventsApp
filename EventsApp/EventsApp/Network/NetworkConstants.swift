//
//  NetworkConstants.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import Foundation

struct NetworkConstants {
    static let baseUrl = "http://private-7466b-eventtuschanllengeapis.apiary-mock.com/"
    struct Api {
        static let eventTypes = baseUrl + "eventtypes"
        static let eventsList = baseUrl + "/events"
    }
    
}
