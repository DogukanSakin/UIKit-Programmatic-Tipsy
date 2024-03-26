//
//  CustomStepper.swift
//  Programmatic-Tipsy
//
//  Created by Doğukan Sakin on 23.03.2024.
//

import UIKit

class CustomStepper: UIStepper{
    var action:((_ sender:CustomStepper)->Void)?
    
    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.tintColor = .white
        self.minimumValue = 1
        
        let incrementImage = UIImage(systemName: "plus")?.withTintColor(UIColor(named:"Secondary")!, renderingMode: .alwaysOriginal)
        let decrementImage = UIImage(systemName: "minus")?.withTintColor(UIColor(named:"Secondary")!, renderingMode: .alwaysOriginal)

        self.setIncrementImage(incrementImage, for: .normal)
        self.setDecrementImage(decrementImage, for: .normal)
        self.addTarget(self, action: #selector(stepperPress), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func stepperPress(){
        if let safeAction = action {
            safeAction(self)
        }
    }
    
    
    
}
