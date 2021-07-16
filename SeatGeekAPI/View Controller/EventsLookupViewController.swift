//
//  EventsLookupViewController.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import UIKit

class EventsLookupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTableView.delegate = self
        eventsSearchBar.delegate = self
        eventsTableView.dataSource = self
    }
    
    @IBOutlet var eventsTableView: UITableView!
    @IBOutlet weak var eventsSearchBar: UISearchBar!
    
    var eventsVM: EventViewModel?
    var eventDetailsVM: EventDetailsViewModel?
}

//MARK: - Table view logic
extension EventsLookupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsVM?.getNumberOfEvents() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = eventsTableView.dequeueReusableCell(withIdentifier: "eventCell") as? EventsTableViewCell,
              let cellVM = eventsVM?.createVM(num: indexPath.row)
        else {
            return UITableViewCell()
        }
        cell.configure(viewModel: cellVM)
        
        ImageCache.shared.loadImage(from: cellVM.getDetailedImageURL() ) { image in
            if let visibleCell = tableView.cellForRow(at: indexPath) as? EventsTableViewCell {
                visibleCell.eventsImageView.image = image
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "EventsDetailVC") as? EventsDetailViewController {
            let detailsVM = EventDetailsViewModel(event: (eventsVM?.eventInformation.events?[indexPath.row])!)
            vc.detailsVM = detailsVM
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

//MARK: - Search bar logic
extension EventsLookupViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let eventsLookup = eventsSearchBar.text, !eventsLookup.isEmpty else {
            self.eventsVM = EventViewModel()
            self.eventsTableView.reloadData()
            return
        }
        NetworkManager.fetchEvents(searchTerm: eventsLookup) { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.eventsVM = EventViewModel(eventResponse: response)
                    self?.eventsTableView.reloadData()
                case .failure(let error):
                    print(error,error.localizedDescription)
                }
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        eventsSearchBar.text = nil
        eventsSearchBar.endEditing(true)
    }
    
}
