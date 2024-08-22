import UIKit
class Car {
    var nameCar: String
    init(name: String) {
        self.nameCar = name
    }
    
    deinit {
        print("Deallocated by ARC")
    }
}

var car1: Car? = Car(name: "Volvo")
var car2: Car? = car1
var car3: Car? = car1

car1 = nil // rCount = 2
car2 = nil // rCount = 1
car3 = nil // rCount = 0 >>> call denit()

//Deallocated by ARC
