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

    enum PlayStatus {
        
        case play
        
        case stop
    }
    
    enum SoundStatus {
        
        case mute
        
        case unmute
        
    }
    
    var avplayer: AVPlayer!
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
        
        let button = UIButton(frame: CGRect(x: fullScreenSize.width * 320/375, y: fullScreenSize.height * 355/375, width: 50, height: 25))
        
        button.setTitle("Mute", for: .normal)
        
        button.addTarget(self, action: #selector(MainViewController.muteVideo), for: .touchUpInside)
        
        return button
        
    }()
    

    @objc func playVideo() {
        
        switch isPlaying {
            
        case .play:
            isPlaying = .stop
            playButton.setTitle("Stop", for: .normal)
        case .stop:
            isPlaying = .play
            playButton.setTitle("Play", for: .normal)
        
        }
    }
    
    @objc func muteVideo() {
        
        switch isMuting {
            
        case .mute:
            isMuting = .unmute
        case .unmute:
            isMuting = .mute
            
        }
    }
    
    
    
    
    //let fullScreenSize = UIScreen.main.bounds
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(playButton)
        self.view.addSubview(muteButton)
        print("HH")
       
    }
}

