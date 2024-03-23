//
//  CalculateView.swift
//  Programmatic-Tipsy
//
//  Created by Doğukan Sakin on 23.03.2024.
//

import UIKit

class CalculateView:UIView{
    let PADDING = 20.0
    
    // MARK: - Custom Components
    
    // Bill Input
    let enterBillUpperPlaceHolder = CustomLabel(text:"Enter bill total")
    let billInput = CustomInput(placeholder: "e.g. 123.56")
    
    // Select Tip
    let selectTipUpperPlaceHolder = CustomLabel(text:"Select tip")
    let percentageButtonContainer = CustomHorizontalContainer()
    let zeroPercentage = CustomButton(title: "0%")
    let tenPercentage = CustomButton(title: "10%")
    let twentyPercentage = CustomButton(title: "20%")
    
    // Split Stepper
    let chooseSplitUpperPlaceHolder = CustomLabel(text:"Choose split")
    let splitContainer = CustomHorizontalContainer()
    let splitStepper = CustomStepper()
    let splitLabel = CustomLabel(text:"1",color:.white)
    
    let calculateButton = CustomButton(title: "Calculate")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.backgroundColor = UIColor(named: "MainDark")
        self.addSubview(enterBillUpperPlaceHolder)
        self.addSubview(billInput)
        self.addSubview(innerContainer)
        self.addSubview(splitContainer)

        // Bottom inner container
        innerContainer.addSubview(selectTipUpperPlaceHolder)
        innerContainer.addSubview(percentageButtonContainer)
        innerContainer.addSubview(chooseSplitUpperPlaceHolder)
        innerContainer.addSubview(splitStepper)
        innerContainer.addSubview(calculateButton)
        
        // Percentage Buttons Container
        percentageButtonContainer.addArrangedSubview(zeroPercentage)
        percentageButtonContainer.addArrangedSubview(tenPercentage)
        percentageButtonContainer.addArrangedSubview(twentyPercentage)
        
        // Split Stepper Container
        
        splitContainer.addArrangedSubview(splitLabel)
        splitContainer.addArrangedSubview(splitStepper)
        splitLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            // Bill input
            enterBillUpperPlaceHolder.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            enterBillUpperPlaceHolder.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            enterBillUpperPlaceHolder.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: PADDING),
            billInput.topAnchor.constraint(equalTo: enterBillUpperPlaceHolder.bottomAnchor,constant: 30),
            billInput.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Inner container
            innerContainer.topAnchor.constraint(equalTo: billInput.bottomAnchor, constant: 30),
            innerContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            innerContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            innerContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            // Select Tip
            selectTipUpperPlaceHolder.topAnchor.constraint(equalTo: innerContainer.topAnchor,constant: 20),
            selectTipUpperPlaceHolder.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            selectTipUpperPlaceHolder.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: PADDING),
            
            // Percentage Buttons Container
            percentageButtonContainer.topAnchor.constraint(equalTo: selectTipUpperPlaceHolder.bottomAnchor,constant: 30),
            percentageButtonContainer.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor,constant: PADDING),
            percentageButtonContainer.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor,constant: -PADDING),
            
            // Split Stepper
            chooseSplitUpperPlaceHolder.topAnchor.constraint(equalTo: percentageButtonContainer.bottomAnchor, constant: 40),
            chooseSplitUpperPlaceHolder.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            chooseSplitUpperPlaceHolder.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: PADDING),
            splitContainer.topAnchor.constraint(equalTo: chooseSplitUpperPlaceHolder.bottomAnchor,constant: 20),
            splitContainer.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor,constant: PADDING),
            splitContainer.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor,constant: -PADDING),
            
            calculateButton.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: 20),
            calculateButton.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor,constant: PADDING),
            calculateButton.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor,constant: -PADDING),
            
            
        ])
    }
    
    
    private let innerContainer:UIStackView = {
        let view = UIStackView()
        view.backgroundColor = UIColor(named: "MainDarkSecondary")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    


    
    
}
