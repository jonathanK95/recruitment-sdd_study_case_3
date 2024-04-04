//
//  LineChartData.swift
//  recruitment-sdd_study_case_3
//
//  Created by Jonathan Kristian on 04/04/24.
//

import Foundation

final class LineChartData: NSObject {
    var transPerMonth: [Int] = []
    
    init?(dictionary: [String: Any]) {
        if let month = dictionary["month"] as? [Int]  {
            self.transPerMonth = month
        }

    }
}
