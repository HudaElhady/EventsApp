//
//  EventsContainerPresenter.swift
//  EventsApp
//
//  Created by huda elhady on 19/08/2021.
//

import Foundation

class EventsContainerPresenter {
    var interactor: EventsContainerInteractorProtocol
    var eventType: String
    weak var view: EventsContainerPresenterOutputProtocol?
    internal var eventsList = [Event]()
    var eventsCount: Int = 0
    
    init(interactor: EventsContainerInteractorProtocol, eventType: String) {
        self.interactor = interactor
        self.eventType = eventType
        self.interactor.presenter = self
    }
}

extension EventsContainerPresenter: EventsContainerPresenterProtocol {

    func configureEventCell(_ cell: EventCellProtocol, at index: Int) {
        let event = eventsList[index]
        let date = (event.startDate ?? "").toDateString(formate: "d, MMM yyyy") ?? ""
        cell.setEvent(name: event.name ?? "", date: date, description: event.descriptionField ?? "", image: event.cover ?? "")
    }
    func getEvents() {
        interactor.fetchEvents(by: eventType)
    }
    
    func loadMoreItems() {
        interactor.fetchNextPage(by: eventType)
    }
    
    func getEvent(by index: Int) -> Event {
        return eventsList[index]
    }
}

extension EventsContainerPresenter: EventsContainerInteractorOutputProtocol {
    func eventsList(_ list: [Event]) {
        eventsCount += list.count
        eventsList.append(contentsOf: list)
        view?.updateEventsList()
    }
}
