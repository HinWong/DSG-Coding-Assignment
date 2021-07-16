//
//  EventsDetailViewController.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import UIKit

class EventsDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateLabels()
    }
    
    var detailsVM: EventDetailsViewModel?
    var eventsVM: EventViewModel?
    
    //MARK: - Outlets
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var eventVenueImageView: UIImageView!
    @IBOutlet weak var favoritesButton: UIButton!
    
    //MARK: - Actions
    @IBAction func favoritesButtonTapped(_ sender: UIButton) {
        if favoritesButton.tag == 0 {
            let image = UIImage(systemName: "heart") as UIImage?
            favoritesButton.setImage(image, for: .normal)
            favoritesButton.tag = 1
        } else {
            let image = UIImage(systemName: "heart.fill") as UIImage?
            favoritesButton.setImage(image, for: .normal)
            favoritesButton.tag = 0
        }
    }
    
    //MARK: - UI
    private func updateLabels() {
        eventTimeLabel.text = detailsVM?.getEventDate()
        eventTitleLabel.text = detailsVM?.getEventTitle()
        eventLocationLabel.text = detailsVM?.getEventLocation()
        ImageCache.shared.loadImage(from: detailsVM?.getDetailedImageURL() ?? "") { [self] image in
            eventVenueImageView.image = image
            }
        }
}
    
    

