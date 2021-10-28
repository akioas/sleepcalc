import Foundation
import UIKit



class firstModel {
    
    func hoursTimeCalc(hours: Int, minutes: Int, timeToAdd: Int, amOrPm: String) -> (String) {
        var newMinutes = timeToAdd + minutes
        var newHours = hours + (newMinutes / 60)

        if newMinutes > 59 {
            newMinutes = newMinutes % 60
        }

        let dateFormat = timeModel().dateFormatFunc()
        var am = false
        var text = ""
        if dateFormat.range(of: "a") != nil {
            am = true //12-часовой
        }
        var MoreThanTwelveH = 0
        if am == true {
            var newAmpm = ""
            
            if newHours >= 12 {
                newHours = newHours - 12
                if newHours == 0 {
                    newHours = 12
                }
                if newHours >= 12 {
                    newHours = newHours - 12
                    MoreThanTwelveH = 1
                    
                }
                if MoreThanTwelveH == 0 {

                    newAmpm = changeAmText(from: amOrPm)
                }
                else {

                    newAmpm = keepAmText(from: amOrPm)
                }
                
            }
            else {
                newAmpm = textProperty().amText
            }

            text = newMinutesText(Hours: newHours, Minutes: newMinutes, Ampm: newAmpm)

        }
        else {

            if newHours >= 24 {
                newHours = newHours - 24
            }

            text = newMinutesText(Hours: newHours, Minutes: newMinutes, Ampm: "")
             }
        return text
    }
    
}



class secondModel {
    
    func hoursTimeCalc(hours: Int, minutes: Int, timetoadd: Int, amOrPm: String) -> (String){

        var newMinutes = timetoadd+minutes
                var newHours = hours+(newMinutes / 60)
                if newMinutes < 1 {
                    newHours = newHours - 1
                    newMinutes = 60 + newMinutes % 60
                }
                if newMinutes == 60 {
                    newHours = newHours + 1
                    newMinutes = 0
                }
        let dateFormat = timeModel().dateFormatFunc()
                var am = false
                var text = ""

                if dateFormat.range(of: "a") != nil {
                    am = true //12-часовой
                }
                if am == true{
                    var newAmpm = ""
                    if newHours<0 {
                        newHours = newHours + 12
                        if newHours==0 {
                            newHours = 12
                        }

                        newAmpm = changeAmText(from: amOrPm)
                    }
                    else {
                        newAmpm = textProperty().amText
                    }

                    text = newMinutesText(Hours: newHours, Minutes: newMinutes, Ampm: newAmpm)
                }
                else
                {
                    if newHours < 0 {
                        newHours = newHours + 24
                    }

                    text = newMinutesText(Hours: newHours, Minutes: newMinutes, Ampm: "")
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
    
    
    
    func dateFormatFunc() -> (String) {
        let formatter = DateFormatter()
        let preferredLanguage = Locale.preferredLanguages[0] as String
        formatter.locale = Locale(identifier:  preferredLanguage)
        let dateFormat = DateFormatter.dateFormat(fromTemplate:"j", options: 0, locale: formatter.locale)!
        return dateFormat
    }
}





func newMinutesText(Hours: Int, Minutes: Int, Ampm: String) -> (String){
    var text: String
    if Minutes < 10 {
                   text = "\(Hours):0\(Minutes) \(Ampm)"
               }
               else {
                   text = "\(Hours):\(Minutes) \(Ampm)"
               }
    return text
}


func changeAmText(from: String) -> (String){
    var newAmpm = ""
    if from == "PM" {
        newAmpm = textProperty().amText
    }
    else {
        newAmpm = textProperty().pmText
    }
    return newAmpm
}

func keepAmText(from: String) -> String {
    var newAmpm = ""
    if from == "PM" {
        newAmpm = textProperty().pmText
    }
    else {
        newAmpm = textProperty().amText
    }
    return newAmpm
}



class textProperty {
    let amText = NSLocalizedString("AM", comment: "AM")
    let pmText = NSLocalizedString("PM", comment: "PM")
}
