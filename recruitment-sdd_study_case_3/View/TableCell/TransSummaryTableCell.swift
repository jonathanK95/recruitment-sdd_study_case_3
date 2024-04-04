//
//  TransSummaryTableCell.swift
//  recruitment-sdd_study_case_3
//
//  Created by Jonathan Kristian on 05/04/24.
//

import UIKit

protocol TransSummaryDelegate: AnyObject{
    func selectAction(thisTransaction: Transaction)
}

class TransSummaryTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    var thisTransaction: Transaction?
    var delegate: TransSummaryDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(thisTransaction: Transaction){
        self.thisTransaction = thisTransaction
        self.titleLabel.text = thisTransaction.label
        self.infoLabel.text = "\(thisTransaction.data.count) transaksi"
    }
    
    @IBAction func selectAction() {
        if let transaction = self.thisTransaction{
            self.delegate?.selectAction(thisTransaction: transaction)
        }
    }
}
