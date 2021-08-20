//
//  EventsContainerInteractor.swift
//  EventsApp
//
//  Created by huda elhady on 19/08/2021.
//

import Foundation

class EventsContainerInteractor {
    weak var presenter: EventsContainerInteractorOutputProtocol!
    private let eventsRepo: EventsRepo
    private var lastPage = false
    private var page = 0
    
    init(eventsRepo: EventsRepo = EventsRepoImpl()) {
        self.eventsRepo = eventsRepo
    }
    
}

extension EventsContainerInteractor: EventsContainerInteractorProtocol {    
    func fetchEvents(by typeId: String) {
        eventsRepo.getEventsList(eventType: typeId, page: "\(page)") {[weak self] result in
            switch result {
            case .success(let events):
                self?.presenter?.eventsList(events)
                self?.lastPage = events.count == 0
                self?.page += 1
            case .failure(let error):
                print(error)
//                self?.presenter?.eventsFailure(error: error)
            }
        }
    }
    
    func fetchNextPage(by typeId: String) {
        guard !lastPage else {
            return
        }
        fetchEvents(by: typeId)
    }
}
