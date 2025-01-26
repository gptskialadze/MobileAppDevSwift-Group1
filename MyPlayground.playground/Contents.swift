import UIKit

//Task 1: Functions
func factorial(n: Int?) -> Int? {
    guard let n = n else {
          return nil
      }
        if n < 0 {
            print(n, "is negative")
            return nil
        }
        if n == 0 || n == 1 {
            return 1
        }
        if n > 1 {
            if let recursiveResult = factorial(n: n - 1) {
                return n * recursiveResult
            } else {
                return nil
            }
    }
    return nil
}
if let result = factorial(n: 5) {
    print(result)
}



//Task 2: Working With Arrays and custom Structures

struct Student {
    var name: String
    var grades: [Double]
}

func averageGrade(student: Student) -> Double? {
    var sum: Double = 0
    for i in student.grades {
        sum += i
    }
    return sum / Double(student.grades.count)
}

func bestStudent(inClass: [String: Student]) -> (Student, Double) {
    var greateGrade: Double = 0
    var student: String = "Alice"
    for (index, item) in inClass.enumerated() {
        if greateGrade < averageGrade(student: item.value)! {
            greateGrade = averageGrade(student: item.value)!
            student = item.key
        }
    }
    return (inClass[student]!, greateGrade)
}


let students = [
    "Alice" : Student(name: "Alice", grades: [5.5, 3.5, 5.75]),
    "Bob" : Student(name: "Bob", grades: [5.25, 3.75, 5.75])
]


if let studentsGraderesult = averageGrade(student: students["Alice"]!) {
    print(studentsGraderesult)
}

print(bestStudent(inClass: students))




//Task 3: Find the longest word in a list of words using recursion

func findLongestWord(words: [String?]) -> String? {
    var maxString: Int = 0
    var word: String!
    for item in words {
        if maxString < (item?.count)! {
            maxString = (item?.count)!
            word = item
        }
    }
    return word
}

if let longWord = findLongestWord(words: ["Hello", "World", "Swift", "Programming"]) {
    print(longWord)
}


//Task 4: Shopping List

struct ShoppingItem {
    var name: String
    var quantity: Double
    var isPurchased: Bool = false
}

struct ShoppingList {
    var items: [String: ShoppingItem] = [:]
    
    mutating func addItem(item: ShoppingItem)-> Void {
        self.items = [item.name: item]
    }
    
    mutating func markAsPurchased(item: ShoppingItem) {
        self.items[item.name]?.isPurchased = true
    }
    
    mutating func markItemAsPurchased(itemName: String){
        if let item = self.items[itemName] {
            self.items[itemName]?.isPurchased = true
        }
    }
    
    func listUnpurchasedItems() -> [ShoppingItem] {
         var unParchised = items.filter({ (key: String, value: ShoppingItem) in
             value.isPurchased == false
        })
        return Array(unParchised.values)
    }
}

var shoppingList = ShoppingList()
shoppingList.addItem(item: ShoppingItem(name: "Apples", quantity: 5))
shoppingList.addItem(item: ShoppingItem(name: "Bananas", quantity: 3))
shoppingList.markItemAsPurchased(itemName: "Apples")

let unpurchased = shoppingList.listUnpurchasedItems()
print(unpurchased)
