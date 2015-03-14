//: # A Brief Introduction to the Swift Programming Language #
//: ----
//: March 6, 2015 <br />
//: Eric Turner, MagicWave Software
//:
//: With examples from presentations by <br />
//: Sasha Goldstein, CTO Sela Group <br />
//: [https://www.dropbox.com/s/knyyi6r8enk5rva/Swift.ppt?dl=0&force_no_progressive=1](https://www.dropbox.com/s/knyyi6r8enk5rva/Swift.ppt?dl=0&force_no_progressive=1)
//:
//: Roel Castano, Icalia Labs <br />
//: [http://www.slideshare.net/IcaliaLabs/swift-presentation-36290765](http://www.slideshare.net/IcaliaLabs/swift-presentation-36290765)
//:
//: Note: for this playground to render Markdown, it must be opened with Xcode version >= 6.3 beta 2 <br />
//: (Xcode menu: Editor > Show Documentation as Rich Text)

//: ### Abstract ###
//: Swift is a successor to the C and Objective-C languages. It includes low-level primitives such as types, flow control, and operators. It also provides object-oriented features such as classes, protocols, and generics, giving Cocoa and Cocoa Touch developers the performance and power they demand. <br />
//:     Apple's Swift page: [https://developer.apple.com/swift/](https://developer.apple.com/swift/)
//:
//: Swift is a multi-paradigm, compiled programming language created by Apple for iOS and OS X development. Introduced at Apple's 2014 Worldwide Developers Conference (WWDC),[5] Swift is designed to work with Apple's Cocoa and Cocoa Touch frameworks and the large body of existing Objective-C code written for Apple products. Swift is intended to be more resilient to erroneous code ("safer") than Objective-C, and also more concise. It is built with the LLVM compiler framework included in Xcode 6, and uses the Objective-C runtime, allowing C, Objective-C, C++ and Swift code to run within a single program.  <br />
//: Wikipedia: [http://en.wikipedia.org/wiki/Swift_(programming_language)](http://en.wikipedia.org/wiki/Swift_(programming_language))
//: 
//: ### Chris Lattner, principle author of the Swift Programming Language and the LLVM compiler ###
//: ![](Resources/ChrisPhoto3.jpg)
//:
//: I started work on the Swift Programming Language (wikipedia) in July of 2010. I implemented much of the basic language structure, with only a few people knowing of its existence. A few other (amazing) people started contributing in earnest late in 2011, and it became a major focus for the Apple Developer Tools group in July 2013.
//:
//: The Swift language is the product of tireless effort from a team of language experts, documentation gurus, compiler optimization ninjas, and an incredibly important internal dogfooding group who provided feedback to help refine and battle-test ideas. Of course, it also greatly benefited from the experiences hard-won by many other languages in the field, drawing ideas from Objective-C, Rust, Haskell, Ruby, Python, C#, CLU, and far too many others to list.   <br />
//: Chris's home page: [http://www.nondot.org/sabre/)](http://www.nondot.org/sabre/))
//:
//: ### Swift History ###
//: Swift was announced at Apple’s WWDC event in June 2014 and version 1.0 was released with Xcode 6.0 (Apple’s IDE for OSX and iOS) in September 2014, with version 1.1 following soon after. It is a modern, safer alternative to Objective-C, and compiles to native code using the open source LLVM compiler.
//: 
//: The newly released Swift 1.2 has better interoperability with Objective-C, including the ability to export enums to Objective-C, and on the Objective-C side, the ability to define nullable pointers and blocks. This makes it easier to write Swift code that uses Objective-C libraries.
//: 
//: There is also a new Set data structure, for collections of unique elements, which bridges with NSSet in Objective-C.
//: 
//: Other enhancements cover let constants, static methods and properties in classes, and type inference for closures. There are also several language changes to tighten up Swift and make it more consistent, and some fixes for previous incorrect behaviour. Full details are in the Xcode 6.3 beta release notes on Apple’s developer site.
//: 
//: A source code migrator tool in Xcode 6.3 converts source code from Swift 1.1 to 1.2.
//: 
//: The 1.2 compiler now features incremental builds, improving build times by not recompiling unchanged files, as well as better optimization, diagnostics and stability.
//: 
//: Swift has been taken up rapidly by developers. Redmonk’s Stephen O’Grady ranks languages according to their popularity on the GitHub code repository and the Stack Overflow programming community. Objective C is ranked at 10 in January 2015, but O’Grady writes that:
//: **“The growth that Swift experienced is essentially unprecedented in the history of these rankings.. Swift has gone from our 68th ranked language during Q3 to number 22 this quarter, a jump of 46 spots … Given this dramatic ascension, it seems reasonable to expect that the Q3 rankings this year will see Swift as a Top 20 language.”**
//: 
//: [http://www.theregister.co.uk/2015/02/10/swift_gets_swifter_apple_updates_its_new_programming_language/](http://www.theregister.co.uk/2015/02/10/swift_gets_swifter_apple_updates_its_new_programming_language/)


//: ### Language Principles ###
//: - Clean and modern
//: - Type-safe and generic
//: - Extensible
//: - Functional
//: - Productive
//: - Compiled to Native
//: - Seamlessly interops with Objective-C

import Foundation
import UIKit

//:
//: ### Variables and Constants ###

let dogName: String = "Cinnamon"

var age: Double = 8.5

var inferredType = "String"

// Unicode characters are valid for variable names
let 🐝 = "Bee"

for aChar in "string" {
    println(aChar)
}

//:
//: ### Strings ###
// String interpolation
let a = 3, b = 5
let stringResult = "\(a) x \(b) = \(a * b)"

var variableString = "Apple"
variableString += " and Pixar"

let constantString = "Apple"
//constantString += " and Microsoft" //- compiler error modifying a constant

// casting
let label = "The width is "
let width = 94_000_00
var widthLabel:String = label + String(width)

//:
//: ### Optional Types and TypeAlias ###

var dogAge:Int? = "123".toInt()

if dogAge != nil {
    dogAge!
}

var someValue: String?
someValue = "Fido"
someValue = nil

var str = "hello"


typealias Point = (Int, Int)
let origin:Point = (100, 100)
origin


//:
//: ### Dictionaries ###

let emptyDictionary = Dictionary<String, Float>()

var occupations = [
    "Malcom": "Cook",
    "Kaylee": "Mechanic"
]
occupations["Jayne"] = "Public Relations"

occupations.updateValue("Chef", forKey: "Malcom")
occupations.removeValueForKey("Kaylee")
occupations["Malcom"] = "Goofball"

var employees = Array(occupations.keys)

for (name, occupation) in occupations {
    println("Name: \(name) \n Occupation: \(occupation)")
}


//:
//: ### Arrays ###

// Unlike NSArray, swift arrays contain elements of a declared type

// Examples of various ways to initialize an Array
var shoppingList: [String] = ["catfish", "water", "tulips", "blue paint"]
shoppingList.append("milk")

let numberList: Array<Int> = [1, 2, 3, 4, 5]
var repeatingValues = Array(count: 10, repeatedValue: "aValue")

// Inferred, preferred
let numberList2 = [6, 7, 8, 9.1, 10] 
let emptyArray = [String]()


for (index, object) in enumerate(shoppingList) {
    println("Object #\(index) is \"\(object)\"")
}


//:
//: ### Structs ###

struct Color {
    let red:Double, green:Double, blue:Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)


//:
//: ### If-Else and Switch ###

var optionalString: String? = "Hello"
optionalString = nil

var optionalName: String? = nil

var greeting = "Hello"

if let name = optionalName {
    greeting = "Hello \(name)"
} else {
    let name = "Someone"
}
greeting

var possibleInt: Int? = 3
var result: Int = 0

if let myHope = possibleInt {
    result = 2 + myHope
}
result

// Switch
let vegatable = "red pepper"
let vegatableComment: String  // example of deferred constant initialization

switch vegatable {
case "celery":
    vegatableComment = "Add some raisins and make ants on a log"

case "cucumber", "watercress":
    vegatableComment = "That would make a good tea sandwich"

case let x where x.hasSuffix("pepper"):
    vegatableComment = "Is it a spicy \(x)?"

default:
    vegatableComment = "Everything tastes good in soup"
}
vegatableComment

//:
//: ### For Loop ###
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5],
    "Square": [1, 4, 9, 16, 25]
]
var largest = 0
var largestKind:String? = nil

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestKind = kind
        }
    }
}
largest
largestKind

//:
//: ### Functions, Closures, and Tuples ###

func square(x: Int) -> Int { 
    return x * x 
}

func powers(x: Int) -> (Int, Int, Int) {
    return (x, x * x, x * x * x)
}

// Unnamed tuples
// The first tuple element is ignored
let (_, square, cube) = powers(42)

var luckyNumbers = (3, 8, 21)
luckyNumbers.2

// named tuples
var myDog:(breed:String, age:Int, isFemale:Bool) = ("Dachshund", 14, false)
var (_, myDogsAge, _) = myDog
myDogsAge

// See "functional" filter example later
func countEven(arr: [Int], pred: (Int) -> Bool) -> Int {
    var count = 0
    for n in arr { 
        if pred(n) { 
            ++count
        } 
    }
    return count
}

var nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
// An example of trailing closure syntax:
// If a function's last parameter is a closure, the preceding arguments
// may be enclosed in parentheses and the "trailing" closure argument
// may be expressed as a block in curly braces.
let aCount = countEven(nums) {  x in x % 2 == 0 }
aCount



func count(string: String) -> (vowels: Int, consonants: Int, others: Int) {
    var vowels = 0, consonants = 0, others = 0
    for aChar in string {
        switch string.lowercaseString {
        case "a", "e", "i", "o", "u":
            ++vowels
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "x", "y", "z":
            ++consonants
        default:
            ++others
        }
    }
    return (vowels, consonants, others)
}

let total = count("some, arbitrary string!")
let finalString = "\(total.vowels) vowels, \(total.consonants), and \(total.others) others"

// InOut parameters
func swapTwoInts(inout a: Int, inout b: Int) {
    let tmpA = a 
    a = b 
    b = tmpA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)

let newInts = "someInt is \(someInt) and anotherInt is \(anotherInt)"

//: ### Structures vs Classes ###
//:
//: #### Consider Structure when: ####
//: - Encapsulate simple data values
//: - Values would be copied rather than referenced
//: - Any properties stored by the structure are themselves value types
//: - Examples: Geometric Shapes, Coordinates, Person.
//: 
//: #### Consider Classes when: ####
//: - Inheritance should be used
//: - Need more than one reference to the same instance
//: - Check or Interpret the type of a class at runtime
//: - Example: Real life complex objects.


//:
//: ### Classes ###
class Vehicle {
    var numberOfWheels: Int
    var maxPassengers: Int
    func description() -> String {
        return "This vehicle has \(numberOfWheels) wheels and accommodates up to \(maxPassengers) passengers."
    }
    init() {
        numberOfWheels = 0
        maxPassengers  = 1
    }
}

// leave off the "override" keyword in demo
class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

class Tandem: Bicycle {
    override init() {
        super.init()
        maxPassengers = 2
    }
}

let tandem = Tandem()
println("Tandem: \(tandem.description())")


//:
//: ### Method Overriding ###
class Car: Vehicle {
    var speed: Double = 0.0
    override init() {
        super.init()
        maxPassengers = 5
        numberOfWheels = 4
    }
    override func description() -> String {
        return super.description() + " Travels at \(speed) mph"
    }
}
let car = Car()
println("Car: \(car.description())")


// ### Property Overriding ###

class SpeedLimitedCar: Car {
    override var speed: Double {
        get {
            return super.speed
        }
        set {
            super.speed = min(newValue, 40.0)
        }
    }
}
let limitedCar = SpeedLimitedCar()
limitedCar.speed = 60.0
println("SpeedLimtedCar: \(limitedCar.description())")



//:
//: ### Property Overriding ###


//:
//: ### Protocols ###

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")
john.fullName


//:
//: ### Generics ###

class Queue<T> {
    var items =  [T]()
    var depth: Int {
        get { 
            return items.count
        }
    }
    
    func enqueue(item: T) {
        items.append(item)
    }
    
    func dequeue() -> T {
        return items.removeAtIndex(0)
    }
}


func swapTwoValues<T>(inout a: T, inout b: T) {
    let tmpA = a 
    a = b
    b = tmpA
}

var designer = "Lisa", programmer = "Larry"
swapTwoValues(&designer, &programmer)
let newTeam = "\(designer) is the designer, and \(programmer) is the programmer"

//:
//: ### Extensions ###

extension Int {
    var absoluteValue: Int {
        get { return abs(self) }
    }
    
    func times(action: () -> Void) {
        for _ in 1...self {
            action()
        }
    }
}
5.times({ println("Hello") })
println((-5).absoluteValue)


let aStr = "Swifty"
for aChar in aStr {
    println(aChar)
}
//println("\"\(aStr)\" contains \(count(aStr)) elements")

extension String {
    func contains(s: String) -> Bool {
        return (self.rangeOfString(s) != nil)
    }
}

aStr.contains("y")


//:
//: ### Functional Array ###

// Here we initalize an Array with a Range of Ints (inferred) from 1 through 10, inclusive,
// then call the Array filter function, passing a closure which takes a single Int and 
// returns a Bool indicating whether the array element should be included in the return Array.
// Also note that we use the Swift shorthand for the 1st argument in the closure: $0.
let filteredArray = Array(1...10).filter({ $0 % 2 == 0 })
filteredArray


//: Function definitions from the Array source file: <br />
//:
//:    /// Interpose `self` between each consecutive pair of `elements`,
//:    /// and concatenate the elements of the resulting sequence.  For
//:    /// example, `[-1, -2].join([[1, 2, 3], [4, 5, 6], [7, 8, 9]])`
//:    /// yields `[1, 2, 3, -1, -2, 4, 5, 6, -1, -2, 7, 8, 9]`
//:    func join<S : SequenceType where [T] == [T]>(elements: S) -> [T]
//:    
//:    /// Return the result of repeatedly calling `combine` with an
//:    /// accumulated value initialized to `initial` and each element of
//:    /// `self`, in turn, i.e. return
//:    /// `combine(combine(...combine(combine(initial, self[0]),
//:    /// self[1]),...self[count-2]), self[count-1])`.
//:    func reduce<U>(initial: U, combine: @noescape (U, T) -> U) -> U
//:    
//:    /// Sort `self` in-place according to `isOrderedBefore`.  Requires:
//:    /// `isOrderedBefore` induces a `strict weak ordering
//:    /// <http://en.wikipedia.org/wiki/Strict_weak_order#Strict_weak_orderings>`__
//:    /// over the elements.
//:    mutating func sort(isOrderedBefore: (T, T) -> Bool)
//:    
//:    /// Return a copy of `self` that has been sorted according to
//:    /// `isOrderedBefore`.  Requires: `isOrderedBefore` induces a
//:    /// `strict weak ordering
//:    /// <http://en.wikipedia.org/wiki/Strict_weak_order#Strict_weak_orderings>`__
//:    /// over the elements.
//:    func sorted(isOrderedBefore: (T, T) -> Bool) -> [T]
//:    
//:    /// Return an `Array` containing the results of calling
//:    /// `transform(x)` on each element `x` of `self`
//:    func map<U>(transform: (T) -> U) -> [U]
//:    
//:    /// A Array containing the elements of `self` in reverse order
//:    func reverse() -> [T]
//:    
//:    /// Return an `Array` containing the elements `x` of `self` for which
//:    /// `includeElement(x)` is `true`
//:    func filter(includeElement: (T) -> Bool) -> [T]


//:
//: ### More Resources ###
//:
//: See Ray Wenderlich site Swift Functional Programming Tutorial for more on functional Arrays
//: [http://www.raywenderlich.com/82599/swift-functional-programming-tutorial](http://www.raywenderlich.com/82599/swift-functional-programming-tutorial)
//:
//: A list of Swift resources maintained by Dave Hendrix (an esteemed Ashland CocoaHead) <br />
//: [http://rogueminds.net/swift/](http://rogueminds.net/swift/) <br />
//: Also get more info about local geek gatherings and Ashland CocoaHeads on Dave's page
//: 
