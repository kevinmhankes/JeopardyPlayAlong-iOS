//
//  ViewController.swift
//  JeopardyPlayAlong
//
//  Created by Kevin Hankes on 4/25/18.
//  Copyright © 2018 Kevin Hankes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amount200: UIButton!
    @IBOutlet weak var amount400: UIButton!
    @IBOutlet weak var amount600: UIButton!
    @IBOutlet weak var amount800: UIButton!
    @IBOutlet weak var amount1000: UIButton!
    
    @IBAction func dailyDouble(_ sender: UIButton) {
        
    }
    @IBAction func amount(_ sender: UIButton) {
        let buttonAmount = Int(sender.currentTitle!)!
        let currentAmount = amountValue
        amountValue = buttonAmount + currentAmount
    }
    
    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        guard let button = sender.view as? UIButton else { return }
        switch sender.state {
        case .began:
            let buttonAmount = -Int(button.currentTitle!)!
            let currentAmount = amountValue
            amountValue = buttonAmount + currentAmount
        default:
            break
        }
    }
    
    private var amountValue: Int {
        get {
            // necesary check if inital label value is only one character
            if amountLabel.text!.count > 1 {
                let textWithoutDollarSign = String(amountLabel.text!.dropFirst())
                print("\(textWithoutDollarSign)")
                return Int(textWithoutDollarSign)!
            } else {
                return Int(amountLabel.text!)!
            }
            
        }
        set {
            amountLabel.text = "$" + String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountLabel.text = "0"
        let buttons: [UIButton?] = [amount200, amount400, amount600, amount800, amount1000]
        for button in buttons {
            let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(_:)))
            button?.addGestureRecognizer(longGesture)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
