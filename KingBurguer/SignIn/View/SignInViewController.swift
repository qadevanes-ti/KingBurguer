//
//  SignInViewController.swift
//  KingBurguer
//
//  Created by Adevanes Thiago on 10/07/25.

import Foundation
import UIKit

class SignInViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let sc = UIScrollView()
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    let container: UIView = {
        let v = UIView()
        v.backgroundColor = .red
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    lazy var email: UITextField = {
        let ed = UITextField()
        ed.backgroundColor = .white
        ed.placeholder = "Digite seu e-mail"
        ed.returnKeyType = .next
        ed.delegate = self
        ed.translatesAutoresizingMaskIntoConstraints = false
        return ed
    }()
    
    lazy var password: UITextField = {
        let ed = UITextField()
        ed.backgroundColor = .white
        ed.placeholder = "Digite sua senha"
        ed.returnKeyType = .done
        ed.delegate = self
        ed.translatesAutoresizingMaskIntoConstraints = false
        return ed
    }()
    
    lazy var send: UIButton = {
        let btn = UIButton()
        btn.setTitle("Entrar", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .yellow
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(sendDidTap), for: .touchUpInside)
        return btn
    }()
    
    lazy var register: UIButton = {
        let btn = UIButton()
        btn.setTitle("Criar conta", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .yellow
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(registerDidTap), for: .touchUpInside)
        return btn
    }()
    
    var viewModel: SignInViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    
    // 1. definicao de layout
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "Login"
        
        var texts: [UITextField] = []
        for i in 0..<10 {
            let t = UITextField()
            t.placeholder = "olá \(i)"
            t.borderStyle = .roundedRect
            t.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview(t)
            texts.append(t)
        }
        
        container.addSubview(send)
        //scroll.addSubview(container)
        //view.addSubview(scroll)
        
        
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(send)
        view.addSubview(register)
        
        let emailConstraints :[NSLayoutConstraint] = [
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            email.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            email.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            email.heightAnchor.constraint(equalToConstant: 50.0),
        ]
        
        let passwordConstraints: [NSLayoutConstraint] = [
            password.leadingAnchor.constraint(equalTo: email.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: email.trailingAnchor),
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10.0),
            password.heightAnchor.constraint(equalToConstant: 50.0),
        ]
        
        let sendConstraints: [NSLayoutConstraint] = [
            send.leadingAnchor.constraint(equalTo: password.leadingAnchor),
            send.trailingAnchor.constraint(equalTo: password.trailingAnchor),
            send.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10.0),
            send.heightAnchor.constraint(equalToConstant: 50.0),
        ]
        
        let registerConstraints: [NSLayoutConstraint] = [
            register.leadingAnchor.constraint(equalTo: email.leadingAnchor),
            register.trailingAnchor.constraint(equalTo: email.trailingAnchor),
            register.topAnchor.constraint(equalTo: send.bottomAnchor, constant: 15.0),
            register.heightAnchor.constraint(equalToConstant: 50.0),
        ]
        
        NSLayoutConstraint.activate(emailConstraints)
        NSLayoutConstraint.activate(passwordConstraints)
        NSLayoutConstraint.activate(sendConstraints)
        NSLayoutConstraint.activate(registerConstraints)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard(_ view: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    // 2. evento de touch
    @objc func sendDidTap(sender: UIButton) {
        viewModel?.send()
    }
    
    @objc func registerDidTap(sender: UIButton) {
        viewModel?.goToSignUp()
    }
    
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField.returnKeyType == .done) {
            view.endEditing(true)
        } else {
            password.becomeFirstResponder()
        }
        return true
    }
    
}

extension SignInViewController: SignInViewModelDelegate{
    //3.Observador do view model
    func viewModelDidChanged(State state: SignInStage) {
       switch state {
       case .none:
           break
           case .loading:
           //mostrar a progress
           break
       case.gotoHome:
           viewModel?.goToHome()
           break
           case .failure(let msg):
           let alert = UIAlertController(title: "Erro", message: msg, preferredStyle: .alert)
           
           alert.addAction(UIAlertAction(title: "OK", style: .default))
           self.present(alert, animated: true)
           break
           
        }
    }
    
}
