//
//  RegistrationViewController.swift
//  MachineTask_VideoPlayer
//
//  Created by AKHIL N P on 02/03/23.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var dobField: UITextField!
    
    @IBOutlet weak var mobilefield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addPaddingAndBorder(to: nameField)
        addPaddingAndBorder(to: usernameField)
        addPaddingAndBorder(to: emailField)
        addPaddingAndBorder(to: dobField)
        addPaddingAndBorder(to: mobilefield)
    }

    @IBAction func submitBtn(_ sender: Any) {
        let strybrd = UIStoryboard(name: "Main", bundle: nil)
        let vc = strybrd.instantiateViewController(withIdentifier: "otp")as!OTPViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func addPaddingAndBorder(to textfield: UITextField) {
      
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8, height: 0.0))
        let rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8, height: 2.0))
        textfield.leftView = leftView
        textfield.rightView = rightView
        textfield.leftViewMode = .always
        textfield.rightViewMode = .always
    }
    
}
