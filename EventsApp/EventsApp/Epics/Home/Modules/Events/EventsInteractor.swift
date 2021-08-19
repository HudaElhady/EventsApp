//
//  EventsInteractor.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import Foundation

class EventsInteractor {
    weak var presenter: EventsInteractorOutputProtocol!
    private let eventsRepo: EventsRepo
    
    init(eventsRepo: EventsRepo = EventsRepoImpl()) {
        self.eventsRepo = eventsRepo
    }
    
}

extension EventsInteractor: EventsInteractorProtocol {
    func fetchEventsTypes() {
        eventsRepo.getEventsTypes { [weak self] result in
            switch result {
            case .success(let eventsTypes):
                self?.presenter?.eventsTypesList(eventsTypes)
            case .failure(let error):
                self?.presenter?.eventsFailure(error: error)
            }
        }
    }
    
    func fetchEvents(by typeId: String) {
        eventsRepo.getEventsList(eventType: typeId, page: "0") { result in
            print(result)
        }
    }
}
