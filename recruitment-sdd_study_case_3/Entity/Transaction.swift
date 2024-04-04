//
//  Transaction.swift
//  recruitment-sdd_study_case_3
//
//  Created by Jonathan Kristian on 04/04/24.
//

import Foundation

final class Transaction: NSObject {
    var label: String = ""
    var percentage: Double = 0.0
    var data: [TransactionData] = []
    
    init?(dictionary: [String: Any]) {
        
        if let label = dictionary["label"] as? String {
            self.label = label
        }
        
        if let percentage = dictionary["percentage"] as? String {
            self.percentage = Double(percentage) ?? 0.0
        }
        
        if let data = dictionary["data"] as? [[ String: Any ]] {
            var temp: [TransactionData] = []
            for row in data{
                temp.append(TransactionData.init(dictionary: row)!)
            }
            self.data = temp
        }
        
    }
}
