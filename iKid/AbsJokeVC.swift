//
//  AbsJokeVC.swift
//  iKid
//
//  Created by iGuest on 11/2/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import UIKit

protocol Joke {
    func nextJoke()
    func loadData(_: String)
}

class AbsJokeVC: UIViewController, Joke {
    var jokes: [String] = []
    var index: Int = -1
    weak var nextButton: UIButton!
    weak var main: UILabel!
    weak var ans: UILabel!
    var viewTypeString: String = "JokeView"
    
    @objc func nextJoke() {
        index = index + 1
        if index >= jokes.count {
            index = 0
        }
        NSLog(jokes[index])
        var parts: [String] = jokes[index].components(separatedBy: ":")
        main.text = parts[0]
        if parts.count > 1 {
            ans.text = parts[1]
        }
        else {
            ans.text = ""
        }
    }
    
    func loadData(_ file: String) {
        if let path = Bundle.main.path(forResource: file, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                jokes = data.components(separatedBy: .newlines)
                jokes.removeLast()
            } catch {
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let allViewsInXibArray = Bundle.main.loadNibNamed(viewTypeString, owner: self, options: nil)
        let myView = allViewsInXibArray?.first as! UIView
        main = myView.subviews[0] as! UILabel
        ans = myView.subviews[1] as! UILabel
        nextButton = myView.subviews[2] as! UIButton
        nextButton.addTarget(self, action: #selector(nextJoke), for: UIControlEvents.touchUpInside)
        myView.frame = self.view.bounds
        self.view.addSubview(myView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

