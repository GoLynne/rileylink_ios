//
//  EnableDisableRemotePumpEvent.swift
//  RileyLink
//
//  Created by Pete Schwamb on 3/8/16.
//  Copyright © 2016 Pete Schwamb. All rights reserved.
//

import Foundation

public struct EnableDisableRemotePumpEvent: TimestampedPumpEvent {
    public let length: Int
    public let timestamp: NSDateComponents
    
    public init?(availableData: NSData, pumpModel: PumpModel) {
        length = 21
        
        guard length <= availableData.length else {
            return nil
        }
        
        timestamp = NSDateComponents(pumpEventData: availableData, offset: 2)
    }
    
    public var dictionaryRepresentation: [String: AnyObject] {
        return [
            "_type": "EnableDisableRemote",
        ]
    }
}