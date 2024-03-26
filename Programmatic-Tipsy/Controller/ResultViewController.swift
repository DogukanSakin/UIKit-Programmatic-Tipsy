//
//  ResultViewController.swift
//  Programmatic-Tipsy
//
//  Created by Doğukan Sakin on 26.03.2024.
//

import UIKit

class ResultViewController:UIViewController{
    private var resultView:ResultView!
    var result:Double = 0
    var bill:Bill!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        setupView()
    }
    
    private func setupView(){ 
        resultView = ResultView(frame: view.bounds)
        resultView.delegate = self
        resultView.updateUI(withResult: result, withBill: bill)
        view.addSubview(resultView)
    }
}

extension ResultViewController:ResultViewDelegate{
    func reCalculateButtonTapped(_ sender: CustomButton) {
        navigationController?.popViewController(animated: true)
    }
}

@available(iOS 17.0, *)
#Preview {
    ResultViewController()
}

