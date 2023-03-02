//
//  Constant.swift
//  MachineTask_VideoPlayer
//
//  Created by AKHIL N P on 02/03/23.
//

import Foundation
import UIKit

extension UIButton{
    
    func cornerRad(cRadious:Int){
        layer.cornerRadius = CGFloat(cRadious)
        layer.borderWidth = 1
       // layer.borderColor = nil
        layer.borderColor = UIColor.white.cgColor
        
        
    }
}
