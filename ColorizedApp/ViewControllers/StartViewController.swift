//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Alexander Grishin on 12.10.2022.
//

import UIKit

protocol SettingsViewControllerDelegate{
    func setNewColor(redColor: Float, greenColor: Float, blueColor: Float)
}

class StartViewController: UIViewController {
    
    var redValue: Float = 1
    var greenValue: Float = 1
    var blueValue: Float = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeVCColor()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.redValue = redValue
        settingsVC.greenValue = greenValue
        settingsVC.blueValue = blueValue
    }
    
    private func changeVCColor() {
        view.backgroundColor = UIColor(
            red: CGFloat(redValue),
            green: CGFloat(greenValue),
            blue: CGFloat(blueValue),
            alpha: 1
        )
    }
    
}

// MARK: - SettingsViewControllerDelegate
extension StartViewController: SettingsViewControllerDelegate {
    func setNewColor(redColor: Float, greenColor: Float, blueColor: Float) {
        redValue = redColor
        greenValue = greenColor
        blueValue = blueColor
    }
}
