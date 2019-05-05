//
//  ViewController.swift
//  Rx_Login
//
//  Created by Keval Patel on 5/4/19.
//  Copyright © 2019 Keval Patel. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class ViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblValid: UILabel!
    @IBOutlet weak var btnSignIn: UIButton!
    var logInViewModel = LogInViewModel()
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpValidation()
    }
    func setUpValidation(){
        _ = txtEmail.rx.text.map({ $0 ?? "" }).bind(to: logInViewModel.emailText)
        _ = txtPassword.rx.text.map({ $0 ?? "" }).bind(to: logInViewModel.passwordText)
        logInViewModel.isValid.subscribe(onNext: { [weak self] (isValid) in
            self?.btnSignIn.backgroundColor = isValid ? .green : .gray
            self?.btnSignIn.isEnabled = isValid ? true : false
        }).disposed(by: disposeBag)
        
    }
    @IBAction func selBtnSignIn(_ sender: Any) {
        if let destVC = self.storyboard?.instantiateViewController(withIdentifier: "TableVC") as? TableVC{
            self.navigationController?.pushViewController(destVC, animated: true)
        }
    }
    
}

