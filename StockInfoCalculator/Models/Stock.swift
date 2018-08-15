//
//  Stock.swift
//  StockInfoCalculator
//
//  Created by Zachary Frew on 8/14/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import Foundation

class Stock {
    
    // MARK: - Properties
    let ticker: String
    let price: Double
    let earnings: Double
    let sharesOutstanding: Int
    let currentAssets: Double
    let currentLiabilities: Double
    let isGoodPrice: Bool
    
    // MARK: - Methods
    init(ticker: String, price: Double, earnings: Double, sharesOutstanding: Int, currentAssets: Double, currentLiabilities: Double) {
        self.ticker = ticker
        self.price = price
        self.earnings = earnings
        self.sharesOutstanding = sharesOutstanding
        self.currentAssets = currentAssets
        self.currentLiabilities = currentLiabilities
        self.isGoodPrice = (self.price / (self.earnings / Double(self.sharesOutstanding))) >= 30 ? false : true
    }
    
}
