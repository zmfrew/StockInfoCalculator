//
//  Double+CommasExtension.swift
//  StockInfoCalculator
//
//  Created by Zachary Frew on 8/14/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import Foundation

extension Double {
    //    Add commas to a Double.
    func addCommas() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        guard let numberString = formatter.string(from: NSNumber(value: self)) else { return "Error occurred in formatting number" }
        return numberString
    }
    
}
