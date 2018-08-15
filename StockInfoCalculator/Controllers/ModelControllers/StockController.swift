//
//  StockController.swift
//  StockInfoCalculator
//
//  Created by Zachary Frew on 8/14/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import Foundation

class StockController {
    
    // MARK: - Singleton
    static let shared = StockController()
    
    // MARK: - Methods
    func calculateEPS(_ stock: Stock) -> Double {
        return (stock.earnings / Double(stock.sharesOutstanding)).roundTo(places: 2)
    }
    
    func calculatePE(_ stock: Stock) -> Double {
        return (stock.price / calculateEPS(stock)).roundTo(places: 2)
    }
    
    func calculateMarketCap(_ stock: Stock) -> Double {
        return (stock.price * Double(stock.sharesOutstanding)).roundTo(places: 2)
    }
    
    func calculateCurrentRatio(_ stock: Stock) -> Double {
        return stock.currentAssets - stock.currentLiabilities
    }
    
}
