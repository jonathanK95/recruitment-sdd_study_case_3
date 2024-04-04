//
//  TransactionData.swift
//  recruitment-sdd_study_case_3
//
//  Created by Jonathan Kristian on 04/04/24.
//

import Foundation

final class TransactionData: NSObject {
    var trx_date: String = ""
    var nominal: Int = 0
    
    init?(dictionary: [String: Any]) {
        if let trx_date = dictionary["trx_date"] as? String {
            self.trx_date = trx_date
        }
        if let nominal = dictionary["nominal"] as? Int {
            self.nominal = nominal
        }
    }
}
