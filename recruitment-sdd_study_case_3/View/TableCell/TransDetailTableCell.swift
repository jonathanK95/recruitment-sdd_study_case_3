//
//  TransDetailTableCell.swift
//  recruitment-sdd_study_case_3
//
//  Created by Jonathan Kristian on 05/04/24.
//

import UIKit

class TransDetailTableCell: UITableViewCell {
    @IBOutlet weak var value_lab: UILabel!
    
    @IBOutlet weak var date_lab: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(data: TransactionData){
        self.value_lab.text = "Rp.\(data.nominal.formatted())"
        self.date_lab.text = data.trx_date
    }

}
