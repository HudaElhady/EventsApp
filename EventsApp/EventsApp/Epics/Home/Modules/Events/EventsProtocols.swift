//
//  EventsProtocols.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import UIKit

protocol EventsInteractorProtocol {
    var presenter: EventsInteractorOutputProtocol!{get set}
    func fetchEventsTypes()
}

protocol EventsInteractorOutputProtocol: AnyObject {
    
    func eventsTypesList(_ list: [EventType])
    func eventsFailure(error: NetworkError)
}

protocol EventsPresenterOutputProtocol: UIViewController  {
    func updateEventsTypesList()
    func scrollToIndex(_ indexPath: IndexPath)
}

protocol EventsPresenterProtocol {
    var view: EventsPresenterOutputProtocol? {get set}
    var eventsTypesCount: Int {get}
    func getEventsTypes()
    func configureEventsCell(_ cell: EventContainerCellProtocol,at index: Int)
}

protocol EventsRouterProtocol {
    var rootViewController: UIViewController { get }
    func showAlert(message: String, view: UIViewController)
    func pushEventDetails(_ eventDetails: EventDetails, vc: UIViewController)
    func passEventsTypes(types: [EventType], vc: UIViewController, selectTypeHandler: @escaping (EventType)->Void)
}

protocol EventContainerCellProtocol: AnyObject {
    var presenter: EventsContainerPresenterProtocol!{get set}
    func getEvents(didSelectEventHandler: @escaping (Event) -> Void)
}


