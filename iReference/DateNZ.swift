//
//  Date.swift
//  iReference
//
//  Created by AmirHossein EramAbadi on 12/22/22.
//

import Foundation
class DateNZ {
    public static func convertDate(from date: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateFormatterPrint =  DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy"
        
        let date: Date? = dateFormatterGet.date(from: date)
        return dateFormatterPrint.string(from: date!)
        
    }
    public static func convertTime(from date: String) -> String {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateFormatterPrint =  DateFormatter()
        
        dateFormatterPrint.dateFormat = "HH:mm "
        
        let date: Date? = dateFormatterGet.date(from: date)
        return dateFormatterPrint.string(from: date!)
        
    }
    public static  func convertTimeStamp(from timeStamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MM-dd-yyyy, HH:mm a"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM d, yyyy"
        return dateFormatterPrint.string(from: date)
    }
}
