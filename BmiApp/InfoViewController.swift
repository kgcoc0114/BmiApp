//
//  InfoViewController.swift
//  BmiApp
//
//  Created by Kgcoc on 2021/12/8.
//

import UIKit

class InfoViewController: UIViewController {
    let genderBottonColor=UIColor(red: 39/255, green: 43/255, blue: 76/255, alpha: 0.9)
    var gender="Male"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        femaleBotton.backgroundColor=genderBottonColor
        maleButton.backgroundColor=genderBottonColor
        maleButton.isSelected=true
        weightStepper.value=53
        ageStepper.value=20
     
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleBotton: UIButton!
    @IBOutlet weak var heightText: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var ageText: UILabel!
    @IBOutlet weak var weightStepper: UIStepper!
    @IBOutlet weak var ageStepper: UIStepper!
    @IBOutlet weak var weightText: UILabel!
    @IBAction func weightChanged(_ sender: UIStepper) {
        weightText.text=String(Int(weightStepper.value))
    }
    @IBAction func ageChanged(_ sender: UIStepper) {
        ageText.text=String(Int(ageStepper.value))
    }
    
    @IBAction func heightChanged(_ sender: UISlider) {
        heightText.text=String(format: "%.0f", round(heightSlider.value))
    }
    
    @IBAction func selectMale(_ sender: Any) {
        if(maleButton.isSelected == false){
            maleButton.isSelected = true
            femaleBotton.isSelected=false
            gender="Male"
        }
    }
    
    @IBAction func selectFemale(_ sender: Any) {
        if(femaleBotton.isSelected == false){
            maleButton.isSelected = false
            femaleBotton.isSelected = true
            gender="Female"
        }
    }
    
    @IBSegueAction func bmiCalculater(_ coder: NSCoder) -> ResultViewController? {
        
        return ResultViewController(coder: coder,
                                    bmiInfo: BmiInfo(weight: weightStepper.value, height: Double(heightSlider.value), age: Double(ageStepper.value), gender: gender))
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
