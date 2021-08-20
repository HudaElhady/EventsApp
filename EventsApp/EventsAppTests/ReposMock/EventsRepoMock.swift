//
//  EventsRepoMock.swift
//  EventsAppTests
//
//  Created by huda elhady on 20/08/2021.
//

import Foundation
@testable import EventsApp

class EventsRepoMock: BaseRepoMock, EventsRepo {
    
    var getEventsSuccess: [Event]!
    func getEventsList(eventType: String, page: String, completionHandler: @escaping (Result<[Event], NetworkError>) -> Void) {
        shouldSuccess ? completionHandler(.success(getEventsSuccess)) : completionHandler(.failure(failReponse))
    }
    
    var getEventsTypesSuccess: [EventType]!
    func getEventsTypes(completionHandler: @escaping (Result<[EventType], NetworkError>) -> Void) {
        shouldSuccess ? completionHandler(.success(getEventsTypesSuccess)) : completionHandler(.failure(failReponse))
    }
}
