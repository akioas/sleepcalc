import Foundation
import UIKit



class firstModel {
    
    func hoursTimeCalc(hours: Int, minutes: Int, timeToAdd: Int, amOrPm: String) -> (String) {
        var newMinutes = timeToAdd+minutes
        var newHours = hours+(newMinutes/60)

        if newMinutes>59 {
            newMinutes = newMinutes%60
        }

        let dateFormat = dateFormatFunc()
        var am = false
        var text: String
        if dateFormat.range(of: "a") != nil {
            am = true //12-часовой
        }
        var MoreThanTwelveH = 0
        if am == true {
            var newAmpm = ""
             let amText = NSLocalizedString("AM", comment: "AM")
             let pmText = NSLocalizedString("PM", comment: "PM")
            
            if newHours>=12 {
                newHours = newHours - 12
                if newHours==0 {
                    newHours = 12
                }
                if newHours>=12 {
                    newHours = newHours - 12
                    MoreThanTwelveH = 1
                    
                }
                if MoreThanTwelveH == 0 {
                    
                    if amOrPm == "PM" {
                        newAmpm = amText
                    }
                    else {
                        newAmpm = pmText
                    }
                }
                else
                    if amOrPm == "PM" {
                        newAmpm = pmText
                    }
                    else {
                        newAmpm = amText
                }
                
            }
            else {
                newAmpm = amText
            }
            
            
            if newMinutes < 10 {
                           text = "\(newHours):0\(newMinutes) \(newAmpm)"
                       }
                       else {
                           text = "\(newHours):\(newMinutes) \(newAmpm)"
                       }

        }
        else {

            if newHours>=24 {
                newHours = newHours - 24
            }


                 if newMinutes < 10 {
                     text = "\(newHours):0\(newMinutes)"
                 }
                 else {
                     text = "\(newHours):\(newMinutes)"
                 }
             }
        return text
    }
    
}



class secondModel {
    
    func hoursTimeCalc(hours: Int, minutes: Int, timetoadd: Int, ampm: String) -> (String){

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
        let dateFormat = dateFormatFunc()
                var am = false
                var text: String

                if dateFormat.range(of: "a") != nil {
                    am = true //12-часовой
                }
                if am == true{
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
                        text = "\(newHours):0\(newMinutes) \(newAmpm)"
                    }
                    else {
                        text = "\(newHours):\(newMinutes) \(newAmpm)"
                    }
                }
                else
                {
                    if newHours<0 {
                        newHours = newHours + 24
                    }
                    if newMinutes < 10 {
                        text = "\(newHours):0\(newMinutes)"
                    }
                    else {
                        text = "\(newHours):\(newMinutes)"
                    }
                }
        return text
    }
}


class timeModel {
    func getHoursMinutes (dateSource: Date) -> (hours: Int?, minutes: Int?, newDataString: String) {
        let formatter = DateFormatter()
        let preferredLanguage = Locale.preferredLanguages[0] as String
        
        formatter.locale = Locale(identifier:  preferredLanguage)
        
        formatter.dateFormat = "HH:mm"
        let dateString = formatter.string(from: dateSource)
        
        let time = dateString.split(separator: ":")
       
        
        let newDataString = formatter.string(from: dateSource)
        let hours = Int(time[0])
        let minutes = Int(time[1])
        return (hours, minutes, newDataString)
    }
}


func dateFormatFunc() -> (String) {
    let formatter = DateFormatter()
    let preferredLanguage = Locale.preferredLanguages[0] as String
    formatter.locale = Locale(identifier:  preferredLanguage)
    let dateFormat = DateFormatter.dateFormat(fromTemplate:"j", options: 0, locale: formatter.locale)!
    return dateFormat
}
