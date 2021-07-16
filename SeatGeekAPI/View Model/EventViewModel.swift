//
//  EventViewModel.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import UIKit

class EventViewModel {
    let eventInformation: EventResponse
    
    init(eventResponse: EventResponse) {
        self.eventInformation = eventResponse
    }
    
    init() {
        self.eventInformation = EventResponse(events: nil, meta: nil, inHand: nil)
    }
    
    func getNumberOfEvents() -> Int {
        self.eventInformation.events?.count ?? 0
    }
    
    func createVM(num: Int) -> EventDetailsViewModel? {
        let event = eventInformation.events?[num]
        return EventDetailsViewModel(event: event!)
    }
    
}
