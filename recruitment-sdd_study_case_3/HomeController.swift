//
//  HomeController.swift
//  recruitment-sdd_study_case_3
//
//  Created by Jonathan Kristian on 03/04/24.
//

import UIKit
import DGCharts

class HomeController: UIViewController {
    
    @IBOutlet weak var chart1Container: UIView!
    
    @IBOutlet weak var chart2Container: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    let pieChartView = PieChartView()
    
    let dataEntry: [PieChartDataEntry] = [
        PieChartDataEntry(value: 55.0, label: "Tarik Tunai"),
        PieChartDataEntry(value: 31.0, label: "QRIS Payment"),
        PieChartDataEntry(value: 7.7, label: "Topup Gopay"),
        PieChartDataEntry(value: 6.3, label: "Lainnya")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupChart()
        
        let a = StaticChartData.loadStaticChartData()
        
        print(a)
        
//        print(a[0].)
        // Do any additional setup after loading the view.
    }

    func setupChart(){
        self.pieChartView.frame = self.view.bounds
        
        self.pieChartView.rotationEnabled = false
        self.view.addSubview(self.pieChartView)
        
        let dataSet = PieChartDataSet(entries: self.dataEntry, label: "History")
        dataSet.colors = ChartColorTemplates.material()
        self.pieChartView.data = PieChartData(dataSet: dataSet)
    }

}

