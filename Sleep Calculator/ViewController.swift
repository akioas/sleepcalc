import UIKit

//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//
//}



// 1 экран

class firstScreen: UIViewController {
    @IBOutlet weak var oneFirstCycleClock: UILabel!
    @IBOutlet weak var oneSecondCycleClock: UILabel!
    @IBOutlet weak var oneThirdCycleClock: UILabel!
    @IBOutlet weak var oneFourthCycleClock: UILabel!
    @IBOutlet weak var oneFifthCycleClock: UILabel!
    @IBOutlet weak var oneSixthCycleClock: UILabel!
    
    
    @IBOutlet weak var doBack: UIButton!
    @IBOutlet weak var oneBackButton: UIButton!

    @IBAction func doBack(sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
        var lastHour = 99
        var lastMinute = 99
        var timer = Timer()
        var clocks: Dictionary<Int, UILabel> = [:]
        override func viewDidLoad() {
            super.viewDidLoad()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
            self.clocks = [
            0: oneFirstCycleClock,
            1: oneSecondCycleClock,
            2: oneThirdCycleClock,
            3: oneFourthCycleClock,
            4: oneFifthCycleClock,
            5: oneSixthCycleClock,
            ]
            self.tick()
            
            
        }
    
    @objc func tick() {
            let formatter = DateFormatter()
            let preferredLanguage = Locale.preferredLanguages[0] as String
            formatter.locale = Locale(identifier:  preferredLanguage)
            formatter.dateFormat = "HH:mm"
     
            let dateString = formatter.string(from: Date())
            
            let time = dateString.split(separator: ":")
            
            
            let newDataString = formatter.string(from: Date())
            let hours = Int(time[0])
            let minutes = Int(time[1])
            if hours != lastHour || minutes != lastMinute {
                       print(hours!, minutes!)
                       lastHour = hours!
                       lastMinute = minutes!
                firstModel().hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 105, cycle: 1, ampm: newDataString, clocks: clocks)
                firstModel().hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 195, cycle: 2, ampm: newDataString, clocks: clocks)
                firstModel().hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 285, cycle: 3, ampm: newDataString, clocks: clocks)
                firstModel().hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 375, cycle: 4, ampm: newDataString, clocks: clocks)
                firstModel().hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 465, cycle: 5, ampm: newDataString, clocks: clocks)
                firstModel().hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 555, cycle: 6, ampm: newDataString, clocks: clocks)
            }
        }
    


}

// 2 экран

class secondScreen: UIViewController {
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
    
   
}
