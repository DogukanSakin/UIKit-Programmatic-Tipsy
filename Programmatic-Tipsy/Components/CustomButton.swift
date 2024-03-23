//
//  CustomButton.swift
//  Programmatic-Tipsy
//
//  Created by Doğukan Sakin on 23.03.2024.
//

import UIKit

class CustomButton:UIButton{
    init(title:String){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.configuration = .filled()
       // self.configuration?.baseBackgroundColor = UIColor(named: "Secondary")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
