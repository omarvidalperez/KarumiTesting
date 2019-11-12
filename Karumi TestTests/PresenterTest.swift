//
//  PresenterTest.swift
//  Karumi TestTests
//
//  Created by Omar Vidal Pérez on 12/11/2019.
//  Copyright © 2019 Omar Vidal Pérez. All rights reserved.
//

import XCTest
@testable import Karumi_Test

class PresenterTest: XCTestCase {
    
    var sut: SessionPresenter!
    var view: MockViewController!
    var sessionInteractor: MockSessionInteractor!
    
    override func setUp() {
        super.setUp()
        view = MockViewController()
        sessionInteractor = MockSessionInteractor()
        sut = SessionPresenter(viewController: view, sessionInteractor: sessionInteractor)
    }

    override func tearDown() {
        view = nil
        sut = nil
        sessionInteractor = nil
        super.tearDown()
    }
    
    func test_given_correct_usr_pass_then_hide_login_componentes() {
        
        sessionInteractor.loginSuccess = true
        sut.logIn(user: "usr", pass: "pass")
        
        XCTAssertEqual(view.hideViewComponentsCalled, true)
    }
    
    func test_given_incorrect_usr_pass_then_do_nothing() {
        
        sessionInteractor.loginSuccess = false
        sut.logIn(user: "usr", pass: "pass")
        
        XCTAssertEqual(view.hideViewComponentsCalled, false)
    }
    
    func test_given_logout_success_then_show_components() {
        
        sessionInteractor.logoutSuccess = true
        sut.logOut()
        
        XCTAssertEqual(view.showViewComponentsCalled, true)
    }
    
    func test_given_logout_failure_then_show_alert() {
        
        sessionInteractor.logoutSuccess = false
        sut.logOut()
        
        XCTAssertEqual(view.showAlertCalled, true)
    }
}

class MockSessionInteractor: SessionInteractorProtocol {
    
    var loginSuccess: Bool!
    var logoutSuccess: Bool!
    
    
    func logIn(user: String, pass: String) -> Bool {
        return loginSuccess
    }
    
    func logOut() -> Bool {
        return logoutSuccess
    }
}

class MockViewController: ViewControllerProtocol {
    
    var hideViewComponentsCalled: Bool = false
    var showViewComponentsCalled: Bool = false
    var showAlertCalled: Bool = false
    
    
    func hideViewComponents() {
        hideViewComponentsCalled = true
    }
    
    func showViewComponents() {
        showViewComponentsCalled = true
    }
    
    func showAlert() {
        showAlertCalled = true
    }
}
