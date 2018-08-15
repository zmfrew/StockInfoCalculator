//
//  ViewController.swift
//  StockInfoCalculator
//
//  Created by Zachary Frew on 8/14/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Top Section Properties
    let topSectionView = UIView()
    let topSectionStackView = UIStackView()
    
    let tickerLabel = UILabel()
    let tickerTextField = UITextField()
    let tickerStackView = UIStackView()
    
    let priceLabel = UILabel()
    let priceTextField = UITextField()
    let priceStackView = UIStackView()
    
    let earningsLabel = UILabel()
    let earningsTextField = UITextField()
    let earningsStackView = UIStackView()
    
    let sharesOutstandingLabel = UILabel()
    let sharesOutstandingTextField = UITextField()
    let sharesOutstandingStackView = UIStackView()
    
    let currentAssetsLabel = UILabel()
    let currentAssetsTextField = UITextField()
    let currentAssetsStackView = UIStackView()
    
    let currentLiabilitiesLabel = UILabel()
    let currentLiabilitiesTextField = UITextField()
    let currentLiabilitiesStackView = UIStackView()
    
    let calculateButton = UIButton()
    
    // MARK: - Bottom Section Properties
    let bottomSectionView = UIView()
    let bottomSectionStackView = UIStackView()
    
    let bottomTickerLabel = UILabel()
    
    let priceToEarningsNameLabel = UILabel()
    let priceToEarningsDisplayLabel = UILabel()
    let priceToEarningsStackView = UIStackView()
    
    let marketCapNameLabel = UILabel()
    let marketCapLabelDisplayLabel = UILabel()
    let marketCapStackView = UIStackView()
    
    let earningsPerShareNameLabel = UILabel()
    let earningsPerShareDisplayLabel = UILabel()
    let earningsPerShareStackView = UIStackView()
    
    let currentRatioNameLabel = UILabel()
    let currentRatioDisplayLabel = UILabel()
    let currentRatioStackView = UIStackView()
    
    let isGoodPriceLabel = UILabel()
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setUpSections()
    }

    // MARK: - Methods
    
    // MARK: - Set Up Sections
    func setUpSections() {
        setUpTopSection()
        setUpBottomSection()
    }
    
    // MARK: - Set Up Top Section
    func setUpTopSection() {
        view.addSubview(topSectionView)
        topSectionView.backgroundColor = UIColor.lightGray
        topSectionView.translatesAutoresizingMaskIntoConstraints = false
        topSectionView.clipsToBounds = true
        topSectionView.layer.cornerRadius = 4
        
        view.addSubview(topSectionStackView)
        topSectionStackView.translatesAutoresizingMaskIntoConstraints = false
        
        topSectionStackView.axis = .vertical
        topSectionStackView.distribution = .fillEqually
        topSectionStackView.alignment = .fill
        topSectionStackView.spacing = 16.0
        topSectionStackView.addArrangedSubview(tickerStackView)
        setUpTicker()
        topSectionStackView.addArrangedSubview(priceStackView)
        setUpPrice()
        topSectionStackView.addArrangedSubview(earningsStackView)
        setUpEarnings()
        topSectionStackView.addArrangedSubview(sharesOutstandingStackView)
        setUpSharesOutstanding()
        topSectionStackView.addArrangedSubview(currentAssetsStackView)
        setUpCurrentAssets()
        topSectionStackView.addArrangedSubview(currentLiabilitiesStackView)
        setUpCurrentLiabilities()
        topSectionStackView.addArrangedSubview(calculateButton)
        setUpCalculateButton()
        
        NSLayoutConstraint(item: topSectionView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 32.0).isActive = true
        NSLayoutConstraint(item: topSectionView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 32.0).isActive = true
        NSLayoutConstraint(item: topSectionView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -32.0).isActive = true
        NSLayoutConstraint(item: topSectionView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 0.60, constant: -32.0).isActive = true
        
        topSectionStackView.heightAnchor.constraint(equalTo: topSectionView.heightAnchor, multiplier: 0.9).isActive = true
        topSectionStackView.widthAnchor.constraint(equalTo: topSectionView.widthAnchor, multiplier: 0.9).isActive = true
        
        topSectionStackView.centerXAnchor.constraint(equalTo: topSectionView.centerXAnchor).isActive = true
        topSectionStackView.centerYAnchor.constraint(equalTo: topSectionView.centerYAnchor).isActive = true
    }
    
    func setUpTicker() {
        tickerStackView.translatesAutoresizingMaskIntoConstraints = false
        tickerStackView.axis = .horizontal
        tickerStackView.distribution = .fillEqually
        tickerStackView.alignment = .fill
        tickerStackView.spacing = 16.0
        tickerStackView.addArrangedSubview(tickerLabel)
        tickerStackView.addArrangedSubview(tickerTextField)
        
        tickerLabel.backgroundColor = UIColor.white
        tickerLabel.text = "Ticker:"
        tickerLabel.clipsToBounds = true
        tickerLabel.layer.cornerRadius = 4
        tickerTextField.borderStyle = UITextBorderStyle.roundedRect
        tickerTextField.keyboardType = .numberPad
        tickerTextField.font = UIFont.systemFont(ofSize: 15)
        tickerTextField.backgroundColor = UIColor.white
        tickerTextField.placeholder = "Enter stock ticker..."
    }
    
    func setUpPrice() {
        priceStackView.translatesAutoresizingMaskIntoConstraints = false
        priceStackView.axis = .horizontal
        priceStackView.distribution = .fillEqually
        priceStackView.alignment = .fill
        priceStackView.spacing = 16.0
        priceStackView.addArrangedSubview(priceLabel)
        priceStackView.addArrangedSubview(priceTextField)
        
        priceLabel.backgroundColor = UIColor.white
        priceLabel.text = "Price:"
        priceLabel.clipsToBounds = true
        priceLabel.layer.cornerRadius = 4
        priceTextField.backgroundColor = UIColor.white
        priceTextField.borderStyle = UITextBorderStyle.roundedRect
        priceTextField.keyboardType = .numberPad
        priceTextField.font = UIFont.systemFont(ofSize: 15)
        priceTextField.placeholder = "Enter stock price..."
    }
    
    func setUpEarnings() {
        earningsStackView.translatesAutoresizingMaskIntoConstraints = false
        earningsStackView.axis = .horizontal
        earningsStackView.distribution = .fillEqually
        earningsStackView.alignment = .fill
        earningsStackView.spacing = 16.0
        earningsStackView.addArrangedSubview(earningsLabel)
        earningsStackView.addArrangedSubview(earningsTextField)
        
        earningsLabel.backgroundColor = UIColor.white
        earningsLabel.text = "Earnings:"
        earningsLabel.clipsToBounds = true
        earningsLabel.layer.cornerRadius = 4
        earningsTextField.borderStyle = UITextBorderStyle.roundedRect
        earningsTextField.keyboardType = .numberPad
        earningsTextField.font = UIFont.systemFont(ofSize: 15)
        earningsTextField.backgroundColor = UIColor.white
        earningsTextField.placeholder = "Enter annual earnings..."
    }
    
    func setUpSharesOutstanding() {
        sharesOutstandingStackView.translatesAutoresizingMaskIntoConstraints = false
        sharesOutstandingStackView.axis = .horizontal
        sharesOutstandingStackView.distribution = .fillEqually
        sharesOutstandingStackView.alignment = .fill
        sharesOutstandingStackView.spacing = 16.0
        sharesOutstandingStackView.addArrangedSubview(sharesOutstandingLabel)
        sharesOutstandingStackView.addArrangedSubview(sharesOutstandingTextField)
        
        sharesOutstandingLabel.backgroundColor = UIColor.white
        sharesOutstandingLabel.text = "Common Stock:"
        sharesOutstandingLabel.clipsToBounds = true
        sharesOutstandingLabel.layer.cornerRadius = 4
        sharesOutstandingTextField.borderStyle = UITextBorderStyle.roundedRect
        sharesOutstandingTextField.keyboardType = .numberPad
        sharesOutstandingTextField.font = UIFont.systemFont(ofSize: 15)
        sharesOutstandingTextField.backgroundColor = UIColor.white
        sharesOutstandingTextField.placeholder = "Enter shares outstanding..."
    }
    
    func setUpCurrentAssets() {
        currentAssetsStackView.translatesAutoresizingMaskIntoConstraints = false
        currentAssetsStackView.axis = .horizontal
        currentAssetsStackView.distribution = .fillEqually
        currentAssetsStackView.alignment = .fill
        currentAssetsStackView.spacing = 16.0
        currentAssetsStackView.addArrangedSubview(currentAssetsLabel)
        currentAssetsStackView.addArrangedSubview(currentAssetsTextField)
        
        currentAssetsLabel.backgroundColor = UIColor.white
        currentAssetsLabel.text = "Current Assets:"
        currentAssetsLabel.clipsToBounds = true
        currentAssetsLabel.layer.cornerRadius = 4
        currentAssetsTextField.borderStyle = UITextBorderStyle.roundedRect
        currentAssetsTextField.keyboardType = .numberPad
        currentAssetsTextField.font = UIFont.systemFont(ofSize: 15)
        currentAssetsTextField.backgroundColor = UIColor.white
        currentAssetsTextField.placeholder = "Enter current assets..."
    }
    
    func setUpCurrentLiabilities() {
        currentLiabilitiesStackView.translatesAutoresizingMaskIntoConstraints = false
        currentLiabilitiesStackView.axis = .horizontal
        currentLiabilitiesStackView.distribution = .fillEqually
        currentLiabilitiesStackView.alignment = .fill
        currentLiabilitiesStackView.spacing = 16.0
        currentLiabilitiesStackView.addArrangedSubview(currentLiabilitiesLabel)
        currentLiabilitiesStackView.addArrangedSubview(currentLiabilitiesTextField)
        
        currentLiabilitiesLabel.backgroundColor = UIColor.white
        currentLiabilitiesLabel.text = "Current Liabilities:"
        currentLiabilitiesLabel.clipsToBounds = true
        currentLiabilitiesLabel.layer.cornerRadius = 4
        currentLiabilitiesTextField.borderStyle = UITextBorderStyle.roundedRect
        currentLiabilitiesTextField.keyboardType = .numberPad
        currentLiabilitiesTextField.font = UIFont.systemFont(ofSize: 15)
        currentLiabilitiesTextField.backgroundColor = UIColor.white
        currentLiabilitiesTextField.placeholder = "Enter current liabilities..."
    }
    
    func setUpCalculateButton() {
        calculateButton.backgroundColor = UIColor.darkGray
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 4
    }
    
    @objc func calculate() {
        guard let ticker = tickerTextField.text, !ticker.isEmpty, ticker != " ",
            let price = priceTextField.text, !price.isEmpty, price != " ",
            let priceDouble = Double(price),
            let earnings = earningsTextField.text, !earnings.isEmpty, earnings != " ",
            let earningsDouble = Double(earnings),
            let sharesOutstanding = sharesOutstandingTextField.text, !sharesOutstanding.isEmpty, sharesOutstanding != " ",
            let sharesOutstandingInt = Int(sharesOutstanding),
            let currentAssets = currentAssetsTextField.text, !currentAssets.isEmpty, currentAssets != " ",
            let currentAssetsDouble = Double(currentAssets),
            let currentLiabilities = currentLiabilitiesTextField.text, !currentLiabilities.isEmpty, currentLiabilities != " ",
            let currentLiabilitiesDouble = Double(currentLiabilities)
            else { return presentErrorAlert() }
        
        let stock = Stock(ticker: ticker, price: priceDouble, earnings: earningsDouble, sharesOutstanding: sharesOutstandingInt, currentAssets:  currentAssetsDouble, currentLiabilities: currentLiabilitiesDouble)
        
            updateBottomViews(stock)
    }
    
    func presentErrorAlert() {
        let alert = UIAlertController(title: "Oops!", message: "Please ensure all fields are completed before calculating.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func updateBottomViews(_ stock: Stock) {
        bottomTickerLabel.text = stock.ticker.capitalized
        priceToEarningsDisplayLabel.text = "\(StockController.shared.calculatePE(stock))"
        marketCapLabelDisplayLabel.text = "\(StockController.shared.calculateMarketCap(stock).addCommas())"
        earningsPerShareDisplayLabel.text = "\(StockController.shared.calculateEPS(stock).addCommas())"
        currentRatioDisplayLabel.text = "\(StockController.shared.calculateCurrentRatio(stock))"
        isGoodPriceLabel.text = stock.isGoodPrice ? "This stock may be priced well." : "This stock may be overpriced."
    }
    
    // MARK: - Set Up Bottom Section
    func setUpBottomSection() {
        view.addSubview(bottomSectionView)
        bottomSectionView.backgroundColor = UIColor.lightGray
        bottomSectionView.translatesAutoresizingMaskIntoConstraints = false
        bottomSectionView.clipsToBounds = true
        bottomSectionView.layer.cornerRadius = 4
        
        view.addSubview(bottomSectionStackView)
        bottomSectionStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomSectionStackView.axis = .vertical
        bottomSectionStackView.distribution = .fillEqually
        bottomSectionStackView.alignment = .fill
        bottomSectionStackView.spacing = 16.0
        bottomSectionStackView.addArrangedSubview(bottomTickerLabel)
        setUpBottomTicker()
        bottomSectionStackView.addArrangedSubview(priceToEarningsStackView)
        setUpPriceToEarnings()
        bottomSectionStackView.addArrangedSubview(marketCapStackView)
        setUpMarketCap()
        bottomSectionStackView.addArrangedSubview(earningsPerShareStackView)
        setUpEarningsPerShare()
        bottomSectionStackView.addArrangedSubview(currentRatioStackView)
        setUpCurrentRatio()
        bottomSectionStackView.addArrangedSubview(isGoodPriceLabel)
        setUpIsGoodPrice()
        
        NSLayoutConstraint(item: bottomSectionView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 32.0).isActive = true
        NSLayoutConstraint(item: bottomSectionView, attribute: .top, relatedBy: .equal, toItem: topSectionView, attribute: .bottom, multiplier: 1, constant: 32.0).isActive = true
        NSLayoutConstraint(item: bottomSectionView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -32.0).isActive = true
        NSLayoutConstraint(item: bottomSectionView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -32.0).isActive = true
        
        bottomSectionStackView.heightAnchor.constraint(equalTo: bottomSectionView.heightAnchor, multiplier: 0.9).isActive = true
        bottomSectionStackView.widthAnchor.constraint(equalTo: bottomSectionView.widthAnchor, multiplier: 0.9).isActive = true
        
        bottomSectionStackView.centerXAnchor.constraint(equalTo: bottomSectionView.centerXAnchor).isActive = true
        bottomSectionStackView.centerYAnchor.constraint(equalTo: bottomSectionView.centerYAnchor).isActive = true
    }
    
    func setUpBottomTicker() {
        bottomTickerLabel.textAlignment = .center
        bottomTickerLabel.backgroundColor = UIColor.white
        bottomTickerLabel.clipsToBounds = true
        bottomTickerLabel.layer.cornerRadius = 4
    }
    
    func setUpPriceToEarnings() {
        priceToEarningsStackView.translatesAutoresizingMaskIntoConstraints = false
        priceToEarningsStackView.axis = .horizontal
        priceToEarningsStackView.distribution = .fillEqually
        priceToEarningsStackView.alignment = .fill
        priceToEarningsStackView.spacing = 16.0
        priceToEarningsStackView.addArrangedSubview(priceToEarningsNameLabel)
        priceToEarningsStackView.addArrangedSubview(priceToEarningsDisplayLabel)
        
        priceToEarningsNameLabel.backgroundColor = UIColor.white
        priceToEarningsNameLabel.text = "Price/Earnings:"
        priceToEarningsNameLabel.clipsToBounds = true
        priceToEarningsNameLabel.layer.cornerRadius = 4
        priceToEarningsDisplayLabel.backgroundColor = UIColor.white
//        priceToEarningsDisplayLabel.text = stock.calculateEPS
        priceToEarningsDisplayLabel.clipsToBounds = true
        priceToEarningsDisplayLabel.layer.cornerRadius = 4

    }

    func setUpMarketCap() {
        marketCapStackView.translatesAutoresizingMaskIntoConstraints = false
        marketCapStackView.axis = .horizontal
        marketCapStackView.distribution = .fillEqually
        marketCapStackView.alignment = .fill
        marketCapStackView.spacing = 16.0
        marketCapStackView.addArrangedSubview(marketCapNameLabel)
        marketCapStackView.addArrangedSubview(marketCapLabelDisplayLabel)
        
        marketCapNameLabel.backgroundColor = UIColor.white
        marketCapNameLabel.text = "Market Cap:"
        marketCapNameLabel.clipsToBounds = true
        marketCapNameLabel.layer.cornerRadius = 4
        marketCapLabelDisplayLabel.backgroundColor = UIColor.white
        //        marketCapLabelDisplayLabel = stock.calculateMarketCap
        marketCapLabelDisplayLabel.clipsToBounds = true
        marketCapLabelDisplayLabel.layer.cornerRadius = 4
    }
    
    func setUpEarningsPerShare() {
        earningsPerShareStackView.translatesAutoresizingMaskIntoConstraints = false
        earningsPerShareStackView.axis = .horizontal
        earningsPerShareStackView.distribution = .fillEqually
        earningsPerShareStackView.alignment = .fill
        earningsPerShareStackView.spacing = 16.0
        earningsPerShareStackView.addArrangedSubview(earningsPerShareNameLabel)
        earningsPerShareStackView.addArrangedSubview(earningsPerShareDisplayLabel)
        
        earningsPerShareNameLabel.backgroundColor = UIColor.white
        earningsPerShareNameLabel.text = "EPS:"
        earningsPerShareNameLabel.clipsToBounds = true
        earningsPerShareNameLabel.layer.cornerRadius = 4
        earningsPerShareDisplayLabel.backgroundColor = UIColor.white
        //        earningsPerShareDisplayLabel = stock.calculateMarketCap
        earningsPerShareDisplayLabel.clipsToBounds = true
        earningsPerShareDisplayLabel.layer.cornerRadius = 4
    }
    
    func setUpCurrentRatio() {
        currentRatioStackView.translatesAutoresizingMaskIntoConstraints = false
        currentRatioStackView.axis = .horizontal
        currentRatioStackView.distribution = .fillEqually
        currentRatioStackView.alignment = .fill
        currentRatioStackView.spacing = 16.0
        currentRatioStackView.addArrangedSubview(currentRatioNameLabel)
        currentRatioStackView.addArrangedSubview(currentRatioDisplayLabel)
        
        currentRatioNameLabel.backgroundColor = UIColor.white
        currentRatioNameLabel.text = "Current Ratio:"
        currentRatioNameLabel.clipsToBounds = true
        currentRatioNameLabel.layer.cornerRadius = 4
        currentRatioDisplayLabel.backgroundColor = UIColor.white
        //        currentRatioDisplayLabel = stock.calculateMarketCap
        currentRatioDisplayLabel.clipsToBounds = true
        currentRatioDisplayLabel.layer.cornerRadius = 4
    }
    
    func setUpIsGoodPrice() {
        isGoodPriceLabel.backgroundColor = UIColor.white
        isGoodPriceLabel.clipsToBounds = true
        isGoodPriceLabel.layer.cornerRadius = 4
        isGoodPriceLabel.textAlignment = .center
    }
    
}

