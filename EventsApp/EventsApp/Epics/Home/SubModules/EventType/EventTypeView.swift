//
//  EventTypeViewController.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import UIKit

class EventTypeView: UIViewController {
    @IBOutlet weak var eventTypesCollection:UICollectionView!
    private var didSelectTypeHandler: ((EventType)->Void)?
    private let configurator = EventTypeCellConfigurator()
    private var eventTypesList = [EventType] () {
        didSet{eventTypesCollection.reloadData()}
    }
    
    func set(eventTypesList: [EventType], didSelectTypeHandler: @escaping ((EventType)->Void)) {
        self.eventTypesList = eventTypesList
        self.didSelectTypeHandler = didSelectTypeHandler
    }

}

extension EventTypeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        eventTypesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventTypeCell.identifier, for: indexPath) as! EventTypeCell
        configurator.configure(cell, forDisplaying: eventTypesList[indexPath.row])
        return cell
    }
}

extension EventTypeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectTypeHandler?(eventTypesList[indexPath.row])
    }
}

