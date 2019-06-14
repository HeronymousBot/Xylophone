//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            playSound(note: "note1")
        case 2:
            playSound(note: "note2")
        case 3:
            playSound(note: "note3")
        case 4:
            playSound(note: "note4")
        case 5:
            playSound(note: "note5")
        case 6:
            playSound(note: "note6")
        case 7:
            playSound(note: "note7")
        default:
            break;
        }
        
    }
    
    var player: AVAudioPlayer?
    
    func playSound(note:String) {
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
   

}

