//
//  SignInStage.swift
//  KingBurguer
//
//  Created by Adevanes Thiago on 10/07/25.
//


import Foundation

enum SignInStage {
    case none
    case loading
    case gotoHome
    case failure(String)
}
