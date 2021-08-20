//
//  EventsContainerCell.swift
//  EventsApp
//
//  Created by huda elhady on 19/08/2021.
//

import UIKit

class EventsContainerCell: UICollectionViewCell {
    @IBOutlet weak var eventsTableView: UITableView!
    var presenter: EventsContainerPresenterProtocol! {
        didSet {
            presenter.view = self
        }
    }

    private var didSelectEventHandler: ((Event)->Void)?
    static let identifier = "EventsContainerCell"
}

extension EventsContainerCell: EventsContainerPresenterOutputProtocol {
    func updateEventsList() {
        eventsTableView.reloadData()
    }
}


extension EventsContainerCell: EventContainerCellProtocol {
    func getEvents(didSelectEventHandler: @escaping (Event) -> Void) {
        presenter.getEvents()
        self.didSelectEventHandler = didSelectEventHandler
    }
}

extension EventsContainerCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.eventsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.identifier, for: indexPath) as! EventCell
        presenter.configureEventCell(cell, at: indexPath.row)
        return cell
    }
}

extension EventsContainerCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        didSelectEventHandler?(eventsList[indexPath.row])
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            guard let presenter = self.presenter else {
                return
            }
            let bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height
            if bottomEdge >= scrollView.contentSize.height {
                presenter.loadMoreItems()
            }
      
    }
}
