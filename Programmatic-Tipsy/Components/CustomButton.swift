//
//  CustomButton.swift
//  Programmatic-Tipsy
//
//  Created by Doğukan Sakin on 23.03.2024.
//

import UIKit

enum ButtonTypes{
    case filled
    case textOnly
}

class CustomButton:UIButton{
    var action:((_ sender:CustomButton)->Void)?
    var type:ButtonTypes?
    
    override var isSelected: Bool {
        didSet {
            configureButtonAppearance()
        }
    }

    
    init(title:String,type:ButtonTypes? = .filled){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.configuration = .filled()
        self.configuration?.baseBackgroundColor = type == .filled ? UIColor(named: "Secondary") : .clear
        self.setTitleColor(type == .filled ? .white : UIColor(named: "Secondary") , for: .normal)
        self.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        self.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0)
        self.isSelected = type == .filled 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonPress(){
        if let safeAction = action {
            safeAction(self)
        }
    }
    
    private func configureButtonAppearance() {

        if isSelected {
            self.configuration?.baseBackgroundColor = UIColor(named: "Secondary")
            self.setTitleColor(.white, for: .normal)
        } else {
            self.configuration?.baseBackgroundColor = .clear
            self.setTitleColor(UIColor(named: "Secondary"), for: .normal)
        }
    }
    
}
