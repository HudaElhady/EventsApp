//
//  EventsRepo.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import Foundation

protocol EventsRepo {
    func getEventsList(eventType: String, page: String, completionHandler: @escaping (Result<[Event],NetworkError>)->Void)
    
    func getEventsTypes(completionHandler: @escaping (Result<[EventType],NetworkError>)->Void)
    
}

class EventsRepoImpl: EventsRepo {
    
    func getEventsList(eventType: String, page: String, completionHandler: @escaping (Result<[Event],NetworkError>)->Void) {
        URLSession.shared.load(EventsListResource.eventsList(eventType: eventType, page: page)) {response in
            switch response {
            case .success(let events):
                completionHandler(.success(events))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func getEventsTypes(completionHandler: @escaping (Result<[EventType],NetworkError>)->Void) {
        URLSession.shared.load(EventsTypeResource.eventType()) {response in
            switch response {
            case .success(let eventTypes):
                completionHandler(.success(eventTypes))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
