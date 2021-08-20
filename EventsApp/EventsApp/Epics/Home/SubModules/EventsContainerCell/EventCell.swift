//
//  EventCell.swift
//  EventsApp
//
//  Created by huda elhady on 19/08/2021.
//

import UIKit

class EventCell: UITableViewCell {
    @IBOutlet weak var eventImageView: DownloadImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    static let identifier = "EventCell"
    
}

extension EventCell: EventCellProtocol {
    func setEvent(name: String, date: String, description: String, image: String) {
        eventImageView.loadImage(from: image)
        descriptionLabel.text = description
        nameLabel.text = name
        dateLabel.text = date
    }
}
