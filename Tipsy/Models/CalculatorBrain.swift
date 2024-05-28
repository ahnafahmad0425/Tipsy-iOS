//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Ahnaf Ahmad on 5/27/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var billObj : Bill?
    
    mutating func calculateBill (tip : Float, bill : Float, split : Float){
        let total = (bill * (1+tip)) / split
        
        billObj = Bill(total: total, tip: Int(tip*100), split: Int(split))
        
    }
    
    func getSplit() -> Int {
        return billObj?.split ?? 2
    }
    
    func getTotal() -> Float {
        return billObj?.total ?? 0.0
    }
    
    func getTip() -> Int {
        return billObj?.tip ?? 0
    }
}
