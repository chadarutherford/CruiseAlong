//
//  FormatUtilities.swift
//  Cruise Along
//
//  Created by Chad Rutherford on 2/27/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import Foundation

class FormatUtilities {
    static func formatDistance(meters: Double) -> String {
        var floatValue: Float = 0.0
        var intValue = 0
        var unit: String?
        var value = ""
        var combined = ""
        
        if !Locale.current.usesMetricSystem {
            let meters = Measurement(value: Double(meters), unit: UnitLength.meters)
            
            if meters.converted(to: UnitLength.feet).value <= 500 {
                intValue = Int(meters.converted(to: UnitLength.feet).value)
                unit = "ft"
            } else {
                floatValue = Float(meters.converted(to: UnitLength.miles).value)
                unit = "mi"
            }
        } else {
            if meters <= 500 {
                intValue = Int((meters > 0) ? meters : 1)
                unit = "m"
            } else {
                floatValue = Float(Measurement(value: Double(meters), unit: UnitLength.meters).converted(to: UnitLength.kilometers).value)
                unit = "km"
            }
        }
        
        if floatValue != 0.0 {
            var formatter: NumberFormatter?
            if formatter == nil {
                formatter = NumberFormatter()
                formatter?.maximumFractionDigits = 1
                formatter?.minimumIntegerDigits = 1
                formatter?.usesGroupingSeparator = true
                formatter?.groupingSize = 3
            }
            value = (formatter?.string(from: NSNumber(value: floatValue)))!
        } else {
            value = "\(intValue)"
        }
        
        combined = "\(value) " + unit!
        return combined
    }
}
