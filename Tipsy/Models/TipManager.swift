//
//  TipManager.swift
//  Tipsy
//
//  Created by Saverio Negro on 17/07/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct TipManager {
    var bill = Bill()
    var totalPerPerson: Float?
    
    mutating func calculateTotalPerPerson() {
        self.totalPerPerson = self.getBillAmount() * (1 + self.getTipPercent()) / Float(self.getSplitNumber())
    }
    
    mutating func setTipPercent(tipPercent: Float) {
        self.bill.tipPercent = tipPercent
    }
    
    func getTipPercent() -> Float {
        return self.bill.tipPercent ?? 0.0
    }
    
    mutating func setSplitNumber(number: Int) {
        self.bill.splitNumber = number
    }
    
    func getSplitNumber() -> Int {
        return self.bill.splitNumber ?? 2
    }
    
    mutating func setBillAmount(amount: Float) {
        self.bill.amount = amount
    }
    
    func getBillAmount() -> Float {
        return self.bill.amount ?? 0.0
    }
    
    func getTotalPerPerson() -> String {
        return String(format: "%.2f", self.totalPerPerson ?? 0.0)
    }
    
    func getSettingInfo() -> String {
        return "Split between \(self.getSplitNumber()) people with a \(String(format: "%.0f", self.getTipPercent() * 100))%."
    }
    
    func getBill() -> Bill {
        return self.bill
    }
}
