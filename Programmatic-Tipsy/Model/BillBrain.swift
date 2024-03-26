//
//  BillBrain.swift
//  Programmatic-Tipsy
//
//  Created by Doğukan Sakin on 26.03.2024.
//

import Foundation

struct BillBrain{
    func calculateAmountPerPerson(_ bill:Bill)->Double{
        return (bill.total + (bill.total * bill.tip)) / Double(bill.split)
    }
}
