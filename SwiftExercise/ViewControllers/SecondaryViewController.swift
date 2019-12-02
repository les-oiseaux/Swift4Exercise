//
//  SecondaryViewController.swift
//  SwiftExercise
//
//  Created by Robert on 11/11/2019.
//  Copyright © 2019 Robert Vogels. All rights reserved.
//

import Foundation
import UIKit

class SecondaryViewController: UIViewController {
    
    var instructionsLabel = UILabel()
    
    @objc func touchUp() {
    
        let randomRed:CGFloat = CGFloat(arc4random_uniform(256))
        let randomGreen:CGFloat = CGFloat(arc4random_uniform(256))
        let randomBlue:CGFloat = CGFloat(arc4random_uniform(256))
        let myColor =  UIColor(red: randomRed/255, green: randomGreen/255, blue: randomBlue/255, alpha: 1.0)

        self.view.backgroundColor = myColor
        self.instructionsLabel.removeFromSuperview()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .black
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchUp))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        instructionsLabel = UILabel(frame: CGRect(x: getScreenSizeX()/2-115, y: getScreenSizeY()/2-80, width: 230, height: 50))
        instructionsLabel.text = "Tap get a new random color"
        instructionsLabel.textColor = .white
        instructionsLabel.textAlignment = .center
        view.addSubview(instructionsLabel)
        
    }
}
