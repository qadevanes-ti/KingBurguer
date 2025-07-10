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
    
    var state: SignInStage = .none {
        didSet {
            delegate?.viewModelDidChanged(State: state)
        }
        
    }
    func send() {
        state = .loading
        //aqui eu espero 2 segundos
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.state = .failure("usuarui nao existe")
        }
    }
    // 1. NADA - Preparado para receber o input
    // 2. Carregando
    // 3. Sucesso
    // 4. ERRO - mostrar uma mensagem vinda do servidor(usuario nao existe)
}
