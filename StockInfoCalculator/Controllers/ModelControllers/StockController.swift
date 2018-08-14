//
//  StockController.swift
//  StockInfoCalculator
//
//  Created by Zachary Frew on 8/14/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import Foundation

class StockController {
    
    // MARK: - Methods
    func calculateEPS(earnings: Double, sharesOutstanding: Int) -> Double {
        return (earnings / Double(sharesOutstanding)).roundTo(places: 2)
    }
    
    func calculatePE(price: Double, eps: Double) -> Double {
        return (price / eps).roundTo(places: 2)
    }
    
    func calculateMarketCap(price: Double, sharesOutstanding: Int) -> Double {
        return (price * Double(sharesOutstanding)).roundTo(places: 2)
    }
    
    func calculateCurrentRatio(currentAssets: Double, currentLiabilities: Double) -> Double {
        return currentAssets - currentLiabilities
    }
    
}
