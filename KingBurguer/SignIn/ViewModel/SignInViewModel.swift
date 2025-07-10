//
//  SignInViewModel.swift
//  KingBurguer
//
//  Created by Adevanes Thiago on 10/07/25.

import Foundation


protocol SignInViewModelDelegate {
    func viewModelDidChanged(State: SignInStage)
}

class SignInViewModel {
    
    var delegate: SignInViewModelDelegate?
    var coordinator: SignInCoordinator?
    
    var state: SignInStage = .none {
        didSet {
            delegate?.viewModelDidChanged(State: state)
        }
        
    }
    func send() {
        state = .loading
        //aqui eu espero 2 segundos
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.state = .gotoHome
        }
    }
    
    func goToSignUp() {
        coordinator?.signUp()
        }
    
    func goToHome() {
        coordinator?.home()
    }
}
