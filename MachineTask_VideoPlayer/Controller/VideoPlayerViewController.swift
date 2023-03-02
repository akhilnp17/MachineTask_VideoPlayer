//
//  ViewController.swift
//  MachineTask_VideoPlayer
//
//  Created by AKHIL N P on 01/03/23.
//

import UIKit
import AVKit
import AVFoundation

class VideoPlayerViewController: UIViewController {
    
    @IBOutlet weak var profileBtn: UIButton!
    
    @IBOutlet weak var sideBtn: UIButton!
    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet weak var downloadBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var prevBtn: UIButton!
    
    var datass = VideoData()
    var dataValue = 1
    var urlValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.cornerRad(cRadious: 16)
        prevBtn.cornerRad(cRadious: 16)
        downloadBtn.cornerRad(cRadious: 16)
        sideBtn.cornerRad(cRadious: 16)
        
        let offline = playOffline()
        
        urlValue = datass.videoStr(dataNumber: dataValue)
        playVideo(str: urlValue)
        
    }
    
    @IBAction func downloadVideo(_ sender: UIButton) {
        
        datass.download(videoNumber: dataValue)
    }
    
    @IBAction func previousVideo(_ sender: UIButton) {
        
        nextBtn.isEnabled = true
        
        dataValue -= 1
        print(dataValue)
        if dataValue <= 1 {
            prevBtn.isEnabled = false
            
        }
        urlValue = datass.videoStr(dataNumber: dataValue)
        playVideo(str: urlValue)
    }
    
    @IBAction func nextVideo(_ sender: UIButton) {
        
        prevBtn.isEnabled = true
        
        dataValue += 1
        print(dataValue)
        if dataValue >= 3 {
            nextBtn.isEnabled = false
            
        }
        //   playOffline()
        urlValue = datass.videoStr(dataNumber: dataValue)
        playVideo(str: urlValue)
    }
    @IBAction func sideMenu(_ sender: UIButton) {
        
        
    }
    
    func playVideo(str : String){
        
        let videoPlayerViewController = AVPlayerViewController()
        addChild(videoPlayerViewController)
        
        let videoURL = URL(string: str)
        let videoPlayerItem = AVPlayerItem(url: videoURL!)
        let videoPlayer = AVPlayer(playerItem: videoPlayerItem)
        videoView.addSubview(videoPlayerViewController.view)
        videoPlayerViewController.view.frame = videoView.bounds
        videoPlayerViewController.player = videoPlayer
        
        videoPlayer.pause()
        
    }
    
    func pauseVideo(){
        
    }
    
    func playOffline()->Int{
        
        var val = 0
        let baseUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let assetUrl = baseUrl.appendingPathComponent("MyFileSaveNames\(dataValue).mp4")
        
        if assetUrl != nil {
            val = 1
        }else{
            val = 0
        }
        let url = assetUrl
        print(url)
        let avAssest = AVAsset(url: url)
        let playerItem = AVPlayerItem(asset: avAssest)
        
        
        let player = AVPlayer(playerItem: playerItem)
        
        let playerViewController = AVPlayerViewController()
        addChild(playerViewController)
        videoView.addSubview(playerViewController.view)
        playerViewController.view.frame = videoView.bounds
        playerViewController.player = player
        player.pause()
        
        return val
    }
}
