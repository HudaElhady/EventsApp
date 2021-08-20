//
//  EventsContainerCell.swift
//  EventsApp
//
//  Created by huda elhady on 19/08/2021.
//

import UIKit

class EventsContainerCell: UICollectionViewCell {
    @IBOutlet weak var eventsTableView: UITableView!
    private var didSelectEventHandler: ((Event)->Void)?
    static let identifier = "EventsContainerCell"
    var presenter: EventsContainerPresenterProtocol! {
        didSet {
            presenter.view = self
        }
    }
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
        return UIScreen.main.bounds.height / 5.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectEventHandler?(presenter.getEvent(by: indexPath.row))
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position >= (eventsTableView.contentSize.height - 100 - scrollView.frame.size.height) {
            presenter.loadMoreItems()
        }
    }
}
