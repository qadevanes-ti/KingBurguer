//
//  SignUpCoordinator.swift
//  KingBurguer
//
//  Created by Adevanes Thiago on 10/07/25.
//

import Foundation
import UIKit

class SignUpCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = SignUpViewModel()
        viewModel.coordinator = self
        
        let signUpVC = SignUpViewController()
        signUpVC.viewModel = viewModel
        
        navigationController.pushViewController(signUpVC, animated: true)
    }
    
}
