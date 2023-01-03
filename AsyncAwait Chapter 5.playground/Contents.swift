import UIKit

enum BigError: Error {
    case powerOutage
    case endOfTheWorld
}

enum Response {
    case success
    case failure
}

let startTime = NSDate()

func doSomething() async throws -> Response {
    print("Starting task")
    Thread.sleep(forTimeInterval: 2)
    
    let randomNumber = Int.random(in: 0..<2)
    
    if randomNumber == 0 {
        throw BigError.powerOutage
    }
    return Response.success
}

// Calling the function
func callFunction() {
    Task(priority: .low) {
        do {
            let result = try await doSomething()
            print ("Result = \(result)")
        } catch {
            if let whatError = error as? BigError {
                print ("This is the error = \(whatError)")
            } else {
                print ("Unknown error")
            }
        }
    }
    print("Ending task")
}

callFunction()
let endTime = NSDate()
print("Completed in \(endTime.timeIntervalSince(startTime as Date)) seconds")
