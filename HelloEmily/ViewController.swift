//
//  ViewController.swift
//  HelloEmily
//
//  Created by Kevin Tarr on 4/14/18.
//  Copyright © 2018 NerdInventions. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var fromKevin: UILabel!
    
    @IBOutlet var pressMeOutlet: UIButton!
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func pressMe(_ sender: Any) {
        
        label.text = "Hello Emily!!!! 🌺"
        fromKevin.text = "From Kevin ❤️"
       pressMeOutlet.isHidden = true
        self.view.backgroundColor = UIColor.green
        playSound()
        
        
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "17 Die For You", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
   
}

