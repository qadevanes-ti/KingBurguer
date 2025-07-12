//
//  SignUpViewModel.swift
//  KingBurguer
//
//  Created by Adevanes Thiago on 10/07/25.
//

import Foundation


protocol SignUpViewModelDelegate {
    func viewModelDidChanged(state: SignUpStage)
}

class SignUpViewModel {
    
    var delegate: SignUpViewModelDelegate?
    var coordinator: SignUpCoordinator?
    
    var state: SignUpStage = .none {
        didSet {
            delegate?.viewModelDidChanged(state: state)
        }
        
    }
    func send() {
        state = .loading
        //aqui eu espero 2 segundos
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.state = .gotoHome
        }
    }
    
    func goToHome() {
        coordinator?.home()
    }
    
}
