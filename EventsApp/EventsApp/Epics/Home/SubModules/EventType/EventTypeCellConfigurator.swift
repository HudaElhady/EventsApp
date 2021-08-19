//
//  EventTypeCellConfigurator.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import UIKit
class EventTypeCellConfigurator {
    func configure(_ cell: EventTypeCell, forDisplaying eventType: EventType) {
        cell.nameLabel.text = eventType.name
    }
}
