//
//  ViewController.swift
//  SignInWithApple
//
//  Created by Atif on 29/10/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController {
    @IBOutlet weak var loginView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
    }
    func setUpButton() {
        let btnAppleLogin = ASAuthorizationAppleIDButton(type: .signIn, style: traitCollection.userInterfaceStyle == .light ? .black : .white)
        btnAppleLogin.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        btnAppleLogin.widthAnchor.constraint(equalToConstant: self.loginView.frame.width).isActive = true
        btnAppleLogin.heightAnchor.constraint(equalToConstant: self.loginView.frame.height).isActive = true
        btnAppleLogin.translatesAutoresizingMaskIntoConstraints = false
        btnAppleLogin.cornerRadius = 5
        self.loginView.addSubview(btnAppleLogin)
    }
    @objc
    func btnAction() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.email, .fullName]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.performRequests()
    }
}
extension ViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let credential = authorization.credential as?  ASAuthorizationAppleIDCredential else {return}
        print(credential)
        //        guard let email = credential.email else {return}
        //        guard let fullName = credential.fullName else {return}
        //        print(email)
        //        print(fullName)
        postAuthenticationMethod()
    }
    func postAuthenticationMethod() {
        guard let vc = appDelegate().storyboard().instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as? HomeViewController else { return }
        appDelegate().setRoot(root: vc)
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error)
    }
}

