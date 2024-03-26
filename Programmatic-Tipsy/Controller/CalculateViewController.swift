//
//  CalculateViewController.swift
//  Programmatic-Tipsy
//
//  Created by Doğukan Sakin on 23.03.2024.
//

import UIKit

class CalculateViewController : UIViewController{
    private var calculateView:CalculateView!
    var selectedTip:Double! = 0.0
    let billBrain = BillBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        calculateView = CalculateView(frame: view.bounds)
        calculateView.delegate = self
        view.addSubview(calculateView)
    }
    
    
}

extension CalculateViewController:CalculateViewDelegate{
    func didChangeStepperValue(_ sender: CustomStepper) {
        calculateView.splitLabel.text = "\(Int(sender.value))"
    }
    
    func didTapPercentageButton(_ sender: CustomButton) {
        selectedTip = (Double(sender.currentTitle?.replacingOccurrences(of: "%", with: "") ?? "0.0") ?? 0.0) / 100
    }
    
    func didTapCalculateButton(_ sender:CustomButton) {
        guard let safeBill = calculateView.billInput.text else {return}
        guard !safeBill.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {return}
        let totalBill = Double(safeBill)!
        let selectedSplit = Int(calculateView.splitStepper.value)
        let bill = Bill(total: totalBill, tip: selectedTip, split: selectedSplit)
        let result = billBrain.calculateAmountPerPerson(bill)
        
        let resultVC = ResultViewController()
  
        resultVC.bill = bill
        resultVC.result = result
        
      
        navigationController?.pushViewController(resultVC, animated: true)
        
    }
    
}

@available(iOS 17.0, *)
#Preview {
    CalculateViewController()
}

