//
//  MainNavigationController.swift
//  SwiftExercise
//
//  Created by Robert on 11/11/2019.
//  Copyright © 2019 Robert Vogels. All rights reserved.
//

import Foundation
import UIKit

class MainNavigationController: UINavigationController {
    
    var continuePopulateButtons = false
    
    private let loginContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    func populateNewRandomButton() -> ClickMeButton {
        let newposition = getNewButtonPosition()
        let button = ClickMeButton(frame: CGRect(x: newposition.0, y: newposition.1, width: 100, height: 50))
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(buttonLongPress))
        button.addGestureRecognizer(longPress)
        
        return button
    }
    
    @objc func buttonAction(clickedButton: ClickMeButton!) {

        self.continuePopulateButtons = false
        let button = populateNewRandomButton()
        button.isReleased = false
        self.view.addSubview(button)
        
    }
    
    @objc func buttonLongPress(pressedButton: ClickMeButton!) {
        
        repeat {
            self.buttonAction(clickedButton: pressedButton)
        } while self.continuePopulateButtons == true
        
    }
    
    @objc func swipeUp() {
        
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
        
        let button = populateNewRandomButton()
        self.view.addSubview(button)
    }
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp))
        upSwipe.direction = .up
        view.addGestureRecognizer(upSwipe)
        
        let xNumber: Int = Int.random(in: 0 ... 250)
        
        let button = ClickMeButton(frame: CGRect(x: xNumber, y: 100, width: 100, height: 50))
        button.backgroundColor = .black
        button.setTitle("Start here", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        view.addSubview(loginContentView)
        loginContentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginContentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        loginContentView.heightAnchor.constraint(equalToConstant: (view.frame.height / 3)).isActive = true
        
        view.addSubview(button)
        button.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
    }
    
}
