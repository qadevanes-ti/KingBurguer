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
    
    var parentCoordinator: SignInCoordinator?
    
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
    
    func home() {
        parentCoordinator?.home()
    }
    
}
