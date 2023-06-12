let daysInMonth = 22
let hoursPerDay = 8.0
func dailyRateFrom(hourlyRate:Int)-> Double{
    return Double(hourlyRate * hoursPerDay)
    
}
func monthlyRateFrom(hourlyRate:Int,withDiscount:Double)-> Double{
    let monthlyRate = dailyRateFrom(hourlyRate:hourlyRate) * daysPerMonth
    let mnrtAfterDiscount = monthlyRate * ((withDiscount)/100)
        

    
    return round(mnrtAfterDiscount)
    }
    //print(monthlyRateFrom(hourlyRate: 77, withDiscount: 10.5))
func workdaysIn(budget:Int, hourlyRate: Int, withDiscount:Double)-> Double {
   let newHourRate = dailyRateFrom(hourlyRate:hourlyRate)*((100.0 - withDiscount) / 100.0)
   let daysAfterDiscount = Double(budget) / newHourRate
   return round(daysAfterDiscount) 
}
//print(workdaysIn(budget: 20000, hourlyRate: 80, withDiscount: 11.0))