//
//  AccountListViewController.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import UIKit

class AccountDetailViewController: BankViewController {
    
    @IBOutlet weak var amountText: UILabel!
    @IBOutlet weak var amountValue: UILabel!
    
    @IBOutlet weak var typeText: UILabel!
    @IBOutlet weak var typeValue: UILabel!
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    
    @IBOutlet weak var ownerText: UILabel!
    @IBOutlet weak var ownerValue: UILabel!
    
    @IBOutlet weak var ibanText: UILabel!
    @IBOutlet weak var ibanValue: UILabel!
    
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var dateValue: UILabel!
    
    @IBOutlet weak var legalText: UILabel!
    @IBOutlet weak var legalValue: UILabel!
    
    
    lazy var presenter: AccountDetailPresenterProtocol = {
        return AccountDetailPresenter(viewProtocol: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.manageViewDidLoad()
    }
    
}

extension AccountDetailViewController: AccountDetailViewControllerProtocol {
    
    func setComponents(viewModel: AccountModel) {
        title = viewModel.label
        
        amountText.text = "AccountDetail.amount_label".localized
        amountValue.text = "\(viewModel.amount.formattedAmountString) €"
        
        typeText.text = "AccountDetail.type_label".localized
        typeValue.text = viewModel.type
        
        labelText.text = "AccountDetail.label_label".localized
        labelValue.text = viewModel.label
        
        ownerText.text = "AccountDetail.owner_label".localized
        ownerValue.text = viewModel.owner
        
        ibanText.text = "AccountDetail.iban_label".localized
        ibanValue.text = viewModel.iban
        
        dateText.text = "AccountDetail.subscription_date_label" .localized
        dateValue.text = viewModel.subscriptionDate.formattedDate
        
        legalText.text = "AccountDetail.legal_informations_label".localized
        legalValue.text = viewModel.legalInformations
    }
    
}
