//
//  EventDetailsView.swift
//  EventsApp
//
//  Created by huda elhady on 20/08/2021.
//

import UIKit

class EventDetailsView: UIViewController {
    @IBOutlet weak var eventnameLabel: UILabel!
    @IBOutlet weak var eventStartDateLabel: UILabel!
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    @IBOutlet weak var eventImageView: DownloadImageView!
    @IBOutlet weak var eventLocationImageView: DownloadImageView!
    
    private var configrator: EventDetailsConfigrator!
    
    static func make(with event: EventDetails) -> EventDetailsView {
        let view = UIStoryboard(name: StoryBoardsIDs.main.id, bundle: nil).instantiateViewController(withIdentifier: ViewControllersIDs.EventDetailsVC.id) as! EventDetailsView
        view.configrator = EventDetailsConfigrator(event: event)
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configrator.configure(vc: self)
    }

}
