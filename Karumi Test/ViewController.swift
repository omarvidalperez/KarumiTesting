//
//  ViewController.swift
//  Karumi Test
//
//  Created by Omar Vidal Pérez on 12/11/2019.
//  Copyright © 2019 Omar Vidal Pérez. All rights reserved.
//

import UIKit

protocol ViewControllerProtocol {
    func hideViewComponents()
    func showViewComponents()
    func showAlert()
}

class ViewController: UIViewController, UITextFieldDelegate, ViewControllerProtocol {
    
    var presenter: SessionPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = SessionPresenter(viewController: self)
        
        logoutButton.isHidden = true
        password.delegate = self
        username.delegate = self
    }
    
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var logoutButton: UIButton!
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBAction func Login(_ sender: UIButton) {
        presenter?.logIn(user: username.text!, pass: password.text!)
    }
    
    @IBAction func Logout(_ sender: Any) {
        presenter?.logOut()
    }
    
    func hideViewComponents() {
        usernameLabel.isHidden = true
        passwordLabel.isHidden = true
        password.isHidden = true
        username.isHidden = true
        loginButton.isHidden = true
        logoutButton.isHidden = false
    }
    
    func showViewComponents() {
        usernameLabel.isHidden = false
        passwordLabel.isHidden = false
        password.isHidden = false
        username.isHidden = false
        loginButton.isHidden = false
        logoutButton.isHidden = true
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Whoops", message: "Algo ha salido mal", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: false)
    }
}

