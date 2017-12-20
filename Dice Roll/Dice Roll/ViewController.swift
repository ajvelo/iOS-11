//
//  ViewController.swift
//  Dice Roll
//
//  Created by Andreas Velounias on 11/12/2017.
//  Copyright © 2017 Andreas Velounias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var dice1: UIImageView!
    @IBOutlet var dice2: UIImageView!
    
    var random1 = Int(arc4random_uniform(6))
    var random2 = Int(arc4random_uniform(6))
    
    let array = [#imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")]
    
    @IBAction func rollButton(_ sender: UIButton) {
        
        generateRandom()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        generateRandom()
    }
    
    func generateRandom() {
        
        dice1.image = array[random1]
        dice2.image = array[random2]
        
        random1 = Int(arc4random_uniform(6))
        random2 = Int(arc4random_uniform(6))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        generateRandom()
    }
}

