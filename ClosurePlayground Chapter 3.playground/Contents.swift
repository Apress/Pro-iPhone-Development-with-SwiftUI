import UIKit

//print ("func multiplyBy2 (x: Int) -> Int {")
//func multiplyBy2 (x: Int) -> Int {
//    return x * 2
//}
//
//print(multiplyBy2(x: 4))
//print(multiplyBy2(x: 17))
//
//print("{(x: Int) -> Int in return x * 2}")
//let y = {(x: Int) -> Int in return x * 2}
//print (y(4))
//print (y(17))
//
//print("{x in return x * 2}")
//let z = {x in return x * 2}
//print (z(4))
//print (z(17))
//
//print("{x in x * 2}")
//let w = {x in x * 2}
//print (w(4))
//print (w(17))
//
//print("{$0 * 2}")
//let v = {$0 * 2}
//print(v(4))
//print(v(17))

/******************************************/

print ("func addNumbers (x: Int, y: Int) -> Int ")
func addNumbers (x: Int, y: Int) -> Int {
    return x + y
}

print(addNumbers(x: 4, y: 5))
print(addNumbers(x: 17, y: 9))

print("{(x, y) -> Int in return x + y}")
let y = {(x, y) -> Int in return x + y}
print (y(4, 5))
print (y(17, 9))

print("{(x: Int, y: Int) in return x + y}")
let z = {(x: Int, y: Int) in return x + y}
print (z(4, 5))
print (z(17, 9))

print("{(x: Int, y: Int) in x + y}")
let w = {(x: Int, y: Int) in x + y}
print (w(4, 5))
print (w(17, 9))

print("{$0 as Int + $1 as Int}")
let v = {$0 as Int + $1 as Int}
print(v(4, 5))
print(v(17, 9))

/********************/

let addNumbers1 = {(x, y) -> Int in return x + y}
let addNumbers2 = {(x: Int, y: Int) in return x + y}
let addNumbers3 = {(x: Int, y: Int) in x + y}
let addNumbers4 = {$0 as Int + $1 as Int}

let closureArray = [addNumbers1(9,1), addNumbers2(2,3), addNumbers3(7,6), addNumbers4(10,2)]
print (closureArray.count)
for i in closureArray {
    print(i)
}
