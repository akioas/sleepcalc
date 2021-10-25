import Foundation
import UIKit

// 1 экран

class firstScreen: UIViewController {
    @IBOutlet weak var oneFirstCycleClock: UILabel!
    @IBOutlet weak var oneSecondCycleClock: UILabel!
    @IBOutlet weak var oneThirdCycleClock: UILabel!
    @IBOutlet weak var oneFourthCycleClock: UILabel!
    @IBOutlet weak var oneFifthCycleClock: UILabel!
    @IBOutlet weak var oneSixthCycleClock: UILabel!
    
    
    @IBOutlet weak var oneBackButton: UIButton!

    @IBAction func doBack(sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }


// 2 экран
class SecondScreen: UIViewController {
    @IBOutlet weak var twoFirstCycleClock: UILabel!
    @IBOutlet weak var twoSecondCycleClock: UILabel!
    @IBOutlet weak var twoThirdCycleClock: UILabel!
    @IBOutlet weak var twoFourthCycleClock: UILabel!
    @IBOutlet weak var twoFifthCycleClock: UILabel!
    @IBOutlet weak var twoSixthCycleClock: UILabel!
        
    
    @IBOutlet weak var twoTimePicker: UIDatePicker!
    
    @IBOutlet weak var twoBackButton: UIButton!

//    @IBAction func doBack(sender: UIButton) {
//        _ = navigationController?.popViewController(animated: true)
//    }
