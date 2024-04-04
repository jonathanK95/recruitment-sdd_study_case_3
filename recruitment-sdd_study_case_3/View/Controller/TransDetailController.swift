//
//  TransDetailController.swift
//  recruitment-sdd_study_case_3
//
//  Created by Jonathan Kristian on 05/04/24.
//

import UIKit

class TransDetailController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var type_lab: UILabel!
    @IBOutlet weak var count_lab: UILabel!
    
    var thisTransaction: Transaction?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


// MARK: - Setup View
extension TransDetailController{
    func setup(){
        
        self.type_lab.text = self.thisTransaction?.label
        self.count_lab.text = "\(self.thisTransaction?.data.count ?? 0) transaksi"
        
        self.tableView.register(UINib(nibName: "TransDetailTableCell", bundle: nil), forCellReuseIdentifier: "TransDetailTableCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

// MARK: - UITable Delegate
extension TransDetailController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.thisTransaction?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransDetailTableCell", for: indexPath) as? TransDetailTableCell else{
            return UITableViewCell()
        }
        guard let data = self.thisTransaction?.data[indexPath.row] as? TransactionData else{
            return UITableViewCell()
        }
        cell.setupCell(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
