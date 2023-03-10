//
//  VideoData.swift
//  MachineTask_VideoPlayer
//
//  Created by AKHIL N P on 02/03/23.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class VideoData : UIViewController {
    
    let video1 = "https://drive.google.com/uc?export=open&id=109eVuq2bzdTmR-DY-fEoPClcCGzUu2RE"
    let video2 = "https://drive.google.com/uc?export=open&id=1K8Z0jGQObZEBGe9il1shuOr4nuHqupBo"
    let video3 = "https://drive.google.com/uc?export=open&id=1M57kokeKR-MKl321RWA7nIMeh_B2MbRk"
    let video4 = "https://drive.google.com/uc?export=open&id=1dD3F4FT9Y0uoEIU9sG8srOgyicLNY3om"
    
    func videoStr (dataNumber:Int)->String{
        switch dataNumber {
        case 1:
            return video1
            
        case 2:
            return video2
            
        case 3:
            return video3
         
        case 4:
            return video4
            
        default:
            return "error"
        }
    }
    
}
