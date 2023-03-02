//
//  OTPViewController.swift
//  MachineTask_VideoPlayer
//
//  Created by AKHIL N P on 02/03/23.
//

import UIKit

class OTPViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var otp1: UITextField!
    
    @IBOutlet weak var otp2: UITextField!
    
    @IBOutlet weak var otp3: UITextField!
    
    @IBOutlet weak var otp4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        otp1.delegate = self
        otp2.delegate = self
        otp3.delegate = self
        otp4.delegate = self
        

        otp1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otp2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otp3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otp4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        
    }
    
    @objc func textFieldDidChange(textField: UITextField){
         
         let text = textField.text
         if  text?.count == 1 {
             switch textField{
             case otp1:
                 otp2.becomeFirstResponder()
             case otp2 :
                 otp3.becomeFirstResponder()
             case otp3 :
                 otp4.becomeFirstResponder()
             case otp4 :
                 otp4.becomeFirstResponder()
             
             default:
                 break
             }
         }
         if text?.count == 0{
             switch textField{
             case otp1:
                 otp1.becomeFirstResponder()
             case otp2 :
                 otp1.becomeFirstResponder()
             case otp3:
                 otp2.becomeFirstResponder()
             case otp4 :
                 otp3.becomeFirstResponder()
             
             default:
                 break
             }
         } else{
             print("error")
         }
         
     }
    
    @IBAction func nextBtn(_ sender: Any) {
        let strybrd = UIStoryboard(name: "Main", bundle: nil)
        let vc = strybrd.instantiateViewController(withIdentifier: "main")as!VideoPlayerViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
