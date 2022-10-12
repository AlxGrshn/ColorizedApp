//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Alexander Grishin on 11.10.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var color: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        colorView.layer.cornerRadius = 20
        
        setSliderPosition()
        changeColorView()
        setValue()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        changeColorView()
        switch sender {
        case redSlider: redLabel.text = redSlider.value.roundFloat()
        case greenSlider: greenLabel.text = blueSlider.value.roundFloat()
        default: blueLabel.text = greenSlider.value.roundFloat()
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    private func setSliderPosition() {
        let colorFromStartVC = CIColor(color: color)
        
        redSlider.value = Float(colorFromStartVC.red)
        greenSlider.value = Float(colorFromStartVC.green)
        blueSlider.value = Float(colorFromStartVC.blue)
    }
    
    private func changeColorView() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue() {
        redLabel.text = redSlider.value.roundFloat()
        greenLabel.text = greenSlider.value.roundFloat()
        blueLabel.text = blueSlider.value.roundFloat()
    }
}

extension Float {
    func roundFloat() -> String {
        String(format: "%.2f", self)
    }
}
