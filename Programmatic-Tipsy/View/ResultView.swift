//
//  ResultView.swift
//  Programmatic-Tipsy
//
//  Created by Doğukan Sakin on 26.03.2024.
//

import UIKit

protocol ResultViewDelegate:AnyObject {
    func reCalculateButtonTapped(_ sender:CustomButton)
}

class ResultView : UIView{
    let PADDING = 20.0
    
    weak var delegate:ResultViewDelegate?
    var perPersonTotalBill:Double?
    var bill:Bill!
    
    // MARK: - Custom Components
    
    let totalPerPersonUpperHeaderLabel = CustomLabel(text: "Total per person")
    let totalPerPersonBillLabel = CustomLabel(text: "0",color: UIColor(named: "Secondary"),fontSize: .systemFont(ofSize: 52, weight: .semibold))
    let descriptionLabel = CustomLabel(text: "Split between 2 people, with 10% tip.",color: .white,fontSize: .systemFont(ofSize: 24, weight: .semibold))
    let recalculateButton = CustomButton(title: "Recalculate")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.backgroundColor = UIColor(named: "MainDark")
        
        self.addSubview(upperContainer)
        self.addSubview(descriptionLabel)
        self.addSubview(recalculateButton)
        
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 2
        
        // Upper Container
        upperContainer.addArrangedSubview(totalPerPersonUpperHeaderLabel)
        upperContainer.addArrangedSubview(totalPerPersonBillLabel)
        
        //Button Press Action
        
        recalculateButton.action = reCalculateButtonTapped
        
        NSLayoutConstraint.activate([
            // Upper container
            upperContainer.topAnchor.constraint(equalTo: self.topAnchor),
            upperContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            upperContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            upperContainer.heightAnchor.constraint(equalToConstant: 200),
            
            //Upper container content
            totalPerPersonUpperHeaderLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            totalPerPersonBillLabel.topAnchor.constraint(equalTo: totalPerPersonUpperHeaderLabel.bottomAnchor),
       
            //Description Label
            descriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor,constant: PADDING),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor,constant: -PADDING),
            
            //Recalculate button
            recalculateButton.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -20),
            recalculateButton.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor,constant: PADDING),
            recalculateButton.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor,constant: -PADDING),
          
        
        ])
    }
    
    private let upperContainer:UIStackView = {
        let view = UIStackView()
        view.backgroundColor = UIColor(named: "MainDarkSecondary")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        return view
    }()
    
    func updateUI(withResult:Double,withBill:Bill){
        self.bill = withBill
        self.perPersonTotalBill = withResult
        
        totalPerPersonBillLabel.text = String(format: "%.2f",self.perPersonTotalBill ?? 0)
        descriptionLabel.text = "Split between \(self.bill.split) people, with \(Int(self.bill.tip * 100))% tip."
        
    }
    
    private func reCalculateButtonTapped(_ sender:CustomButton) {
         delegate?.reCalculateButtonTapped(sender)
    }
    
    
}


