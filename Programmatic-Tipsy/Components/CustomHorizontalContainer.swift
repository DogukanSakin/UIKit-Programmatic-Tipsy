//
//  CustomHorizontalContainer.swift
//  Programmatic-Tipsy
//
//  Created by Doğukan Sakin on 23.03.2024.
//

import UIKit

class CustomHorizontalContainer: UIStackView{
    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.distribution = .fillEqually
        self.axis = .horizontal
        self.spacing = 20
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
