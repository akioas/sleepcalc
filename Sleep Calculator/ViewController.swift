import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}










import UIKit


class SleepAppViewController: UIViewController {
    
    @IBOutlet weak var firstCycleClock: UILabel!
    @IBOutlet weak var secondCycleClock: UILabel!
    @IBOutlet weak var thirdCycleClock: UILabel!
    @IBOutlet weak var fourthCycleClock: UILabel!
    @IBOutlet weak var fifthCycleClock: UILabel!
    @IBOutlet weak var sixthCycleClock: UILabel!
    
    @IBOutlet weak var backButton: UIButton!

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
        clocks = [
        0: firstCycleClock,
        1: secondCycleClock,
        2: thirdCycleClock,
        3: fourthCycleClock,
        4: fifthCycleClock,
        5: sixthCycleClock,
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
                    hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 105, cycle: 1, ampm: newDataString)
                    hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 195, cycle: 2, ampm: newDataString)
                    hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 285, cycle: 3, ampm: newDataString)
                    hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 375, cycle: 4, ampm: newDataString)
                    hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 465, cycle: 5, ampm: newDataString)
                    hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 555, cycle: 6, ampm: newDataString)
        }
    }
    func hoursTimeCalc(hours: Int, minutes: Int, timetoadd: Int, cycle: Int, ampm: String) {
        var newMinutes = timetoadd+minutes
        var newHours = hours+(newMinutes/60)
        if newMinutes>59 {
            newMinutes = newMinutes%60
        }
        let formatter = DateFormatter()
        let preferredLanguage = Locale.preferredLanguages[0] as String
        formatter.locale = Locale(identifier:  preferredLanguage)
        let dateFormat = DateFormatter.dateFormat(fromTemplate:"j", options: 0, locale: formatter.locale)!
        var am = 0
        if dateFormat.range(of: "a") != nil {
            am = 1 //12-часовой
        }
        var o = 0
        if am == 1 {
            var newAmpm = ""
             let amtext = NSLocalizedString("AM", comment: "AM")
             let pmtext = NSLocalizedString("PM", comment: "PM")
            
            if newHours>=12 {
                newHours = newHours - 12
                if newHours==0 {
                    newHours = 12
                }
                if newHours>=12 {
                    newHours = newHours - 12
                    o = 1
                    
                }
                if o == 0 {
                    
                    if ampm == "PM" {
                        newAmpm = amtext
                    }
                    else {
                        newAmpm = pmtext
                    }
                }
                else
                    if ampm == "PM" {
                        newAmpm = pmtext
                    }
                    else {
                        newAmpm = amtext
                }
                
            }
            else {
                newAmpm = amtext
            }
            
            if newMinutes < 10 {
                           self.clocks[cycle-1]!.text = "\(newHours):0\(newMinutes) \(newAmpm)"
                       }
                       else {
                           self.clocks[cycle-1]!.text = "\(newHours):\(newMinutes) \(newAmpm)"
                       }
            
        }
        else {
            
            if newHours>=24 {
                newHours = newHours - 24
            }
            
             
                 if newMinutes < 10 {
                     self.clocks[cycle-1]!.text = "\(newHours):0\(newMinutes)"
                 }
                 else {
                     self.clocks[cycle-1]!.text = "\(newHours):\(newMinutes)"
                 }
             }
    }
}
















import Foundation
import UIKit
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
    
    var timer = Timer()
    var clocks: Dictionary<Int, UILabel> = [:]
    var lastHour = 99
    var lastMinute = 99
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
        
        clocks = [
        0: firstCycleClock,
        1: secondCycleClock,
        2: thirdCycleClock,
        3: fourthCycleClock,
        4: fifthCycleClock,
        5: sixthCycleClock,
        ]
        
        self.tick()
    }
    
    @objc func tick() {
        let formatter = DateFormatter()
        let preferredLanguage = Locale.preferredLanguages[0] as String
        
        formatter.locale = Locale(identifier:  preferredLanguage)
        
        formatter.dateFormat = "HH:mm"
        let dateString = formatter.string(from: timePicker.date)
        
        let time = dateString.split(separator: ":")
       
        
        let newDataString = formatter.string(from: timePicker.date)
        let hours = Int(time[0])
        let minutes = Int(time[1])
        if hours != lastHour || minutes != lastMinute {
            print(hours!, minutes!)
            lastHour = hours!
            lastMinute = minutes!
            
            hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: -105, cycle: 1, ampm: newDataString)
            hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: -195, cycle: 2, ampm: newDataString)
            hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: -285, cycle: 3, ampm: newDataString)
            hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: -375, cycle: 4, ampm: newDataString)
            hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: -465, cycle: 5, ampm: newDataString)
            hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: -555, cycle: 6, ampm: newDataString)
        }
    }
    func hoursTimeCalc(hours: Int, minutes: Int, timetoadd: Int, cycle: Int, ampm: String) {
        var newMinutes = timetoadd+minutes
        var newHours = hours+(newMinutes/60)
        if newMinutes<1 {
            newHours = newHours - 1
            newMinutes = 60 + newMinutes%60
        }
        if newMinutes==60 {
            newHours = newHours + 1
            newMinutes = 0
        }
        let formatter = DateFormatter()
        let preferredLanguage = Locale.preferredLanguages[0] as String
        formatter.locale = Locale(identifier:  preferredLanguage)
        let dateFormat = DateFormatter.dateFormat(fromTemplate:"j", options: 0, locale: formatter.locale)!
        var am = 0
        if dateFormat.range(of: "a") != nil {
            am = 1 //12-часовой
        }
        if am == 1{
            var newAmpm = ""
            let amtext = NSLocalizedString("AM", comment: "AM")
            let pmtext = NSLocalizedString("PM", comment: "PM")
            if newHours<0 {
                newHours = newHours + 12
                if newHours==0 {
                    newHours = 12
                }
                if ampm == "PM" {
                    newAmpm = amtext
                }
                else {
                    newAmpm = pmtext
                }
            }
            else {
                newAmpm = amtext
            }
            if newMinutes < 10 {
                self.clocks[cycle-1]!.text = "\(newHours):0\(newMinutes) \(newAmpm)"
            }
            else {
                self.clocks[cycle-1]!.text = "\(newHours):\(newMinutes) \(newAmpm)"
            }
        }
        else
        {
            if newHours<0 {
                newHours = newHours + 24
            }
            if newMinutes < 10 {
                self.clocks[cycle-1]!.text = "\(newHours):0\(newMinutes)"
            }
            else {
                self.clocks[cycle-1]!.text = "\(newHours):\(newMinutes)"
            }
        }
    }
}



