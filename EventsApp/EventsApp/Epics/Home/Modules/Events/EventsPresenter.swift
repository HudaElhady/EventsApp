//
//  EventsPresenter.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import Foundation

class EventsPresenter {
    var interactor: EventsInteractorProtocol
    let router: EventsRouterProtocol
    weak var view: EventsPresenterOutputProtocol?
    private var eventsList = [Event]()
    var eventsTypesCount: Int = 0
    private var eventsTypes = [EventType]()
    
    init(interactor: EventsInteractorProtocol, router: EventsRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.interactor.presenter = self
    }
}

extension EventsPresenter: EventsPresenterProtocol {
    func configureEventsCell(_ cell: EventContainerCellProtocol, at index: Int) {
        let interactor = EventsContainerInteractor()
        cell.presenter = EventsContainerPresenter(interactor: interactor, eventType: eventsTypes[index].id!)
        cell.getEvents { _ in
            
        }
    }
    
    func getEventsTypes() {
        interactor.fetchEventsTypes()
    }
    
    func getEvents(by type: String) {
        interactor.fetchEvents(by: type)
    }
}

extension EventsPresenter: EventsInteractorOutputProtocol {
    func eventsList(_ list: [Event]) {
        eventsList = list
    }
    
    func eventsTypesList(_ list: [EventType]) {
        eventsTypesCount = list.count
        eventsTypes = list
        router.passEventsTypes(types: list, vc: view!) {[weak self] in self?.getEvents(by: $0.id!)}
        view?.updateEventsTypesList()
    }
    
    func eventsFailure(error: NetworkError) {
        
    }
    
    
}
