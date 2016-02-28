//
//  BugSection.swift
//  Scary Bugs
//
//  Created by Aleksandr Pronin on 2/27/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

class BugSection {
    let howScary: ScaryFactor
    var bugs = [ScaryBug]()
    init(howScary: ScaryFactor) {
        self.howScary = howScary
    }
    
}
