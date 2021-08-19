//
//  EventTypeCell.swift
//  EventsApp
//
//  Created by huda elhady on 17/08/2021.
//

import UIKit

class EventTypeCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var selectionView: UIView!
    static let identifier = "EventTypeCell"
    
    override var isSelected: Bool {
        didSet {
            selectionView.backgroundColor = isSelected ? .white : .systemGray4
        }
    }
}
