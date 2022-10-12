//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Alexander Grishin on 11.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 20
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
