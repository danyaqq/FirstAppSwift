import UIKit

var str = "Hello, playground"
for i in 1...100{
    if i % 15 == 0 {
    print("FizzBuzz \(i)")
    }
    else if i % 3 == 0 {
        print("Fizz \(i)")
    }
    else if i % 5 == 0 {
        print("Buzz \(i)")
    }

    else {
        print(i)
    }
}
class Human{
    var name: String
    var age: Int
    init(name: String, age:Int) {
        self.name = name
        self.age = age
    }
}
var human  = Human.init(name: "Denis", age: 15)
human.age
human.name

let someNumber = "228"
for character in someNumber{
    print(character)
}
func antiMultiNumber (a:Int) -> Int{
    return a * a * -1
}
print(antiMultiNumber(a: 5))
