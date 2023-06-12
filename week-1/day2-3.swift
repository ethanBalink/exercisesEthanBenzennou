func applyKTimes(_ K:Int, _ closure:() -> ()) {
   for _ in 1...K {
       closure()
   }
}

applyKTimes(3,{print("We Heart Swift")})