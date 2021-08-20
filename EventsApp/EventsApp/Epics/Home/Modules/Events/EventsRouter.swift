//
//  EventsRouter.swift
//  EventsApp
//
//  Created by huda elhady on 18/08/2021.
//

import UIKit

class EventsRouter: EventsRouterProtocol {
    
    var rootViewController: UIViewController {
        let interactor = EventsInteractor()
        let eventsVC =  UIStoryboard(name: StoryBoardsIDs.main.id, bundle: nil).instantiateViewController(withIdentifier: ViewControllersIDs.eventsVC.id) as! EventsView
        eventsVC.presenter = EventsPresenter(interactor: interactor, router: self)
        let navigationController = UINavigationController(rootViewController: eventsVC)
        return navigationController
    }
    
    func passEventsTypes(types: [EventType], vc: UIViewController, selectTypeHandler: @escaping (EventType) -> Void) {
        let eventTypeVC = UIStoryboard(name: StoryBoardsIDs.main.id, bundle: Bundle.main).instantiateViewController(withIdentifier: ViewControllersIDs.eventTypeVC.id) as! EventTypeView
        vc.addChild(eventTypeVC)
        eventTypeVC.view.frame = vc.view.bounds
        vc.view.addSubview(eventTypeVC.view)
        eventTypeVC.view.translatesAutoresizingMaskIntoConstraints = false
        eventTypeVC.view.topAnchor.constraint(equalTo: vc.view.topAnchor, constant: vc.view.safeAreaInsets.top).isActive = true
        eventTypeVC.view.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor).isActive = true
        eventTypeVC.view.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor).isActive = true
        eventTypeVC.view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        eventTypeVC.didMove(toParent: vc)
        eventTypeVC.set(eventTypesList: types, didSelectTypeHandler: selectTypeHandler)
    }
    
    func showAlert(message: String, view: UIViewController) {
        view.alert(message: message, actions: [("Cancel", .cancel)])
    }
    
    func pushEventDetails(_ eventDetails: EventDetails, vc: UIViewController) {
        vc.navigationController?.pushViewController(EventDetailsView.make(with: eventDetails), animated: true)
    }

}
