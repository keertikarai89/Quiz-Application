//
//  Function.swift
//  Quiz
//
//  Created by Keertika on 3/6/18.
//  Copyright © 2018 DePaul University. All rights reserved.
//

import Foundation

extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
