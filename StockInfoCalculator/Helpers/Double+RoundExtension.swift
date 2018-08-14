//
//  DoubleRoundExtension.swift
//  StockInfoCalculator
//
//  Created by Zachary Frew on 8/14/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import Foundation


extension Double {
//    Adds ability to round to a selected number of places.
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded()
    }
    
}
