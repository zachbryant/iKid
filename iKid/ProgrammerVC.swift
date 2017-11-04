//
//  ProgrammerVC.swift
//  iKid
//
//  Created by iGuest on 11/2/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import UIKit

class ProgrammerVC: UIViewController {
    var comics: [String] = []
    var index: Int = -1
    weak var nextButton: UIButton!
    weak var comicView: UIImageView!
    var viewTypeString: String = "ComicView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let allViewsInXibArray = Bundle.main.loadNibNamed(viewTypeString, owner: self, options: nil)
        let myView = allViewsInXibArray?.first as! UIView
        comicView = myView.subviews[0] as! UIImageView
        nextButton = myView.subviews[1] as! UIButton
        nextButton.addTarget(self, action: #selector(nextJoke), for: UIControlEvents.touchUpInside)
        myView.frame = self.view.bounds
        self.view.addSubview(myView)
        loadData("programmerjokes")
        nextJoke()
    }
    
    func loadData(_ file: String) {
        if let path = Bundle.main.path(forResource: file, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                comics = data.components(separatedBy: .newlines)
                comics.removeLast()
            } catch {
                print(error)
            }
        }
    }
    
    @objc func nextJoke() {
        index = index + 1
        if index >= comics.count {
            index = 0
        }
        comicView.image = UIImage(named: comics[index])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
