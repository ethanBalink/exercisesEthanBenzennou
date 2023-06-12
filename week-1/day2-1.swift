
func sliceSize(diameter: Double?, slices: Int?) -> Double?{
 if let diameter = diameter ,let slices = slices{
let radius = diameter / 2.0
 let  circleArea = Double.pi * pow(radius,2)
    return circleArea / Double(slices)
 }else{
     return nil
 }
}
print(sliceSize(diameter: 16, slices: 12))
