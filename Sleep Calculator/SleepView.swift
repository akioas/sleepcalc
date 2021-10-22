import Foundation
import UIKit

// 1 экран

class firstScreen: UIViewController {
    @IBOutlet weak var firstCycleClock: UILabel!
    @IBOutlet weak var secondCycleClock: UILabel!
    @IBOutlet weak var thirdCycleClock: UILabel!
    @IBOutlet weak var fourthCycleClock: UILabel!
    @IBOutlet weak var fifthCycleClock: UILabel!
    @IBOutlet weak var sixthCycleClock: UILabel!
    
    
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var backButton: UIButton!

    @IBAction func doBack(sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }


// 2 экран
class SecondScreen: UIViewController {
    @IBOutlet weak var firstCycleClock: UILabel!
    @IBOutlet weak var secondCycleClock: UILabel!
    @IBOutlet weak var thirdCycleClock: UILabel!
    @IBOutlet weak var fourthCycleClock: UILabel!
    @IBOutlet weak var fifthCycleClock: UILabel!
    @IBOutlet weak var sixthCycleClock: UILabel!
    
    
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var backButton: UIButton!

    @IBAction func doBack(sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
