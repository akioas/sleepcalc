

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
    
    var timer = Timer()
    var clocks: Dictionary<Int, UILabel> = [:]
    
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
        hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: -105, cycle: 1, ampm: newDataString)
        hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: -195, cycle: 2, ampm: newDataString)
        hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: -285, cycle: 3, ampm: newDataString)
        hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: -375, cycle: 4, ampm: newDataString)
        hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: -465, cycle: 5, ampm: newDataString)
        hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: -555, cycle: 6, ampm: newDataString)
        
        
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
            if newHours<0 {
                newHours = newHours + 12
                if newHours==0 {
                    newHours = 12
                }
                if ampm == "PM"{
                    newAmpm = "AM"
                }
                else {
                    newAmpm = "PM"
                }
            }
            else {
                newAmpm = "AM"
            }
            if newMinutes < 10{
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
            if newMinutes < 10{
                self.clocks[cycle-1]!.text = "\(newHours):0\(newMinutes)"
            }
            else {
                self.clocks[cycle-1]!.text = "\(newHours):\(newMinutes)"
            }
        }}
}
