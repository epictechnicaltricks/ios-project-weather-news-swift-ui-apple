import UIKit

var num1 = 1 , num2 = 2

//basic
///
num1 += 1
print(num1)

///////
//simple if conditions
let name = "world"

if "world" == "world2" {
    print(true)
} else {
    print(false)
}

///////
// simple null haldling on swift
let rich = "rich"
let poor : String? = nil


var ram : String? = poor
var hari : String? = poor


// multi line if else ladder
if let ram {
    print("ram is rich")
}

if let ram, let hari {
    print("ram and hari both rich")
}

if ram != nil && hari == nil {
    print("ram rich BUT hari poor")
}
else if ram == poor  {
    print("ram is poor")
} else if hari == poor {
    print("hari is poor")
}
else if ram == poor && hari == poor {
    print("ram and hari both poor")
} else if ram != poor && hari != poor {
    print(" ram and hari both are poor ")
} else {
    print("it will not execute")
}



print("""

///
////Exception Handling

""")


enum MyError: Error {
    case ramIsRich
}

func checkRam() throws {
    let ramMustRich: String? = rich

    if ramMustRich == rich {
        throw MyError.ramIsRich
    } else {
        print("ram is not rich")
    }
}

do {
    try checkRam()
} catch {
    print("Error \(error)")
    
}

print("""

/// computed property
// extension block

""")

extension String {
    var trim : String {
        self.trimmingCharacters(in: .whitespaces)
    }
    
    var isEmptyData: Bool {
        self.isEmpty
    }

    // computed property
}
// extension block


//////


let myStory = "         sjk  "

print(myStory.trimmingCharacters(in: .whitespaces))

print(myStory.trimmingCharacters(in: .whitespaces).hasPrefix("s"))

print(String(myStory.trimmingCharacters(in: .whitespaces).hasPrefix("s")).lowercased().uppercased())

print(myStory.trim.count)



print("""

///
// for loops

""")
for  char in myStory.trim{
    print(char)
}

// for lop with index

for (index, char) in myStory.trim.enumerated() {
    print(" index \(index) \(char) \(Int(Date().timeIntervalSince1970*1000))")
}



print(
    """
    \n\n
    // work for the colletions add remove, and insert , delete \n\n
    """
)


var char = [Int]()
char.reserveCapacity(1)

char = [1,2,3]


let charArray = [ "A", "B" ,"C", "D"]



//do {
//    print("charArray : \(charArray[7]) // \(char.count)")
//} catch {
//    print("error \(error)")
//}
//
//


struct Student{
    let movieName: String
    let rating : Float
    var isWatchedByme : Bool {
        true
    }
}

var students : [Student] = [
    Student(movieName: "Iron Man", rating: 4.1),
    Student(movieName: "Iron Man 2", rating: 4.11),
    Student(movieName: "Iron Man 3", rating: 4.71)
]

for list in students {
    print(list.movieName)
}
// timeinvervalsicncw197o * 1000

let startTime = Date().timeIntervalSince1970 * 1000

for index in 1...2 {
    print(index)
}

let endTime = Date().timeIntervalSince1970 * 1000
let durationInSeconds = (endTime - startTime) / 1000

// Formatting to 3 decimal places:
let formattedString = String(format: "%.3f", durationInSeconds)

print("total in \(formattedString)s")
// Output: total in 0.142s



func removeAtIndex(index: Int, list: inout [Student]){
    list.remove(at: index)
}

func removeAllIndex(list: inout [Student]){
    list.removeAll()
}

func addNewAtIndex(index : Int, item : Student, list: inout [Student]){
    list.insert(item, at: index)
}

func addAll(list: inout [Student], newList : [Student]){
    list.append(contentsOf: newList)
}


func addItem(list : inout [Student], item : Student){
    list.append(item)
}


// here at , with you see is argument Labels

func updateAtIndex(this_is_my_index index : Int, this_is_your_list list: inout [Student],
                   this_was_your_item item : Student){
    list[index] = item
}


enum MyNewError : Error {
    case InvalidError
    case VocalIssues
}
// collection sort

func collectionss(hello list : inout [Student]) throws {
    
    // it will included all value (also nil values it can hold)
    
    print(
        list.map { (student: Student) -> String in
            return student.movieName
        }
    )
    
    guard let first = list.first else {
        throw MyNewError.InvalidError
    }
    
    
    list[0] = list[2]
    
    print(list.map { $0.movieName }) // it will include all the nil data
    
    list.compactMap { $0.rating } // it will auto remove all the nil
    
    list.sort{ $0.rating > $1.rating }
    
    list.sort { s1 , s2 in
        s1.rating > s2.rating
    }
}

func squreFind(hello input: Int? = 10) throws -> Int {
    guard (input ?? 0) > 0 else {
        throw MyNewError.VocalIssues
    }
    return (input ?? 0) * (input ?? 0)
}


do {
    try collectionss(hello: &students)
    let y = try squreFind(hello: nil)
    print(y)
}catch MyNewError.VocalIssues {
    print("Vocal issues")
}

//////////

//Flat map vs map , compact map


struct ClassRoom {
    let students: [Student]
}

let roomA = ClassRoom(students: [Student(movieName: "Alice", rating: 4.8)])

let roomB = ClassRoom(students: [Student(movieName: "Bob", rating: 4.0),
                                 Student(movieName: "Charlie", rating: 3.9)])

let school = [roomA, roomB] // Array of ClassRooms

// Using flatMap to flatten all students into a single 1D array:
let allStudents = school
    .flatMap{ $0.students }
    .map{ $0.movieName }



print(allStudents)


print(
    """
    inside this we are using uses of constructer on class 
    
    """
)


//////
protocol Human {
    func play()
    func dance()
}



print(
    """
    What we learned 
    
    1 . inside this we learned the the if we inherit the protocal or lets say implement the protocol it wont show its overide the function if we inherit the class it will show it was overide function  
    
    2. using init block we can make our custom constructor 
    
    3. we can also set privte accerss for private constructure 
    
    """
)

class Studen : Human {
    var gName = "" , gRoll = 1.0;
    
    private init (name : String, roll : Double){
        self.gName = name
        self.gRoll = roll
    }
    
    init (name : String){
        self.gName = name
    }
    
    func getName() -> String {
        return self.gName
    }
    
    func setName(name : String) {
        return self.gName = name
    }
    
    func getRoll() -> Double {
        return self.gRoll
    }
    
    func play() {
            print("\(gName) is playing.")
        }
        
        func dance() {
            print("\(gName) is dancing.")
        }
    
    // in the kotline it have the overide this i use the interface but in protocal there is not over aval for swift code wso we need
}
// if i inherit the class then on that perriculat time instance swift expelicity need the overifide funtion like
//class Animal {
//    func makeSound() {
//        print("Some generic sound")
//    }
//}
//
//class Dog: Animal {
//    // Swift explicitly REQUIRES 'override' here
//    override func makeSound() {
//        print("Woof! Woof!")
//    }
//}

// like don inherit the animation class on that time walking will beinheried ansd its the overide funtion of the that calss of dog


let student = Studen(name: "Hari")

print(student.getName())
print(student.getRoll())

///////


print(
    """
//////
   
 "switch case"

///
""")
 
    
let numberr = 1
    
    switch numberr {
       case 1, 2, 3 :
        print("one")
       case 5 :
        print("two")
    default:
        print("not found")
        break
    }

//////
// Network request data class

print("""
NETWORK REQUEST DATA CLASS 
""")


enum ApiSate {
    case Idle
    case Loading
    case Success(data : [String])
    case Failure(message : String)
}




let currentState = ApiSate.Success(data: ["Ram", "Gopal"])

switch currentState {
case .Idle : print("Idle")
case .Success(let data1) : print("Success \(data1)")
case .Loading : print("Loading..")
case .Failure(let error) : print("Error : \(error)")
    
}

let age = 20
let hasID = true

switch age {
case 0..<18: print("Minor - Access Denied")
case 18... where !hasID: print("Adult, but missing ID - Access Denied")
case 18... where hasID:  print("Access Granted")
default: print("Invalid age")
}

////////

//////

print("""
    TUPLES AND PAIRS 
    
    in swift tuple it like triple data on kotlin but if know basicaly tuple is related to database tuple mens row of recodes in a datbase is called the tuple
    a single record in db is caldded tuple 
    
    
    
    """)

var studentDetails = ("Gopal", age : 23, class : "VI", fatherName: "ram", motherName : "Sita", isPassed : true)

print(studentDetails)
// if we want to access the single data it also possible
studentDetails.isPassed = false
print(studentDetails.0)
print(studentDetails.age)
print(studentDetails.isPassed)


let distionaryData  = ["Ram" : 12, "Gopal": 33, "Hari": 23]
print(distionaryData["Ram", default: 99])
print(distionaryData.values.sorted())

let agee = distionaryData["Ram"] ?? 0

print(agee)

/////

print("""
    Making the custom pair for swift 
    """)
// if we want pair on swift we cana make a custom struct class where we can add make the gency type

struct Pair <X, Y> {
    let first: X
    let second: Y
}

// Now it works with ANY combination of types:
let pair1 = Pair(first: "Ram", second: 12)       // A is String, B is Int
let pair2 = Pair(first: 99.9, second: true)      // A is Double, B is Bool
let pair3 = Pair(first: "Swift", second: "iOS")  // A is String, B is String


//////////////

// clousers

func helloCloser()  {
    Adapter(onClick: {
        print(try squreFind(hello: 5))
    })
}



func Adapter(onClick: () throws ->Void) -> String {
    do {
            try onClick()
        } catch {
            print("Error caught inside Adapter: \(error)")
        }
    return "Ram"
}

///
///
helloCloser()


//mutating function


print("""
    in mutating function 
    it proved us power to update the varibale data if on struct and enums beacuse default inside tht data is imputable so we declar tis mutaing it help to modify the varibale as our need  
    
    """)


struct CustomData{
    private(set) var data1 : [String] = ["gOPLA"]
    
    mutating func addNewData(name: String){
        data1.append(name)
    }
}

var datata = CustomData()
datata.addNewData(name: "Golan 2")
print(datata.data1)

///////


print("""
    ////
    
    
    HOW TO MAKE THE SINGLETON ON SWIFT 
    
    """)


// what i have learned

// if we want a single ton we need to implent the sendable protocal here and must be final
// why final because when we set to final it imputable it onlt the read only so any ther can just use this value can update anythings it is best to get data only not modify them by other threds sigtone is safe now

// if we put some var data like i have added a list of string which var and it can be modify by other thred here we have to actoar not class

final class DatabaseManager : Sendable {
    
    static let manager = DatabaseManager()
    //static var namearray : [String] = [""] // Static property 'manager' is not concurrency-safe because non-'Sendable" type DatabaseMana
    // here i need to use actor insted of final class
    
    private init(){
        
    }
    
    func getName() -> String {
        return "Ram"
    }
}

let data = DatabaseManager.manager.getName()
print(data)


print("""
    
    why we uses the actor 
    
    - this used if the data concurrlyt access by differnet thered 
    - actor helps to execute the serial execution of a 
    
    """)

actor SessionManager {
    static let shared = SessionManager()
    
    private var token: String?
    
    private init() {}
    
    func updateToken(_ newToken: String) {
        self.token = newToken
    }
    
    func getToken() -> String? {
        return token
    }
}




Task {
     await SessionManager.shared.updateToken("New token")
    let token = await SessionManager.shared.getToken()
    try await Task.sleep(for: .seconds(1))
    print(token ?? "error")
}


//subscipt

print("""
    //
    
    it basicaly like operator func on kotlin
    it can be used when we wan to access object as collection like aarya or get datat from index 
    we can used inside struct 
    
    
    """)


struct Movie {
    var movies = ["Ramayan","Mohabharat","Siva thr legends"]
    
    
    subscript(getMovieByIndex : Int) -> String {
        get {
            return movies[getMovieByIndex]
        }
         set(newValue) {
             movies[getMovieByIndex] = newValue
        }
        
    } // works like operator fun on kotlin
    
}


var mov = Movie()
print("\(mov[1]) size \(mov.movies.count)")

mov[0] = "ram ram"
print("\(mov[1]) size \(mov.movies.capacity)")
print(mov[mov.movies.count-1])
///////


print("""
    
    // try vs try? vs try!
    
    try - used for error alding we need to uses the do and catch for this and pass a function for try 
    
    try? - this we can use without do catch if any error occured the it will retun thr nil 
    
    try! - this was same as try? but it not give nil it will crash the app if any error occured we use it if we think it not give any error at all 
    
    
    on kotlin we have similr like 
    
    ?  // null alowed 
    !!  // never be null 
    
    like this 
    
    log.wtf // 
    
    
    """)


enum DataError: Error { case fileNotFound }

func loadData() throws -> String {
    throw DataError.fileNotFound
}

// 1. try (Handling with do-catch)
do {
    let data = try loadData()
    print(data)
} catch {
    print("Failed with error: \(error)") // Executes this
}

// 2. try? (Returns nil on failure)
let optionalData: String? = try? loadData() // Result is nil

// 3. try! (Triggers a runtime crash)

do {
    let forcedData: String = try loadData()  // 💥 Fatal error / App Crash
} catch {
    print("\(error)")
}




//concorancy


print("""
    ///////
    concorancy
    ////
    Data Races 
    - when multiple threads access the same varible to update the datt then found some unexpected value from the same varibles becauses one varible accessed by 2 threads this called data races 
    
    dead lock 
    - when one or 2 thned depends on resources mens they are wait on each other if thread 1 need r1 and after that r2 need thread 2 then on that point of view some times it will depent each other for complete the task so dead lock happed no 
    
    
    ** escaping closures - used previously 
    ** combine 
    
    
    
    it like our coroutine or more easy
    let explore 
    
    """)


//

enum NetworkStatus : Error {
    case CONNECTION_TIMEOUT
    case NO_INTERNET
    case GOOD
}


func fetchNames(networkType : NetworkStatus) async throws -> [String] {
    switch networkType {
    case .CONNECTION_TIMEOUT :
        try await Task.sleep(for: .seconds(2))
        throw NetworkStatus.CONNECTION_TIMEOUT
    case .NO_INTERNET :
        try await Task.sleep(for: .seconds(2))
        throw NetworkStatus.NO_INTERNET
    case .GOOD :
        try await Task.sleep(for: .seconds(2))
        return ["Ram", "Gopla", "Hari babu"]
        
    }
}



func testNetwork() {
    Task {
        do {
            let names = try await fetchNames(networkType: NetworkStatus.GOOD)
            print("\n\n\(names)")
        }catch {
            print("bro error \(error)")
        }
        
        if let names = try? await fetchNames(networkType: NetworkStatus.CONNECTION_TIMEOUT) {
            print("\n\n\(names)")
        } else {
            print("\n\n ERROR BIG BRO")
        }
        
    }
}


testNetwork()


///////


print("""
    
    Lets use the actor 
    
    Why do we need an actor?
    An actor is used to safely manage concurrent access to shared data.
    It is somewhat similar to how a suspend function is used in Kotlin for asynchronous work, but they are not the same thing.
    Suppose we have a SessionManager that stores different types of data, and multiple tasks/threads can get, set, or update that data at the same time.
    For example, the data might be accessed from the main thread as well as background tasks.
    If we use a normal class, multiple threads can access the same data simultaneously, which can cause data races and inconsistent data.
    By using an actor, Swift provides automatic isolation for the actor's mutable state. Access to that state is controlled so that conflicting operations don't happen simultaneously.
    We can also make the actor a singleton if we need one shared SessionManager instance throughout the application.
    
    struct  → Value Type
              Copy the value

    class   → Reference Type
              Same object

    actor   → Reference Type
              Same object + concurrency protection
    
    """)





//

print("""
    
    ///
    
    \n\n
    Let’s deep dive into Macros

    I don’t know what macros are, so let’s figure that out.

    Okay, I found something.

    Macros are basically similar to custom annotation processors in Java or KSP in Kotlin.

    They can automatically generate repetitive code and perform other compile-time tasks. One advantage is that the code is generated during compile time. We can also directly jump to the generated code and see what was generated.

    In Java or Kotlin, depending on the tool being used, the generated code may not always be directly visible or easy to inspect.

    If we think about macros in Swift, they basically help us reduce repetitive code, make the code cleaner, and simplify things that we would otherwise have to write manually.

    For example, we can create our own macro and use it wherever we need it:

    #myMacro

    or use an attached macro with something like:

    @MyMacro

    Now, I’ve learned that Swift has two main types of macros:

    @ → Attached macros
    # → Freestanding macros

    So, basically:

    @MyMacro → Attached Macro
    #myMacro  → Freestanding Macro

    Note: @ and # are not simply two syntax styles for the same macro. They represent two different ways of applying Swift macros.
    
    
    
    
    """)
      
      
      // macros
      
      
      // Declaration in your library module
//      @freestanding(declaration, names: named(MyInfo))
//      public macro MyInformation(name: String, age: Int, gender: String, location: String) = #externalMacro(module: "MyMacrosPlugin", type: "MyInfoMacro")
//      
//      
//
//
//      public struct MyInfoMacro: DeclarationMacro {
//          public static func expansion(
//              of node: FreestandingMacroExpansionSyntax,
//              in context: some MacroExpansionContext
//          ) throws -> [DeclSyntax] {
//              
//              // Generates this struct declaration directly into your source code
//              let generatedCode = """
//              struct MyInfo {
//                  static let name = "Alex"
//                  static let age = 28
//                  static let gender = "Male"
//                  static let location = "Bhubaneswar"
//              }
//              """
//              
//              return [DeclSyntax(stringLiteral: generatedCode)]
//          }
//      }
      
      
      // Declaration in your library module
      
    
      
      
    print("""
        
        ######
        Generic types 
        
        in swift 
        
        """)
      
      
  // if we write the generic type of api stae of enum



enum ApiStateNew<A, B> {
    case Idle, Loading, Suceess(data : A), Failure(msg : B)
}
      

let state : ApiStateNew<String, Int> = ApiStateNew.Failure(msg: 77)

let d = 2, e = "String" ,f = 1.33


print("""
    
    1. weak (Safe & Optional) || it will return nil || every where when passing any refrence 
    
    2. unowned (Dangerous & Non-Optional) || it will not return nil at all it will crash || Real-World Example: Customer & Credit Card
    A Credit Card cannot exist without an Owner. The Card owner will always exist as long as the Card exists.
    
    // 1. SAFE (Preferred 99% of the time)
    fetchData { [weak self] in
        guard let self = self else { return }
        self.updateUI()
    }

    // 2. RISKY (Use only if self is guaranteed to exist when callback fires)
    fetchData { [unowned self] in
        self.updateUI() // If self was popped off screen during API call -> CRASH! 💥
    }
    
    Use weak by default. It is complete safety with zero risk of crashing your app.

    Use unowned rarely, only for strict 1-to-1 relationships where two objects are created and destroyed at the exact same time.
    
    """)




// generics
//extensions




//tupels + pair //DONE
// object class like kotline have on swioft need to know this


//https://tattle.muvi.com/tattle/er/134825 // CODING OF XCODE BASIC LOOPS TO ADVANCE CONCURRENCY

//https://tattle.muvi.com/tattle/er/135042



var a = [1,2,3]; var b = a; b.append(4)

print(a)
print(b)


print("""
    ///
    
    TASK { } - it like innocent guy - it will work on every where if i did some havey task on background thred and want the data to main ui it will auto manager and set data to main actor no need to do anything here 
    
    @MainActor
    class NewsViewModel {
        var title = ""
        
        func loadNews() {
            // Inherits @MainActor!
            Task { 
                let news = await fetchFromAPI()
                self.title = news.title // Safe to update UI directly without MainActor dispatch!
            }
        }
    }
    
    TASK DETACHED { } -  it like good guy with have more domination if you wan to do some heavey taks you can do it purly isolated inside the task.detched and set proprity was .background and when it work dont need to switch to main actor so extra one line of code i need to write for this await MainActor.run 
    
    
    @MainActor
    class PhotoEditorViewModel {
        func processHighResImage(image: UIImage) {
            // Detaches from @MainActor so heavy processing doesn't lag the UI
            Task.detached(priority: .background) {
                let compressedData = image.jpegData(compressionQuality: 0.1) // Runs in background
                
                // To update UI afterward, you MUST explicitly hop back to @MainActor
                await MainActor.run {
                    print("Image processing complete")
                }
            }
        }
    }
    
    """)



/// coding pratice
///
///
print("""
    ///
    reverse a string using swift 
    
    """)



let stringdata = "Ram"

var reverseString = ""

let charData = Array(stringdata.trimmingCharacters(in: .whitespaces))


for (index,char) in stringdata.trimmingCharacters(in: .whitespaces).enumerated() {
   // reverseString = String(char) + reverseString
}

for index in stride(from: charData.count - 1 , through: 0, by: -1)
{
    reverseString.append(charData[index])
}

print(reverseString)

////

////


print("""
    
    /////
    
    find duplicate elements in string 
    
    """)

let input = "cuttack"

print(" isContainDuplicateChar : \(checkDuplicateElement(input: input))")

// logic for find duplicate elements in array
// 1st we iterate all list if we found this elemt with the matcher the input element thr stop //nd retun it index
// but if we found the duplicate emlents


// i have 

func checkDuplicateElement(find : String) -> Bool {
    let inputToChar = Array(input.trimmingCharacters(in: .whitespaces))
    var count : Set<String> =
    for char in inputToChar {
        count.insert(String())
    }
    
    return false
}
