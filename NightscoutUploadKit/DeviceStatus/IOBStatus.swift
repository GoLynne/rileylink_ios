//
//  IOBStatus.swift
//  RileyLink
//
//  Created by Pete Schwamb on 7/28/16.
//  Copyright © 2016 Pete Schwamb. All rights reserved.
//

import Foundation

public struct IOBStatus {
    let timestamp: NSDate
    let iob: Double? // basal iob + bolus iob: can be negative
    let basalIOB: Double? // does not include bolus iob

    public init(timestamp: NSDate, iob: Double? = nil, basalIOB: Double? = nil) {
        self.timestamp = timestamp
        self.iob = iob
        self.basalIOB = basalIOB
    }
    
    public var dictionaryRepresentation: [String: AnyObject] {

        var rval = [String: AnyObject]()

        rval["timestamp"] = TimeFormat.timestampStrFromDate(timestamp)

        if let iob = iob {
            rval["iob"] = iob
        }

        if let basalIOB = basalIOB {
            rval["basaliob"] = basalIOB
        }

        return rval
    }
}