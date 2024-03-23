//
//  CustomLabel.swift
//  Programmatic-Tipsy
//
//  Created by Doğukan Sakin on 23.03.2024.
//

import UIKit

class CustomLabel:UILabel{
    init(text:String,color:UIColor? = .systemGray3,fontSize:UIFont? = .systemFont(ofSize: 18, weight: .medium)){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.textColor = color
        self.font = fontSize
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
