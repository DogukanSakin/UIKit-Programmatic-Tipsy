//
//  CustomInput.swift
//  Programmatic-Tipsy
//
//  Created by Doğukan Sakin on 23.03.2024.
//

import UIKit

class CustomInput:UITextField{
    init(placeholder:String){
        super.init(frame:.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        self.font = UIFont.systemFont(ofSize: 34, weight: .semibold)
        self.textColor = .white
        self.keyboardType = .decimalPad
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
