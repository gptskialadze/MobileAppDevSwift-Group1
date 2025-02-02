//Task 1: Area Calculator

protocol Shape {
    func area() -> Double
}


struct Rectangle: Shape {
    let width: Double
    let height: Double
    func area() -> Double {
        return width * height
    }
}
struct Circle: Shape {
    let radius: Double
    func area() -> Double {
        return .pi * radius * radius
    }
}

extension Shape {
    var description: String {
        String(describing: type(of: self))
    }
}


let rectangle = Rectangle(width: 5, height: 10)
print(rectangle.area()) // Output: 50.0
print(rectangle.description) // Output: Rectangle

let circle = Circle(radius: 7)
print(circle.area()) // Output: ~153.94
print(circle.description) // Output: Circle




//Task 2: Person and Employee
class Person {
    let name: String
    let age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    func  greet() {
        print("Hi, I'm \(name) and I'm \(age) years old.")
    }

}

class Employee: Person {
    let jobTitle: String
    init(name: String, age: Int, jobTitle: String) {
        self.jobTitle = jobTitle
        super.init(name: name, age: age)
    }
    override func greet() {
        print("Hi, I'm \(name), a \(jobTitle), and I'm \(age) years old.")
    }
}

let person = Person(name: "Alice", age: 25)
person.greet() // Output: Hi, I'm Alice and I'm 25 years old.

let employee = Employee(name: "Bob", age: 30, jobTitle: "Engineer")
employee.greet() // Output: Hi, I'm Bob, a Engineer, and I'm 30 years old.





//Task 3: Power Consumption
protocol Appliance {
    var powerUsage: Double { get }
    func calculateMonthlyConsumption(hours: Double) -> Double
}


struct  WashingMachine: Appliance {
    var powerUsage: Double = 500
    
    func calculateMonthlyConsumption(hours: Double) -> Double {
        return hours * powerUsage
    }
    
    
}
struct Refrigerator: Appliance {
    var powerUsage: Double = 1000
    
    func calculateMonthlyConsumption(hours: Double) -> Double {
        return hours * powerUsage
    }
}

extension Appliance {
    func calculateMonthlyConsumption(hours: Double = 1000) -> Double {
        return powerUsage * hours
    }
}

extension Appliance {
    var description: String {
        return "This appliance uses \(powerUsage) watts each month."
    }
}

let washingMachine = WashingMachine()
print(washingMachine.description) // Output: This appliance uses 500 watts.
print(washingMachine.calculateMonthlyConsumption(hours: 30)) // Output: 15,000 watts

let refrigerator = Refrigerator()
print(refrigerator.description) // Output: This appliance uses 100 watts.
print(refrigerator.calculateMonthlyConsumption(hours: 720)) // Output: 72,000 watts







//Task 4: Library
struct Book: Equatable {
    let title: String
    let author: String
  
}

protocol Borrowable {
    func borrow()
    func returnBook()
}


class Library: Borrowable {
    var books: [Book] = []
    let book = Book(title: "1984", author: "George Orwell")
    
    func borrow() {
        if let index = books.firstIndex(of: self.book) {
            books.remove(at: index)
        }
    }
    
    func returnBook() {
        books.append(self.book)
    }
    
    func addBook(book: Book) {
        books.append(book)
    }
}



extension Library {
    func listBooks() {
        print(books)
    }
}

var library = Library()
library.addBook(book: Book(title: "1984", author: "George Orwell"))
library.addBook(book: Book(title: "To Kill a Mockingbird", author: "Harper Lee"))

library.listBooks()
// Output:
// 1. 1984 by George Orwell
// 2. To Kill a Mockingbird by Harper Lee

library.borrow()
// Output: Borrowed 1984
library.listBooks()
// Output: 1. To Kill a Mockingbird by Harper Lee







//Task 5: Vehicles


class Vehicle  {
    let make: String
    let model: String
    let fuelEfficiency: Double
    
    init(make: String, model: String, fuelEfficiency: Double) {
        self.make = make
        self.model = model
        self.fuelEfficiency = fuelEfficiency
    }
    
    func calculateFuelNeeded(for distance: Double) -> Double {
        return distance / fuelEfficiency
    }

}

class ElectricCar: Vehicle {
    var batteryCapacity: Double
    init(make: String, model: String, batteryCapacity: Double) {
        self.batteryCapacity = batteryCapacity
        super.init(make: make, model: model, fuelEfficiency: batteryCapacity)
    }
    override func calculateFuelNeeded(for distance: Double) -> Double {
        return distance / batteryCapacity
    }
}

extension Vehicle {
    func description() {
        print("\(make) and \(model)")
    }
}

let car = Vehicle(make: "Toyota", model: "Corolla", fuelEfficiency: 15)
print(car.calculateFuelNeeded(for: 150)) // Output: 10.0 liters

let tesla = ElectricCar(make: "Tesla", model: "Model 3", batteryCapacity: 50)
print(tesla.calculateFuelNeeded(for: 150)) // Output: 30.0 kWh
