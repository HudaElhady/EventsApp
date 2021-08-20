//
//  EventDetailsFactory .swift
//  EventsApp
//
//  Created by huda elhady on 20/08/2021.
//

import Foundation

import UIKit
class EventDetailsConfigrator {
    
    private var event: EventDetails
    
    init(event: EventDetails) {
        self.event = event
    }
    
    func configure(vc: EventDetailsView) {
        vc.eventnameLabel.text = event.name
        vc.eventStartDateLabel.text = event.startDate
        vc.eventDescriptionLabel.text = event.eventDescription
        let staticMapUrl = "http://maps.google.com/maps/api/staticmap?markers=size:mid|color:green|\(event.latitude),\(event.longitude)&size=750x200&key=\(Constants.GMSKey)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        vc.eventLocationImageView.loadImage(from: staticMapUrl)
        vc.eventImageView.loadImage(from: event.image)
    }
}
