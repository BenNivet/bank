//
//  HomeViewController.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import UIKit

class HomeViewController: BankViewController {
    
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    private lazy var presenter: HomePresenterProtocol = {
        return HomePresenter(viewProtocol: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.manageViewDidLoad()
    }
    
    @IBAction func didPressButton() {
        presenter.manageDidPressButton()
    }
    
}

extension HomeViewController: HomeViewControllerProtocol {
    
    func setComponents(viewModel: HomeViewModel) {
        imageView.image = Constants.homeBackgroundIamage
        
        accountButton.layer.cornerRadius = Constants.buttonCornerRadius
        accountButton.backgroundColor = Constants.mainColor
        accountButton.tintColor = Constants.textColor
        accountButton.titleLabel?.font = Constants.buttonFont
        accountButton.setTitle(viewModel.accountButtonTitleKey.localized, for: .normal)
    }
    
    func goToAccountList() {
        let storyboard = UIStoryboard(name: AccountList.storyboardName, bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
