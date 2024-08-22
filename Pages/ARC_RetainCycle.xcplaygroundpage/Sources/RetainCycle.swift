import UIKit
class Person{
    let name: String
    var ownedCar: Car?
    init(name:String) {
        self.name = name
    }
    deinit{
        print("Person deallocated")
    }
}
class Car{
    let brandCar: String
    var owner: Person?
    init(brand: String){
        self.brandCar = brand
    }
    deinit{
        print("Car deallocated")
    }
}
var person: Person? = Person(name: "NV Tra")//rCountofPerson = 1
var myCar: Car? = Car(brand: "Volvo")//rCountofCar = 1
person?.ownedCar = myCar //rCountOfCar = 2
myCar?.owner = person //rCountOfPerson = 2
person = nil //rCountofPerson = 1
myCar = nil //rCountOfCar =1
//Nếu ta set nil cho 2 biến person và luxCar thì reference count của 2 instance đó từ 2 giảm xuống 1, và mãi mãikhông thể giảm xuống nữa
//Cách giải quyết vấn đề trên:dùng weak hoặc unowned thì số reference counting không bị tăng lên.Cách sử dụng là bạn thêm từ khoá weak hoặc unowned khi khai báo biến
weak var owner: Person?
unowned var car: Cart
