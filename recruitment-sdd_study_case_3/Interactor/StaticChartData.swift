//
//  StaticChartData.swift
//  recruitment-sdd_study_case_3
//
//  Created by Jonathan Kristian on 04/04/24.
//

import Foundation

final class StaticChartData: NSObject {
    
    var lineChartData:  TransPerMonthData = TransPerMonthData(dictionary: [:])!
    var donutChartData: [Transaction] = []
    
    init?(dictionary: [[String: Any]]) {
        for row in dictionary{
            if let type = row["type"] as? String {
                if type == "donutChart"{
                    if let data = row["data"] as? [[String : Any] ]{
                        var temp: [Transaction] = []
                        for row2 in data{
                            temp.append(Transaction(dictionary: row2)!)
                        }
                        self.donutChartData = temp
                    }
                } else if type == "lineChart"{
                    if let data = row["data"] as? [String : Any]{
                        self.lineChartData = TransPerMonthData(dictionary: data)!
                    }
                }
            }
        }
            
    }
}

extension StaticChartData{

    static func loadStaticChartData()-> StaticChartData{
        let url = Bundle.main.url(forResource: "DATA_STATIC", withExtension: "json")!
        do {
            let jsonData = try Data(contentsOf: url)
           
            do {
                if let dictionary = try JSONSerialization.jsonObject(with: jsonData, options : .allowFragments) as? [[String: Any]]{
                    return StaticChartData(dictionary: dictionary)!
                } else {
                    
                    let str = String(decoding: jsonData, as: UTF8.self)
                    print(str.description)
                    return StaticChartData(dictionary: [[:]])!
                }
            } catch let error{
                
                print(error.localizedDescription)
                return StaticChartData(dictionary: [[:]])!
            }
        }
        catch {
            print(error.localizedDescription)
        }
        return StaticChartData(dictionary: [[:]])!
    }
}
