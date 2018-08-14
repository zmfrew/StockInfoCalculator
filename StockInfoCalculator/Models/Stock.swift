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
    let price: Double
    let earnings: Double
    let sharesOutsanding: Int
    let currentAssets: Int
    let currentLiabilities: Int
    let isOverpriced: Bool
    
    // MARK: - Methods
    init(price: Double, earnings: Double, sharesOutstanding: Int, currentAssets: Int, currentLiabilities: Int, isOverpriced: Bool) {
        self.price = price
        self.earnings = earnings
        self.sharesOutsanding = sharesOutstanding
        self.currentAssets = currentAssets
        self.currentLiabilities = currentLiabilities
        self.isOverpriced = isOverpriced
    }
    
}
