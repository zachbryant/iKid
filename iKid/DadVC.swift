//
//  FirstViewController.swift
//  iKid
//
//  Created by iGuest on 11/2/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import UIKit

class DadVC: AbsJokeVC{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData("dadjokes")
        nextJoke()
    }
}

