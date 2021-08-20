//
//  StoryBoardsIDs.swift
//  EventsApp
//
//  Created by huda elhady on 18/08/2021.
//

import Foundation

enum StoryBoardsIDs: String {
    case main = "Main"
    
    var id: String {
        return self.rawValue
    }
}

enum ViewControllersIDs: String {
    case eventsVC = "EventsView"
    case eventTypeVC = "EventTypeView"
    case EventDetailsVC = "EventDetailsView"
    
    var id: String {
        return self.rawValue
    }
}
