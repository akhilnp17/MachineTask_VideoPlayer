//
//  LoginViewController.swift
//  MachineTask_VideoPlayer
//
//  Created by AKHIL N P on 02/03/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var mobileTf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        let strybrd = UIStoryboard(name: "Main", bundle: nil)
        let vc = strybrd.instantiateViewController(withIdentifier: "otp")as!OTPViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        let strybrd = UIStoryboard(name: "Main", bundle: nil)
        let vc = strybrd.instantiateViewController(withIdentifier: "register")as!RegistrationViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
