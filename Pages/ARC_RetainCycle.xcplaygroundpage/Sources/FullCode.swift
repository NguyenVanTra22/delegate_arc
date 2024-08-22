import UIKit
class Person {
  let name: String
  var ownedCar: Car?

  init(name: String) {
    self.name = name
  }

  deinit {
    print("Person instance is deallocated by ARC")
  }
}

class Car {
  var brandName: String
  weak var owner: Person?
  lazy var carInfo: () -> String = { [unowned self] in
    "O to hieu " + self.brandName + " chu xe " + self.owner!.name
  }

  init(branch: String) {
    self.brandName = branch
  }
  deinit {
    print("Car instance is deallocated by ARC")
  }
}

var person: Person? = Person(name: "bn2002")
var luxCar: Car? = Car(branch: "vinfast")

person?.ownedCar = luxCar
luxCar?.owner = person
print(luxCar!.carInfo())
person = nil
luxCar = nil
