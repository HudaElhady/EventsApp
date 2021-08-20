//
//  EventsViewController.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import UIKit

class EventsView: UIViewController {
    @IBOutlet weak var eventsCollection:UICollectionView!
    
    var presenter: EventsPresenterProtocol! {
        didSet {
            presenter.view = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        presenter.getEventsTypes()
    }
    
    func setupCollectionView() {
        eventsCollection.isPagingEnabled = true
    }

}

extension EventsView: EventsPresenterOutputProtocol {
    func updateEventsTypesList() {
        eventsCollection.reloadData()
    }
    
    
}

extension EventsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.eventsTypesCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsContainerCell", for: indexPath) as! EventsContainerCell
        presenter.configureEventsCell(cell, at: indexPath.row)
        return cell
    }
    
}

extension EventsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: collectionView.frame.height)
    }
}


