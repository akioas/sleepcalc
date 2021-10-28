import UIKit


// 1 экран

class firstScreen: UIViewController {
    @IBOutlet weak var oneFirstCycleClock: UILabel!
    @IBOutlet weak var oneSecondCycleClock: UILabel!
    @IBOutlet weak var oneThirdCycleClock: UILabel!
    @IBOutlet weak var oneFourthCycleClock: UILabel!
    @IBOutlet weak var oneFifthCycleClock: UILabel!
    @IBOutlet weak var oneSixthCycleClock: UILabel!
    
    
    @IBAction func doBack(_ sender: UIButton) {

        self.dismiss(animated: true, completion: nil)

    }
   
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
        var lastHour = 99
        var lastMinute = 99
        let date = Date()
        let timeReturn = timeModel().getHoursMinutes(dateSource: date)
        
        let hours = timeReturn.hours
        let minutes = timeReturn.minutes
        let newDataString = timeReturn.newDataString
        
        
        if hours != lastHour || minutes != lastMinute {
            lastHour = hours!
            lastMinute = minutes!
            for clocksCycle in 0...5 {
            clocks[clocksCycle]!.text = firstModel().hoursTimeCalc(hours: hours!, minutes: minutes!, timeToAdd: (105 + 90 * clocksCycle), amOrPm: newDataString)
            }
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
        
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBAction func doBack(_ sender: UIButton) {

        self.dismiss(animated: true, completion: nil)

    }
    
    
    var timer = Timer()
        var clocks: Dictionary<Int, UILabel> = [:]
        override func viewDidLoad() {
            super.viewDidLoad()
            let backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
            navigationItem.backBarButtonItem = backBarButtonItem
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
            
            clocks = [
            0: twoFirstCycleClock,
            1: twoSecondCycleClock,
            2: twoThirdCycleClock,
            3: twoFourthCycleClock,
            4: twoFifthCycleClock,
            5: twoSixthCycleClock,
            ]
            
            self.tick()
        }
    
    
    @objc func tick() {
        var lastHour = 99
        var lastMinute = 99
        
        let timeReturn = timeModel().getHoursMinutes(dateSource: timePicker.date)
        
        let hours = timeReturn.hours
        let minutes = timeReturn.minutes
        let newDataString = timeReturn.newDataString
        
            if hours != lastHour || minutes != lastMinute {
                print(hours!, minutes!)
                lastHour = hours!
                lastMinute = minutes!
                for clocksCycle in 0...5 {
                clocks[clocksCycle]!.text = secondModel().hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: (-105 - 90 * clocksCycle), amOrPm: newDataString)
                }
            }
        }
}
