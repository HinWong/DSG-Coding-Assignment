//
//  DateFormatter.swift
//  SeatGeekAPI
//
//  Created by Luat on 7/16/21.
//

import Foundation

extension Date {
    static func getFormattedDate(string: String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "EEE, MMM dd yyyy h:mm a"

        let date: Date? = dateFormatterGet.date(from: string)
        if let date = date {
            return dateFormatterPrint.string(from: date)
        }
        
        return "No Date"
    }
}
