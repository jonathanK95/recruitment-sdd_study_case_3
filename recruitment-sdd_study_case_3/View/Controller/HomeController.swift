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
    let lineChartView = LineChartView()
    
    var pieDataEntry: [PieChartDataEntry] = []
    var lineDataEntry: [ChartDataEntry] = []
    
    var staticChartData: StaticChartData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupStaticData()
        
        self.setupChart()
        self.setupTable()
        // Do any additional setup after loading the view.
    }
    
    func setupStaticData(){
        //Set chart data from JSON
        self.staticChartData = StaticChartData.loadStaticChartData()
        
        for row in self.staticChartData?.donutChartData ?? []{
            self.pieDataEntry.append(PieChartDataEntry(value: row.percentage, label: row.label))
        }
        
        var monthIndex: Int = 1
        for row in self.staticChartData?.lineChartData.transPerMonth ?? []{
            self.lineDataEntry.append(ChartDataEntry(x: Double(monthIndex), y: Double(row)))
            monthIndex += 1
        }
    }
}

//MARK: Chart Setup
extension HomeController{
    func setupChart(){
        
        self.chart1Container.backgroundColor = .clear
        self.chart2Container.backgroundColor = .clear
        
        self.pieChartView.frame = self.chart1Container.bounds
        self.pieChartView.rotationEnabled = false
        self.chart1Container.addSubview(self.pieChartView)
        let pieDataSet = PieChartDataSet(entries: self.pieDataEntry, label: "")
        pieDataSet.colors = ChartColorTemplates.material()
        pieDataSet.valueTextColor = UIColor.white
        pieDataSet.valueFont = .systemFont(ofSize: 8, weight: .bold)
        pieDataSet.entryLabelFont = .systemFont(ofSize: .zero)
        self.pieChartView.data = PieChartData(dataSet: pieDataSet)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 1
        formatter.multiplier = 1.0
        self.pieChartView.data?.setValueFormatter(DefaultValueFormatter(formatter:formatter))
    
        
        self.lineChartView.frame = self.chart2Container.bounds
        self.chart2Container.addSubview(self.lineChartView)
        let lineDataSet = LineChartDataSet(entries: self.lineDataEntry, label: "")
        self.lineChartView.data = LineChartData(dataSet: lineDataSet)
        self.lineChartView.data?.setValueFormatter(DefaultValueFormatter(decimals: 0))
        self.lineChartView.xAxis.labelPosition = .bottom
        self.lineChartView.rightAxis.drawLabelsEnabled = false
        self.lineChartView.leftAxis.drawLabelsEnabled = false
        self.lineChartView.legend.enabled = false
        self.lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: ["","JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"])
        self.lineChartView.scaleXEnabled = false
        self.lineChartView.scaleYEnabled = false
        self.lineChartView.xAxis.labelFont = .systemFont(ofSize: 8)
        self.lineChartView.xAxis.drawGridLinesEnabled = false

    }
}

//MARK: Table Setup
extension HomeController{
    func setupTable(){
        self.tableView.register(UINib(nibName: "TransSummaryTableCell", bundle: nil), forCellReuseIdentifier: "TransSummaryTableCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

// MARK: - UITable Delegate
extension HomeController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.staticChartData?.donutChartData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransSummaryTableCell", for: indexPath) as? TransSummaryTableCell else{
            
            return UITableViewCell()
        }
        guard let transaction = self.staticChartData?.donutChartData[indexPath.row] as? Transaction else{
            
            return UITableViewCell()
        }
        
        cell.setupCell(thisTransaction: transaction)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension HomeController: TransSummaryDelegate{
    func selectAction(thisTransaction: Transaction) {
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TransDetailController") as? TransDetailController else { return }
        vc.thisTransaction = thisTransaction
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
