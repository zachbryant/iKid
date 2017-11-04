//
//  SecondViewController.swift
//  iKid
//
//  Created by iGuest on 11/2/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import UIKit

class BadVC: AbsJokeVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData("badjokes")
        nextJoke()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

