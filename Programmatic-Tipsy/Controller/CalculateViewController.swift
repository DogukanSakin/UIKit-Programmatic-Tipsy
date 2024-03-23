//
//  CalculateViewController.swift
//  Programmatic-Tipsy
//
//  Created by Doğukan Sakin on 23.03.2024.
//

import UIKit

class CalculateViewController : UIViewController{
    private var calculateView:CalculateView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        calculateView = CalculateView(frame: view.bounds)
        view.addSubview(calculateView)
    }
}

@available(iOS 17.0, *)
#Preview {
    CalculateViewController()
}

