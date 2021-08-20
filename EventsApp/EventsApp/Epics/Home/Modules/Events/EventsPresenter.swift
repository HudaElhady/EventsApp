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
    
    func didChangeEventType(_ newType: EventType) {
        guard let index = eventsTypes.firstIndex(of: newType) else {
            return
        }
        let indexPath = IndexPath(item: index, section: 0)
        self.view?.scrollToIndex(indexPath)
    }
}

extension EventsPresenter: EventsInteractorOutputProtocol {
    func eventsTypesList(_ list: [EventType]) {
        eventsTypesCount = list.count
        eventsTypes = list
        router.passEventsTypes(types: list, vc: view!, selectTypeHandler: didChangeEventType)
        view?.updateEventsTypesList()
    }
    
    func eventsFailure(error: NetworkError) {
        router.showAlert(message: error.errorMessage, view: view!)
    }
}
