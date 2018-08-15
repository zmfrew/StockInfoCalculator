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
    
    // MARK: - Color Properties
    let greenColor = UIColor(red: 65/255, green: 172/255, blue: 65/255, alpha: 1)
    let blackColor = UIColor(red: 27/255, green: 27/255, blue: 30/255, alpha: 1)
    let redColor = UIColor(red: 255/255, green: 44/255, blue: 44/255, alpha: 1)
    let whiteColor = UIColor(red: 226/255, green: 225/255, blue: 212/255, alpha: 1)
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIGraphicsBeginImageContext(view.frame.size)
        UIImage(named: "gradient")?.draw(in: view.bounds)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        view.backgroundColor = UIColor(patternImage: image)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            UIView.animate(withDuration: 1.0, animations: {
                self.setUpTopSection()
            })
        }
    }
    
    // MARK: - Set Up Top Section
    func setUpTopSection() {
        view.addSubview(topSectionView)
        topSectionView.backgroundColor = UIColor.darkGray
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
        
        tickerLabel.backgroundColor = blackColor
        tickerLabel.textColor = greenColor
        tickerLabel.font = UIFont.boldSystemFont(ofSize: 16)
        tickerLabel.text = "Ticker:"
        tickerLabel.clipsToBounds = true
        tickerLabel.layer.cornerRadius = 4
        tickerTextField.borderStyle = UITextBorderStyle.roundedRect
        tickerTextField.keyboardType = .numberPad
        tickerTextField.font = UIFont.systemFont(ofSize: 14)
        tickerTextField.backgroundColor = blackColor
        tickerTextField.textColor = greenColor
        tickerTextField.attributedPlaceholder = NSAttributedString(string: "Enter stock ticker...", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
    }
    
    func setUpPrice() {
        priceStackView.translatesAutoresizingMaskIntoConstraints = false
        priceStackView.axis = .horizontal
        priceStackView.distribution = .fillEqually
        priceStackView.alignment = .fill
        priceStackView.spacing = 16.0
        priceStackView.addArrangedSubview(priceLabel)
        priceStackView.addArrangedSubview(priceTextField)
        
        priceLabel.backgroundColor = blackColor
        priceLabel.textColor = greenColor
        priceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        priceLabel.text = "Price:"
        priceLabel.clipsToBounds = true
        priceLabel.layer.cornerRadius = 4
        priceTextField.backgroundColor = blackColor
        priceTextField.textColor = greenColor
        priceTextField.borderStyle = UITextBorderStyle.roundedRect
        priceTextField.keyboardType = .numberPad
        priceTextField.font = UIFont.systemFont(ofSize: 14)
        priceTextField.attributedPlaceholder = NSAttributedString(string: "Enter stock price...", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
    }
    
    func setUpEarnings() {
        earningsStackView.translatesAutoresizingMaskIntoConstraints = false
        earningsStackView.axis = .horizontal
        earningsStackView.distribution = .fillEqually
        earningsStackView.alignment = .fill
        earningsStackView.spacing = 16.0
        earningsStackView.addArrangedSubview(earningsLabel)
        earningsStackView.addArrangedSubview(earningsTextField)
        
        earningsLabel.backgroundColor = blackColor
        earningsLabel.textColor = greenColor
        earningsLabel.font = UIFont.boldSystemFont(ofSize: 16)
        earningsLabel.text = "Earnings:"
        earningsLabel.clipsToBounds = true
        earningsLabel.layer.cornerRadius = 4
        earningsTextField.borderStyle = UITextBorderStyle.roundedRect
        earningsTextField.keyboardType = .numberPad
        earningsTextField.font = UIFont.systemFont(ofSize: 14)
        earningsTextField.backgroundColor = blackColor
        earningsTextField.textColor = greenColor
        earningsTextField.attributedPlaceholder = NSAttributedString(string: "Enter annual earnings...", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
    }
    
    func setUpSharesOutstanding() {
        sharesOutstandingStackView.translatesAutoresizingMaskIntoConstraints = false
        sharesOutstandingStackView.axis = .horizontal
        sharesOutstandingStackView.distribution = .fillEqually
        sharesOutstandingStackView.alignment = .fill
        sharesOutstandingStackView.spacing = 16.0
        sharesOutstandingStackView.addArrangedSubview(sharesOutstandingLabel)
        sharesOutstandingStackView.addArrangedSubview(sharesOutstandingTextField)
        
        sharesOutstandingLabel.backgroundColor = blackColor
        sharesOutstandingLabel.textColor = greenColor
        sharesOutstandingLabel.font = UIFont.boldSystemFont(ofSize: 16)
        sharesOutstandingLabel.text = "Common Stock:"
        sharesOutstandingLabel.clipsToBounds = true
        sharesOutstandingLabel.layer.cornerRadius = 4
        sharesOutstandingTextField.borderStyle = UITextBorderStyle.roundedRect
        sharesOutstandingTextField.keyboardType = .numberPad
        sharesOutstandingTextField.font = UIFont.systemFont(ofSize: 14)
        sharesOutstandingTextField.backgroundColor = blackColor
        sharesOutstandingTextField.textColor = greenColor
        sharesOutstandingTextField.attributedPlaceholder = NSAttributedString(string: "Enter shares outstanding...", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
    }
    
    func setUpCurrentAssets() {
        currentAssetsStackView.translatesAutoresizingMaskIntoConstraints = false
        currentAssetsStackView.axis = .horizontal
        currentAssetsStackView.distribution = .fillEqually
        currentAssetsStackView.alignment = .fill
        currentAssetsStackView.spacing = 16.0
        currentAssetsStackView.addArrangedSubview(currentAssetsLabel)
        currentAssetsStackView.addArrangedSubview(currentAssetsTextField)
        
        currentAssetsLabel.backgroundColor = blackColor
        currentAssetsLabel.textColor = greenColor
        currentAssetsLabel.font = UIFont.boldSystemFont(ofSize: 16)
        currentAssetsLabel.text = "Current Assets:"
        currentAssetsLabel.clipsToBounds = true
        currentAssetsLabel.layer.cornerRadius = 4
        currentAssetsTextField.borderStyle = UITextBorderStyle.roundedRect
        currentAssetsTextField.keyboardType = .numberPad
        currentAssetsTextField.font = UIFont.systemFont(ofSize: 14)
        currentAssetsTextField.backgroundColor = blackColor
        currentAssetsTextField.textColor = greenColor
        currentAssetsTextField.attributedPlaceholder = NSAttributedString(string: "Enter current assets...", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
    }
    
    func setUpCurrentLiabilities() {
        currentLiabilitiesStackView.translatesAutoresizingMaskIntoConstraints = false
        currentLiabilitiesStackView.axis = .horizontal
        currentLiabilitiesStackView.distribution = .fillEqually
        currentLiabilitiesStackView.alignment = .fill
        currentLiabilitiesStackView.spacing = 16.0
        currentLiabilitiesStackView.addArrangedSubview(currentLiabilitiesLabel)
        currentLiabilitiesStackView.addArrangedSubview(currentLiabilitiesTextField)
        
        currentLiabilitiesLabel.backgroundColor = blackColor
        currentLiabilitiesLabel.textColor = greenColor
        currentLiabilitiesLabel.font = UIFont.boldSystemFont(ofSize: 16)
        currentLiabilitiesLabel.text = "Current Liabilities:"
        currentLiabilitiesLabel.clipsToBounds = true
        currentLiabilitiesLabel.layer.cornerRadius = 4
        currentLiabilitiesTextField.borderStyle = UITextBorderStyle.roundedRect
        currentLiabilitiesTextField.keyboardType = .numberPad
        currentLiabilitiesTextField.font = UIFont.systemFont(ofSize: 14)
        currentLiabilitiesTextField.backgroundColor = blackColor
        currentLiabilitiesTextField.textColor = greenColor
        currentLiabilitiesTextField.placeholder = "Enter current liabilities..."
        currentLiabilitiesTextField.attributedPlaceholder = NSAttributedString(string: "Enter current liabilities...", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
    }
    
    func setUpCalculateButton() {
        calculateButton.backgroundColor = blackColor
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 4
    }
    
    @objc func calculate() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            UIView.animate(withDuration: 1.0, animations: {
                self.calculateButton.backgroundColor = UIColor.darkGray
            })
        }
    
        
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
            else {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    UIView.animate(withDuration: 1.0, animations: {
                        self.calculateButton.backgroundColor = self.blackColor
                    })
                }
                return presentErrorAlert()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            UIView.animate(withDuration: 1.0, animations: {
                self.setUpBottomSection()
                self.calculateButton.backgroundColor = self.blackColor
            })
        }
        
        
        let stock = Stock(ticker: ticker, price: priceDouble, earnings: earningsDouble, sharesOutstanding: sharesOutstandingInt, currentAssets:  currentAssetsDouble, currentLiabilities: currentLiabilitiesDouble)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            UIView.animate(withDuration: 0.5, animations: {
                self.updateBottomViews(stock)
            })
        }
        
    }
    
    func presentErrorAlert() {
        let alert = UIAlertController(title: "Oops!", message: "Please ensure all fields are completed before calculating.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        calculateButton.backgroundColor = UIColor.black
        present(alert, animated: true, completion: nil)
    }
    
    func updateBottomViews(_ stock: Stock) {
        bottomTickerLabel.text = stock.ticker.uppercased()
        priceToEarningsDisplayLabel.text = "\(StockController.shared.calculatePE(stock))"
        marketCapLabelDisplayLabel.text = "\(StockController.shared.calculateMarketCap(stock).addCommas())"
        earningsPerShareDisplayLabel.text = "\(StockController.shared.calculateEPS(stock).addCommas())"
        currentRatioDisplayLabel.text = "\(StockController.shared.calculateCurrentRatio(stock))"
        isGoodPriceLabel.text = stock.isGoodPrice ? "This stock may be priced well." : "This stock may be overpriced."
        isGoodPriceLabel.textColor = stock.isGoodPrice ? greenColor : redColor
        calculateButton.backgroundColor = UIColor.black
    }
    
    // MARK: - Set Up Bottom Section
    func setUpBottomSection() {
        view.addSubview(bottomSectionView)
        bottomSectionView.backgroundColor = UIColor.darkGray
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
        bottomTickerLabel.backgroundColor = blackColor
        bottomTickerLabel.textColor = greenColor
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
        
        priceToEarningsNameLabel.backgroundColor = blackColor
        priceToEarningsNameLabel.textColor = greenColor
        priceToEarningsNameLabel.text = "Price/Earnings:"
        priceToEarningsNameLabel.clipsToBounds = true
        priceToEarningsNameLabel.layer.cornerRadius = 4
        priceToEarningsDisplayLabel.backgroundColor = blackColor
        priceToEarningsDisplayLabel.textColor = greenColor
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
        
        marketCapNameLabel.backgroundColor = blackColor
        marketCapNameLabel.textColor = greenColor
        marketCapNameLabel.text = "Market Cap:"
        marketCapNameLabel.clipsToBounds = true
        marketCapNameLabel.layer.cornerRadius = 4
        marketCapLabelDisplayLabel.backgroundColor = blackColor
        marketCapLabelDisplayLabel.textColor = greenColor
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
        
        earningsPerShareNameLabel.backgroundColor = blackColor
        earningsPerShareNameLabel.textColor = greenColor
        earningsPerShareNameLabel.text = "EPS:"
        earningsPerShareNameLabel.clipsToBounds = true
        earningsPerShareNameLabel.layer.cornerRadius = 4
        earningsPerShareDisplayLabel.backgroundColor = blackColor
        earningsPerShareDisplayLabel.textColor = greenColor
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
        
        currentRatioNameLabel.backgroundColor = blackColor
        currentRatioNameLabel.textColor = greenColor
        currentRatioNameLabel.text = "Current Ratio:"
        currentRatioNameLabel.clipsToBounds = true
        currentRatioNameLabel.layer.cornerRadius = 4
        currentRatioDisplayLabel.backgroundColor = blackColor
        currentRatioDisplayLabel.textColor = greenColor
        currentRatioDisplayLabel.clipsToBounds = true
        currentRatioDisplayLabel.layer.cornerRadius = 4
    }
    
    func setUpIsGoodPrice() {
        isGoodPriceLabel.backgroundColor = blackColor
        isGoodPriceLabel.clipsToBounds = true
        isGoodPriceLabel.layer.cornerRadius = 4
        isGoodPriceLabel.textAlignment = .center
    }
    
}

