//
//  NSDateExtension.swift
//  SwiftHelper
//
//  Created by Eric Collom on 1/23/16.
//  Copyright © 2016 Eric Collom. All rights reserved.
//

import Foundation

extension NSDate: Comparable { }

public func ==(leftDate: NSDate, rightDate: NSDate) -> Bool {
    return leftDate.isEqualToDate(rightDate)
}

/* 
The idea here is that NSDates are seconds since a specific date in time.
So, the date with more seconds is considered greater.

For example, today > yesterd and tomorrow > today
*/

public func <(leftDate:NSDate, rightDate:NSDate) -> Bool {
    return leftDate.compare(rightDate) == .OrderedAscending
}

public func <=(leftDate:NSDate, rightDate:NSDate) -> Bool{
    return leftDate.compare(rightDate) == .OrderedAscending || leftDate == rightDate
}

public func >(leftDate:NSDate,rightDate:NSDate)->Bool{
    return leftDate.compare(rightDate) == .OrderedDescending
}

public func >=(leftDate:NSDate,rightDate:NSDate)->Bool{
    return leftDate.compare(rightDate) == .OrderedDescending || leftDate == rightDate
}

extension NSDate{
    func dayOfWeek() -> Int? {
        guard
            let cal: NSCalendar = NSCalendar.currentCalendar(),
            let comp: NSDateComponents = cal.components(.Weekday, fromDate: self) else { return nil }
        return comp.weekday
    }
    
    
    func isDateFromToday()->Bool{
        if self != nil{
            let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
            return appDel.gregorianCalendar.isDateInToday(self)
        }
        return false
    }
}