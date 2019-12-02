//
//  ExtendedData.swift
//  SwiftExercise
//
//  Created by Robert on 13/11/2019.
//  Copyright © 2019 Robert Vogels. All rights reserved.
//

import Foundation
import UIKit

func getScreenSizeX() -> Int {
    
    return Int(UIScreen.main.bounds.maxX)
    
}

func getScreenSizeY() -> Int {
    
    return Int(UIScreen.main.bounds.maxY)
    
}

func getNewButtonPosition() -> (Int, Int) {
    
    return ( Int.random(in: 0 ... getScreenSizeX()-100), Int.random(in: 0 ... getScreenSizeY()-80))
    
}
