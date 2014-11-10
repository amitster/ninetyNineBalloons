//
//  ViewController.swift
//  ninetyNineBalloons
//
//  Created by Amit Badlani on 11/10/14.
//  Copyright (c) 2014 Amitster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var balloonLabel: UILabel!
    @IBOutlet weak var balloonImage: UIImageView!
    
    var balloons:[Balloon] = []
    var balloonRepo = ["BerlinTVTower.jpg", "RedBalloon1.jpg", "RedBalloon2.jpg", "RedBalloon3.jpg", "RedBalloon4.jpg"]
    
    var currentIndex = 0
    
    var currentRandomNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        self.createBalloons()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        
        let balloon = balloons[currentIndex]
        
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations:
            {
                self.balloonLabel.text = "\(balloon.number) Balloon(s)"
                self.balloonImage.image = balloon.image
            }, completion: { (finished: Bool) -> () in
        })
        
        currentIndex += 1
    }
    
    func createBalloons () {
        for var balloonCount = 0; balloonCount <= 99; ++balloonCount {
            
            var balloon = Balloon()
            balloon.number = balloonCount
            
            var randomNumber:Int
            
            do {
                randomNumber = Int(arc4random_uniform(UInt32(4)))
            } while (randomNumber == currentRandomNumber)
            
            currentRandomNumber = randomNumber
            
            switch randomNumber {
            case 1:
                balloon.image = UIImage(named: balloonRepo[1])
            case 2:
                balloon.image = UIImage(named: balloonRepo[2])
            case 3:
                balloon.image = UIImage(named: balloonRepo[3])
            default:
                balloon.image = UIImage(named: balloonRepo[4])
            }
            
            self.balloons.append(balloon)
        }
    }

}

