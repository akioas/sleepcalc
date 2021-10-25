import Foundation
import UIKit



class firstModel {
    
    func hoursTimeCalc(hours: Int, minutes: Int, timetoadd: Int, cycle: Int, ampm: String, clocks: Dictionary<Int, UILabel>) {
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
                           clocks[cycle-1]!.text = "\(newHours):0\(newMinutes) \(newAmpm)"
                       }
                       else {
                           clocks[cycle-1]!.text = "\(newHours):\(newMinutes) \(newAmpm)"
                       }

        }
        else {

            if newHours>=24 {
                newHours = newHours - 24
            }


                 if newMinutes < 10 {
                     clocks[cycle-1]!.text = "\(newHours):0\(newMinutes)"
                 }
                 else {
                     clocks[cycle-1]!.text = "\(newHours):\(newMinutes)"
                 }
             }
    }
    
}
