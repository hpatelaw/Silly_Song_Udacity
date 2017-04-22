//
//  ViewController.swift
//  Silly Song
//
//  Created by Hemal Patel on 4/21/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",

    "<FULL_NAME>"].joined(separator: "\n")

func shortNameForName(name: String) -> String {
    var lowercaseName = name.lowercased()
    //let lowercaseName = lowercaseName1.folding(options: .diacriticInsensitive, locale: .current)
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    if let vowelSet = lowercaseName.rangeOfCharacter(from: vowelSet, options: .caseInsensitive){
        // print(type(of: vowelSet))
        lowercaseName = lowercaseName.substring(from: vowelSet.lowerBound)
    }
    return lowercaseName
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameForName(name: fullName)
    // print(shortName)
    var lyricsTemplate = lyricsTemplate
    
    lyricsTemplate = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    print(lyricsTemplate)
    return lyricsTemplate
}

class ViewController: UIViewController {
    
   
    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var viewLyrics: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
          nameField.delegate = self
     
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        viewLyrics.text = ""
    }
   
    @IBAction func displayLyrics(_ sender: Any) {
        viewLyrics.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
    }
  
  
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
}
}

