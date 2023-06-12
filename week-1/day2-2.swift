// exercise 1
func sliceSize(diameter: Double?, slices: Int?) -> Double? {
 if let diameter = diameter, let slices = slices {
let radius = diameter / 2.0
 let circleArea = Double.pi * pow(radius,2)
     return circleArea / Double(slices)
    }
    
    return nil
}
//print(sliceSize(diameter: 16, slices: 12))

// exercise 2
func biggestSlice(diameterA: String, slicesA: String, diameterB: String, slicesB: String) -> String {
    if let diameterA = Double(diameterA), let slicesAInt = Int(slicesA),
       let diameterB = Double(diameterB), let slicesBInt = Int(slicesB) {
        let areaA = sliceSize(diameter: diameterA, slices: slicesA)
        let areaB = sliceSize(diameter: diameterB, slices: slicesB)
        if let areaA = areaA {

            if areaB == nil {
                return "Slice A is bigger"
            } else if let areaB = areaB, areaA > areaB {
                return "Slice A is bigger"
            } else if let areaB = areaB, areaA < areaB {
                return "Slice B is bigger"
            }

        } else if areaB != nil {
            return "Slice B is bigger"
        }
    }
    return "Neither slice is bigger"
}
//print(biggestSlice(diameterA: "10", slicesA: "6", diameterB: "12", slicesB: "8"))
