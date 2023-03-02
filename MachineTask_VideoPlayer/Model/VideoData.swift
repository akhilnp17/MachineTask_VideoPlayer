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
    let video3 = "https://drive.google.com/uc?export=open&id=1Ihr2oVO0PNoklMDMHNasO_QECjCW8Nw0"
    
    func videoStr (dataNumber:Int)->String{
        switch dataNumber {
        case 1:
            return video1
            
        case 2:
            return video2
            
        case 3:
            return video3
            
        default:
            return "error"
        }
    }
    
    func download(videoNumber:Int){
        
        let videoUrl = "https://drive.google.com/uc?export=open&id=1ARUHxWqOM-PWaPt3x6ygCEo5j8tUOZ-v"
        
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let destinationUrl = docsUrl.appendingPathComponent("MyFileSaveName\(videoNumber).mp4")
        if(FileManager().fileExists(atPath: destinationUrl.path)){
            print("file already exists")
        }
        else{
            
            var request = URLRequest(url: URL(string: videoUrl)!)
            request.httpMethod = "GET"
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: request, completionHandler: { (data, response, error) in
                if(error != nil){
                    print("some error occured")
                    return
                }
                if let response = response as? HTTPURLResponse{
                    if response.statusCode == 200{
                        DispatchQueue.main.async {
                            if let data = data{
                                if let _ = try? data.write(to: destinationUrl, options: Data.WritingOptions.atomic){
                                    print("url data written")
                                }
                                else{
                                    print("error again")
                                }
                            }
                        }
                    }
                }
            })
            task.resume()
            
        }
    }
}
