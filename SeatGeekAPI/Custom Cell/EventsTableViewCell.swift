//
//  EventsTableViewCell.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/12/21.
//

import UIKit

class EventsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventsImageView: UIImageView!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!

    var cellViewModel: EventDetailsViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.updateLabels()
            }
        }
    }
    
    func configure(viewModel: EventDetailsViewModel) {
        self.cellViewModel = viewModel
    }
    
    func updateLabels() {
        if let cellViewModel = cellViewModel {
            eventTitleLabel.text = cellViewModel.getEventTitle()
            eventLocationLabel.text = cellViewModel.getVenueLocation()
            eventTimeLabel.text = cellViewModel.getEventDate()
        }
    }
    
}
