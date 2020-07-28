

import UIKit


class SleepAppViewController: UIViewController {
    
    @IBOutlet weak var firstCycleClock: UILabel!
    @IBOutlet weak var secondCycleClock: UILabel!
    @IBOutlet weak var thirdCycleClock: UILabel!
    @IBOutlet weak var fourthCycleClock: UILabel!
    @IBOutlet weak var fifthCycleClock: UILabel!
    @IBOutlet weak var sixthCycleClock: UILabel!

    
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
        print(time[0])
        print(time[1])
        
        
        let newDataString = formatter.string(from: Date())
        let hours = Int(time[0])
        let minutes = Int(time[1])
        hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 105, cycle: 1, ampm: newDataString)
        hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 195, cycle: 2, ampm: newDataString)
        hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 285, cycle: 3, ampm: newDataString)
        hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 375, cycle: 4, ampm: newDataString)
        hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 465, cycle: 5, ampm: newDataString)
        hoursTimeCalc(hours: hours!, minutes: minutes!, timetoadd: 555, cycle: 6, ampm: newDataString)
        
        
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
        if am == 1{
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
            
            if newMinutes < 10{
                           self.clocks[cycle-1]!.text = "\(newHours):0\(newMinutes) \(newAmpm)"
                       }
                       else {
                           self.clocks[cycle-1]!.text = "\(newHours):\(newMinutes) \(newAmpm)"
                       }
            
        }
        else
        {
            
            if newHours>=24 {
                newHours = newHours - 24
            }
            
             
                 if newMinutes < 10{
                     self.clocks[cycle-1]!.text = "\(newHours):0\(newMinutes)"
                 }
                 else {
                     self.clocks[cycle-1]!.text = "\(newHours):\(newMinutes)"
                 }
             }}
}

