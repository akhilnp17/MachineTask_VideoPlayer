//
//  ViewController.swift
//  MachineTask_VideoPlayer
//
//  Created by AKHIL N P on 01/03/23.
//

import UIKit

class VideoPlayerViewController: UIViewController {
    @IBOutlet weak var profileBtn: UIButton!
    
    @IBOutlet weak var sideBtn: UIButton!
    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet weak var downloadBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var prevBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       

        nextBtn.cornerRad(cRadious: 16)
        prevBtn.cornerRad(cRadious: 16)
        downloadBtn.cornerRad(cRadious: 16)
        sideBtn.cornerRad(cRadious: 16)
        
        
    }
    
    @IBAction func downloadVideo(_ sender: UIButton) {
    }
    

    @IBAction func previousVideo(_ sender: UIButton) {
    }
    
    @IBAction func nextVideo(_ sender: UIButton) {
    }
    @IBAction func sideMenu(_ sender: UIButton) {
    }
    
    
}

