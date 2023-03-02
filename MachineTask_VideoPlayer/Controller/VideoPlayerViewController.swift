//
//  ViewController.swift
//  MachineTask_VideoPlayer
//
//  Created by AKHIL N P on 01/03/23.
//

import UIKit
import AVKit
import AVFoundation
import SideMenu

class VideoPlayerViewController: UIViewController {
    
    @IBOutlet weak var profileBtn: UIButton!
    
    @IBOutlet weak var sideBtn: UIButton!
    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet weak var downloadBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var prevBtn: UIButton!
    
    var menu: SideMenuNavigationController?
    var currentPlayer: AVPlayer?
    var datass = VideoData()
    var dataValue = 1
    var urlValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.cornerRad(cRadious: 16)
        prevBtn.cornerRad(cRadious: 16)
        downloadBtn.cornerRad(cRadious: 16)
        sideBtn.cornerRad(cRadious: 16)
        
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        let offlineCheck = offlineDataChecker()
        print("offline data -->\(offlineCheck)")
        
        
        if offlineCheck == 1 {
            playOffline()
        }else{
            playOnline()
        }
        
    }
    
    @IBAction func downloadVideo(_ sender: UIButton) {
        
        dowmload()
    }
    
    @IBAction func previousVideo(_ sender: UIButton) {
        
        nextBtn.isEnabled = true
        
        dataValue -= 1
        print(dataValue)
        if dataValue <= 1 {
            prevBtn.isEnabled = false
            
        }
        
        let offlineCheck = offlineDataChecker()
        print("offline data -->\(offlineCheck)")
        if offlineCheck == 1 {
            playOffline()
        }else{
            playOnline()
            print("Playing video online")
        }
    }
    
    @IBAction func nextVideo(_ sender: UIButton) {
        
        prevBtn.isEnabled = true
        
        dataValue += 1
        print(dataValue)
        if dataValue >= 4 {
            nextBtn.isEnabled = false
            
        }
        
        let offlineCheck = offlineDataChecker()
        print("offline data -->\(offlineCheck)")
        if offlineCheck == 1 {
            playOffline()
        }else{
            playOnline()
            
            print("Playing video online")
        }
    }
    
    @IBAction func sideMenu(_ sender: UIButton) {
        
        present(menu!, animated: true)
        
    }
    
    func playOnline(){
        
        currentPlayer?.pause()
        
        urlValue = datass.videoStr(dataNumber: dataValue)
        
        let videoPlayerViewController = AVPlayerViewController()
        
        let videoURL = URL(string: urlValue)
        let videoPlayerItem = AVPlayerItem(url: videoURL!)
        let videoPlayer = AVPlayer(playerItem: videoPlayerItem)
        
        addChild(videoPlayerViewController)
        videoView.addSubview(videoPlayerViewController.view)
        videoPlayerViewController.view.frame = videoView.bounds
        videoPlayerViewController.player = videoPlayer
        
        videoPlayer.play()
        currentPlayer = videoPlayer
        
    }
    
    func playOffline(){
        
        currentPlayer?.pause()
        
        let baseUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let assetUrl = baseUrl.appendingPathComponent("MyFileSaveNames\(dataValue).mp4")
        
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
        player.play()
        currentPlayer = player
        
    }
    
    func offlineDataChecker()->Int{
        
        var val = 0
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let destinationUrl = docsUrl.appendingPathComponent("MyFileSaveNames\(dataValue).mp4")
        if(FileManager().fileExists(atPath: destinationUrl.path)){
            print("-->File already exists--Checker")
            val = 1
        }
        else{
            print("No file exist")
            val = 0
        }
        return val
    }
    
    func dowmload(){
        let videoUrl = urlValue
        
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        
        let destinationUrl = docsUrl.appendingPathComponent("MyFileSaveNames\(dataValue).mp4")
        if(FileManager().fileExists(atPath: destinationUrl.path)){
            print("-->File already exists")
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
                                    print("Video Saved")
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

class MenuListController: UITableViewController {
    
    var items = ["Name","UserName","Email","DOB","Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
