//
//  ViewController.swift
//  VideoPlayer
//
//  Created by YU on 2019/4/18.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class MainViewController: UIViewController {

    var buttomView: UIView!
    
    var avPlayer: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    var isPlaying: PlayStatus = .play
    var isMuting: SoundStatus = .mute
    
    let fullScreenSize = UIScreen.main.bounds.size
    
    lazy var playButton: UIButton = {
        
        let button = UIButton(frame: CGRect(x: 8, y: fullScreenSize.height * 355/375  , width: 50, height: 25))
        
        button.setTitle("Play", for: .normal)
        
        button.addTarget(self, action: #selector(MainViewController.playVideo), for: .touchUpInside)
        
        return button
        
    }()
    
    lazy var muteButton: UIButton = {
        
        let button = UIButton(frame: CGRect(x: 355, y: fullScreenSize.height * 355/375, width: 50, height: 25))
        
        button.setTitle("Mute", for: .normal)
        
        button.addTarget(self, action: #selector(MainViewController.muteVideo), for: .touchUpInside)
        
        return button
        
    }()
    

    @objc func playVideo() {
        
        switch isPlaying {
            
        case .play:
            
            avPlayer.pause()
            isPlaying = .stop
            playButton.setTitle("Stop", for: .normal)
            
        case .stop:
            
            avPlayer.play()
            isPlaying = .play
            playButton.setTitle("Play", for: .normal)
        
        }
    }
    
    @objc func muteVideo() {
        
        switch isMuting {
            
        case .mute:
            isMuting = .unmute
            muteButton.setTitle("Unmute", for: .normal)
        case .unmute:
            isMuting = .mute
            muteButton.setTitle("Mute", for: .normal)
            
        }
    }
    
    
    func buttomViewColor() {
        
        buttomView = UIView(frame: CGRect(x: 0, y: view.bounds.height - (view.bounds.height * 44/667), width: view.bounds.width, height: view.bounds.height * 44/667))
        
        buttomView.backgroundColor = UIColor(red: 123/255, green: 123/255, blue: 123/255, alpha: 1)
    }
    
    
    
    func playLayer() {

        let remoteURL = URL(string: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8")
        // 建立 AVPlayer 播放器
        self.avPlayer = AVPlayer(url: remoteURL!)
        // 將 AVPlayer 新增到 AVPlayerLayer 上
        self.playerLayer = AVPlayerLayer(player: avPlayer)

        playerLayer.frame = CGRect(x: 10, y: 280, width: 400, height: 200)
        
        print("fullScreenSize",fullScreenSize)
        
        print(playerLayer.frame)
        
        view.layer.addSublayer(playerLayer)
        
        avPlayer.play()
        
        isPlaying = .play
        
        print("playing")
        
    }
    
    
    
    
    
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        buttomViewColor()
        
        self.view.addSubview(buttomView)
        
        self.view.addSubview(playButton)
        
        self.view.addSubview(muteButton)
        
        playLayer()

    }
}

