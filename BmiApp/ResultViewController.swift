//
//  ResultViewController.swift
//  BmiApp
//
//  Created by Kgcoc on 2021/12/8.
//

import UIKit

class ResultViewController: UIViewController {
//    let weight:Double
//    let height:Double
//    let gender:String
    var bmi:Double
    
    var bmiInfo:BmiInfo

    init?(coder: NSCoder,bmiInfo:BmiInfo) {
        self.bmiInfo=bmiInfo

        self.bmi=self.bmiInfo.weight/pow((self.bmiInfo.height/100), 2)
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    @IBOutlet weak var interpretationText: UILabel!
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var bmiValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateResult()

        // Do any additional setup after loading the view.
    }
    func getResult()->String {
        if ( self.bmi >= 25) {
          return "Overweight"
        } else if (self.bmi > 18.5) {
          return "Normal"
        } else {
          return "Underweight"
        }
      }

    func getInterpretation() ->String{
        if (self.bmi >= 25) {
          return "You have a higher than normal body weight. Try to exercise more."
        } else if (self.bmi >= 18.5) {
          return "You have a normal body weight. Good job!"
        } else {
          return "You have a lower than normal body weight. You can eat a bit more."
        }
    }
    func getResultColor() ->UIColor{
        if (self.bmi >= 25) {
          return UIColor(red: 255/255, green: 48/255,
                         blue: 48/255, alpha: 0.9)
        } else if (self.bmi >= 18.5) {
          return UIColor(red: 202/255, green: 255/255,
                         blue: 121/255, alpha: 0.9)
        } else {
          return UIColor(red: 255/255, green: 251/255,
                         blue: 0/255, alpha: 0.9)
        }
    }
    
    func updateResult(){
       
        bmiValue.text=String(format: "%.1f",self.bmi)
        resultText.text=getResult()
        resultText.textColor = getResultColor()

        interpretationText.text=getInterpretation()
        
    }
    

    
}
