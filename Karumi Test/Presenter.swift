//
//  Presenter.swift
//  Karumi Test
//
//  Created by Omar Vidal Pérez on 12/11/2019.
//  Copyright © 2019 Omar Vidal Pérez. All rights reserved.
//

import Foundation

protocol SessionPresenterProtocol {
    func logOut()
    func logIn(user: String, pass: String)
}

class SessionPresenter: SessionPresenterProtocol {
    
    let viewController: ViewControllerProtocol
    let sessionInteractor: SessionInteractorProtocol
    
    init(viewController: ViewControllerProtocol,
         sessionInteractor: SessionInteractorProtocol = SessionInteractor(clock: SystemClock())) {
        self.viewController = viewController
        self.sessionInteractor = sessionInteractor
    }
    
    func logOut() {
        if sessionInteractor.logOut() {
            viewController.showViewComponents()
        } else {
            viewController.showAlert()
        }
    }
    
    func logIn(user: String, pass: String) {
        if sessionInteractor.logIn(user: user, pass: pass) {
            viewController.hideViewComponents()
        }
    }
}
