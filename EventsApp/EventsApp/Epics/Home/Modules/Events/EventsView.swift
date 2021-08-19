//
//  EventsViewController.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import UIKit

class EventsView: UIViewController {
    
    var presenter: EventsPresenterProtocol! {
        didSet {
            presenter.view = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getEventsTypes()
    }

}

extension EventsView: EventsPresenterOutputProtocol {
//    func updateEventsTypesList() {
//        
//    }
//    
//    
}

