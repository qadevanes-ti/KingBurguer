//
//  HomeCoordinator.swift
//  KingBurguer
//
//  Created by Adevanes Thiago on 10/07/25.
//

import Foundation
import UIKit

class HomeCoordinator {
    
    private let navigationController: UINavigationController
    private let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let homeVC = HomeViewController()
        navigationController.pushViewController(homeVC, animated: true)
        //aqui  e onde acontece a troca de nagigationcontroller
        window?.rootViewController = navigationController
    }
    
}
