//
//  ViewController.swift
//  Color Picker
//
//  Created by admin2 on 25.03.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    
    @IBOutlet weak var redField: UITextField!
    @IBOutlet weak var greenField: UITextField!
    @IBOutlet weak var blueField: UITextField!
    
    @IBOutlet weak var doneButton: UIButton!
    
    func viewColor() {
        colorView.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        doneButton.isHidden = true
        colorView.layer.cornerRadius = 10
       
    }

    @IBAction func redSliderChanged(_ sender: Any) {
        redValue.text = String(format: "%.2f", redSlider.value)
        redField.text = String(format: "%.2f", redSlider.value)
        viewColor()
    }
    @IBAction func greenSliderChanged(_ sender: Any) {
        greenValue.text = String(format: "%.2f", greenSlider.value)
        greenField.text = String(format: "%.2f", greenSlider.value)
        viewColor()
    }
    @IBAction func blueSliderChanged(_ sender: Any) {
        blueValue.text = String(format: "%.2f", blueSlider.value)
        blueField.text = String(format: "%.2f", blueSlider.value)
        viewColor()
    }
    
    @IBAction func redFieldTouched(_ sender: Any) {
        doneButton.isHidden = false
    }
    @IBAction func greenFieldTouched(_ sender: Any) {
        doneButton.isHidden = false
    }
    @IBAction func blueFieldTouched(_ sender: Any) {
        doneButton.isHidden = false
    }
    @IBAction func doneTouched(_ sender: Any) {
        UIApplication.shared.endEditing()
        doneButton.isHidden = true
        guard let inputRed = redField.text, !inputRed.isEmpty else { return }
        if (redField.text! as NSString).floatValue > 1 {
            redSlider.value = 1
            redField.text = "1"
            redValue.text = "1.00"
        } else {
        redSlider.value = (redField.text! as NSString).floatValue
        redValue.text = String(format: "%.2f", (redField.text! as NSString).floatValue)
        }
        guard let inputGreen = greenField.text, !inputGreen.isEmpty else { return }
        if (greenField.text! as NSString).floatValue > 1 {
            greenSlider.value = 1
            greenField.text = "1"
            greenValue.text = "1.00"
        } else {
        greenSlider.value = (greenField.text! as NSString).floatValue
        greenValue.text = String(format: "%.2f", (greenField.text! as NSString).floatValue)
        }
        guard let inputBlue = blueField.text, !inputBlue.isEmpty else { return }
        if (blueField.text! as NSString).floatValue > 1 {
            blueSlider.value = 1
            blueField.text = "1"
            blueValue.text = "1.00"
        } else {
        blueSlider.value = (blueField.text! as NSString).floatValue
        blueValue.text = String(format: "%.2f", (blueField.text! as NSString).floatValue)
        }
        viewColor()
    }
   
    @IBAction func screenTouched(_ sender: Any) {
        redField.resignFirstResponder()
        greenField.resignFirstResponder()
        blueField.resignFirstResponder()
    }
    
}
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
