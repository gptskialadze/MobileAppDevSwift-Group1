import UIKit

//Task 1: Practice Loops

//For Loop
for  i in 1...10 {
    let result  = i%2 == 0 ? "\(i)  Even" : "\(i)  Odd"
    print(result)
}

//While loop
var i = 1
while i <= 10 {
    let result  = i%2 == 0 ? "\(i)  Even" : "\(i)  Odd"
    print(result)
    i += 1
}

//Repeat While
var j = 1
repeat {
    let result  = j%2 == 0 ? "\(j)  Even" : "\(j)  Odd"
    print(result)
    j += 1
} while j <= 10

//-------------------------------------------------------//

//Task 2: Working With Arrays
let topMovies: [String] = [
    "The Shawshank Redemption",
    "The Godfather",
    "The Dark Knight",
    "Schindler's List",
    "pulp fiction",
    "The Lord of the Rings: The Return of the King",
    "Forrest Gump",
    "Inception",
    "Fight Club",
    "The Matrix"
];
var newArray: [String] = []
for (index, movie) in topMovies.enumerated() {
    if index != 0 {
        if (index % 3) == 0 {
            newArray.append(movie.uppercased())
            print(movie.uppercased())
        } else if (index % 4) == 0 {
            newArray.append(movie.capitalized)
            print(movie.capitalized)
        } else {
            newArray.append(movie)
        }
    }
}
print(newArray)

//-------------------------------------------------------//

//Task 3: Grade Tracker
var grades = ["Alice": 85, "Bob": 90, "Charlie": 78]
for (name, grade) in grades {
    print("Student \(name), Degree: \(grade)")
}
grades["Paul"] =  95;

for (name, grade) in grades {
    if grade > 90 {
        print("Special Grade: \(name)")
    }
  
}

//-------------------------------------------------------//

//Task 4: Person Details

var clientInfo: (name: String, age: Int, city: String) = ("John", 30, "Mexico")
print("Client Name: \(clientInfo.name)")
print("Client Age: \(clientInfo.age)")
print("Client City: \(clientInfo.city)")
clientInfo.city = "New York"
print("Client City: \(clientInfo.city)")

//-------------------------------------------------------//

//Task 5: Shopping List
var cost: Double = 0
var items = [String]()
let shoppingItems:[(String, Double)] = [
    ("Milk", 12),
    ("Bread", 2.34),
    ("Cheese", 34),
    ("Apples", 3),
    ("Bananas", 8)
]



for item in shoppingItems {
    items.append(item.0)
    cost = cost + item.1
    
}
print("Items: \(items) \n Total cost: \(cost)")

