//
//  AccountTableViewCell.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var count: UILabel!
    
    lazy var presenter: AccountTableViewCellPresenterProtocol = {
        return AccountTableViewCellPresenter(viewProtocol: self)
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

extension AccountTableViewCell: AccountTableViewCellProtocol {
    
    func setComponents(viewModel: AccountViewModel) {
        label.text = viewModel.label
        number.text = viewModel.number
        amount.text = "\(viewModel.amount.formattedAmountString) €"
        if let transactionsCount = viewModel.transactionsCount {
            if transactionsCount == 0 {
                count.text = "Aucune transaction"
            } else {
                count.text = "\(transactionsCount) transaction(s)"
            }
        } else {
            count.text = ""
        }
    }
    
}
