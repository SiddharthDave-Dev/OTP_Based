//
//  ViewController.swift
//  OTP_Based
//
//  Created by Siddharth Dave on 27/07/23.
//

import UIKit

class ViewController: UIViewController {

    var secound = 0
    var otp = 0
    var timer = Timer()
    var mytimer = 0
    var alertTime = 0
    @IBOutlet weak var alertmess: UILabel!
    @IBOutlet weak var otptxtfield: UITextField!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var generatebtn: UIButton!
    @IBOutlet weak var resetlabel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        second.text = "0:0"
        resetlabel.isHidden = true
        alertmess.isHidden = true
    }
    
    func generateRandomOTP() {
            otp = Int.random(in: 0...10)
            alertTime = Int.random(in: 0...35)
            print(alertTime)
    }
    
    func startTimer() {
            timer.invalidate()
            second.text = "0:0"
            secound = 0
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.myaction), userInfo: nil, repeats: true)
        }
    
    @IBAction func generateOtp(_ sender: Any) {
        generateRandomOTP()
        startTimer()
    }
    
    @IBAction func resetbtn(_ sender: Any) {
        generateRandomOTP()
        startTimer()
    }

    
    @objc func myaction()
    {
        secound += 1
        second.text = "0:"+String(secound)
        if secound == alertTime
        {
            let alert = UIAlertController(title: "OTP", message: String(otp), preferredStyle: .alert)
            
            let okbtn = UIAlertAction(title: "OK", style: .cancel)
            
            alert.addAction(okbtn)
            
            self.present(alert, animated: true)
            timer.invalidate()
            second.text = "0:0"
            secound = 0
        }
        else if secound == 30
        {
            alertmess.isHidden = false
            resetlabel.isHidden = false
            timer.invalidate()
            second.text = "0:"+String(secound)
            secound = 0
        }
    }
    
    @IBAction func submitbtn(_ sender: Any) {
        let verify = otptxtfield.text!
        
        if otp == Int(verify)
        {
            let alert = UIAlertController(title: "Verification Process", message: "You Verified", preferredStyle: .alert)
            
            let okbtn = UIAlertAction(title: "OK", style: .cancel)
            
            alert.addAction(okbtn)
            
            self.present(alert, animated: true)
        }
        else
        {
            let alert = UIAlertController(title: "Verification Process", message: "OTP is not correct plz try again", preferredStyle: .alert)
            
            let okbtn = UIAlertAction(title: "OK", style: .cancel)
            
            alert.addAction(okbtn)
            
            self.present(alert, animated: true)
        }
    }
}

