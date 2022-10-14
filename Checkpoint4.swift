import Cocoa

enum RootError: Error{
    case tooLow, tooHigh, notFound
}

func squareRoot(of number: Int) throws -> Int {
    if number < 1 {
        throw RootError.tooLow
    }
    
    if number > 10_000{
        throw RootError.tooHigh
    }
    
    for i in  1...100{
        if i * i == number{
            return i
        }
    }
    
    throw RootError.notFound
}

let number = 23423432

do {
    let root = try squareRoot(of: number)
    print("The square root of \(number) is \(root)")
} catch RootError.tooLow{
    print("Sorry \(number) is too low")
} catch RootError.tooHigh{
    print("That \(number) is too high")
} catch RootError.notFound{
    print("Could not find square root for number \(number)")
} catch{
    print("There seems to be a problem")
}
