//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var player: AVAudioPlayer!
    
    func playSound(withTag: Int) {
        
        let soundURL = Bundle.main.url(forResource: "note\(withTag)", withExtension: "wav")
        
        do {
            player = try AVAudioPlayer(contentsOf: soundURL!)
        } catch  {
            print(error)
        }
        
        player.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        
        playSound(withTag: sender.tag)
        
    }
}

