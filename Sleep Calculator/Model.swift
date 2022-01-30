import Foundation
import UIKit



class FirstModel {
    var newMinutes = 0
    var newHours = 0
    var dateFormat = "dd.MM.yy"
    var am = false
    var text = ""
    var newAmpm = ""
    var moreThanTwelveH = false
    func hoursTimeCalc(hours: Int, minutes: Int, timeToAdd: Int, amOrPm: String) -> (String) {
        newMinutes = timeToAdd + minutes
        newHours = hours + (newMinutes / 60)
        am = false
        dateFormat = TimeModel().dateFormatFunc()
        if newMinutes > 59 {
            newMinutes = newMinutes % 60
        }

        if dateFormat.range(of: "a") != nil {
            am = true //12-часовой
        }
        moreThanTwelveH = false
        if am == true {
            
            
            if newHours >= 12 {
                newHours = newHours - 12
                if newHours == 0 {
                    newHours = 12
                }
                if newHours >= 12 {
                    newHours = newHours - 12
                    moreThanTwelveH = true
                    
                }
                if moreThanTwelveH == false {

                    newAmpm = TextProperty().changeAmText(from: amOrPm)
                }
                else {

                    newAmpm = TextProperty().keepAmText(from: amOrPm)
                }
                
            }
            else {
                newAmpm = TextProperty().amText
            }

            text = TextProperty().newMinutesText(hours: newHours, minutes: newMinutes, amPm: newAmpm)

        }
        else {

            if newHours >= 24 {
                newHours = newHours - 24
            }

            text = TextProperty().newMinutesText(hours: newHours, minutes: newMinutes, amPm: "")
             }
        return text
    }
    
}


class SecondModel {
    var newMinutes = 0
    var newHours = 0
    var dateFormat = "dd.MM.yy"
            var am = false
            var text = ""
    var newAmpm = ""
    func hoursTimeCalc(hours: Int, minutes: Int, timetoadd: Int, amOrPm: String) -> (String){
        dateFormat = TimeModel().dateFormatFunc()
        newMinutes = timetoadd+minutes
                newHours = hours+(newMinutes / 60)
                if newMinutes < 1 {
                    newHours = newHours - 1
                    newMinutes = 60 + newMinutes % 60
                }
                if newMinutes == 60 {
                    newHours = newHours + 1
                    newMinutes = 0
                }
        
        am = false
                if dateFormat.range(of: "a") != nil {
                    am = true //12-часовой
                }
                if am == true{
                    
                    if newHours<0 {
                        newHours = newHours + 12
                        if newHours==0 {
                            newHours = 12
                        }

                        newAmpm = TextProperty().changeAmText(from: amOrPm)
                    }
                    else {
                        newAmpm = TextProperty().amText
                    }

                    text = TextProperty().newMinutesText(hours: newHours, minutes: newMinutes, amPm: newAmpm)
                }
                else
                {
                    if newHours < 0 {
                        newHours = newHours + 24
                    }

                    text = TextProperty().newMinutesText(hours: newHours, minutes: newMinutes, amPm: "")
                }
        return text
    }
}


class TimeModel {
    let formatter = DateFormatter()
    let preferredLanguage = Locale.preferredLanguages[0] as String
    
    var dateString:String = ""
    var time:Array<Substring> = ["" ]
    var newDataString = ""
    var hours:Int? = 0
    var minutes:Int? = 0

    
    func getHoursMinutes (dateSource: Date) -> (hours: Int?, minutes: Int?, newDataString: String) {
        formatter.locale = Locale(identifier:  preferredLanguage)
        
        formatter.dateFormat = "HH:mm"
        dateString = formatter.string(from: dateSource)
        
        time = (dateString.split(separator: ":"))
       
        
        newDataString = formatter.string(from: dateSource)
        hours = Int(time[0])
        minutes = Int(time[1])
        return (hours, minutes, newDataString)
    }
    
    
    
    func dateFormatFunc() -> (String) {
        
        formatter.locale = Locale(identifier:  preferredLanguage)
       
        return DateFormatter.dateFormat(fromTemplate:"j", options: 0, locale: formatter.locale)!
    }
}





class TextProperty {
    let amText = NSLocalizedString("AM", comment: "AM")
    let pmText = NSLocalizedString("PM", comment: "PM")
    var text: String = ""
    var newAmpm = ""
    
    
    func newMinutesText(hours: Int, minutes: Int, amPm: String) -> (String){
        
        if minutes < 10 {
                       text = "\(hours):0\(minutes) \(amPm)"
                   }
                   else {
                       text = "\(hours):\(minutes) \(amPm)"
                   }
        return text
    }


    func changeAmText(from: String) -> (String){
        
        if from == "PM" {
            newAmpm = TextProperty().amText
        }
        else {
            newAmpm = TextProperty().pmText
        }
        return newAmpm
    }

    func keepAmText(from: String) -> String {
        
        if from == "PM" {
            newAmpm = TextProperty().pmText
        }
        else {
            newAmpm = TextProperty().amText
        }
        return newAmpm
    }
    
}

class SaveTime{
    let KeyForUserDefaults = "time"
    func saveNum(_ num: Date) {
        UserDefaults.standard.set(num, forKey: KeyForUserDefaults)
    }

    func loadNum() -> Date {
        
        guard let encodedData = UserDefaults.standard.object(forKey: KeyForUserDefaults) as? Date else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.date(from: "8:00")!
        }

        return encodedData
    }
        
}

