//
//  ViewController.swift
//  prime number
//
//  Created by 周世婧 on 2018/12/13.
//  Copyright © 2018 周世婧. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var resultLable: UILabel!
    override var preferredStatusBarStyle:UIStatusBarStyle{
        return .lightContent
    }
    
    @IBAction func doThePrimeText(_ sender: UIButton) {
        if let inputText = inputTextField.text{
            if let inputNumber = Int(inputText){
                checkPrime(withnumber: inputNumber){
                    self.resultLable.text = $0
                    self.resultLable.isHidden = false
                }
            }
        }
        inputTextField.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func checkPrime(withNumber testNumber:Int) -> String{
        var isPrime:Bool? = true
        if testNumber <= 0{
            isPrime = nil
        }
        else if testNumber == 1{
            isPrime = false
        }
        else{
            for i in 2..<testNumber{
                if(testNumber % i == 0){
                    isPrime = false
                    break
                }
            }
        }
        if isPrime == true{
            return "\(testNumber) is prime"
        }
        else if isPrime == false{
            return "\(testNumber) is not prime"
        }
        else{
            return "Please enter a number greater tha 0"
        }
    }
    func checkPrime(withnumber number:Int,andCompletionhandler handler:(String) -> ()){
        handler(checkPrime(withNumber: number))
    }
}

