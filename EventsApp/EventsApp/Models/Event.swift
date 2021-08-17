//
//  Event.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import Foundation

struct RootClass : Codable {

    let cover : String?
    let descriptionField : String?
    let endDate : String?
    let id : String?
    let latitude : String?
    let longitude : String?
    let name : String?
    let startDate : String?


    enum CodingKeys: String, CodingKey {
        case id, latitude, longitude, cover, name
        case descriptionField = "description"
        case endDate = "end_date"
        case startDate = "start_date"
    }

}
