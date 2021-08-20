//
//  EventsContainerProtocols.swift
//  EventsApp
//
//  Created by huda elhady on 19/08/2021.
//

import UIKit


protocol EventsContainerInteractorProtocol {
    var presenter: EventsContainerInteractorOutputProtocol!{get set}
    func fetchEvents(by typeId: String)
    func fetchNextPage(by typeId: String)
}

protocol EventsContainerInteractorOutputProtocol: AnyObject {
    func eventsList(_ list: [Event])
}

protocol EventsContainerPresenterOutputProtocol: AnyObject  {
    func updateEventsList()
}

protocol EventsContainerPresenterProtocol {
    var view: EventsContainerPresenterOutputProtocol? {get set}
    var eventType: String {get}
    var eventsCount: Int {get}
    func getEvents()
    func configureEventCell(_ cell: EventCellProtocol,at index: Int)
    func loadMoreItems()
    func getEvent(by index: Int) -> Event
}

protocol EventCellProtocol: AnyObject {
    func setEvent(name: String, date: String, description: String, image: String) 
}


