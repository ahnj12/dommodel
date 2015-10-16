//
//  main.swift
//  domainmodeling
//
//  Created by Jooneil Ahn on 10/15/15.
//  Copyright © 2015 Jooneil Ahn. All rights reserved.
//

import Foundation


struct Money {
    var amount : Double
    var currency : String
    
    init(amount : Double, currency : String) {
        self.amount = amount
        if (currency == "USD" || currency == "GBP" ||
            currency == "EUR" || currency == "CAN") {
            self.currency = currency
        } else {
            print(currency + " is not a valid currency")
            exit(1)
        }
    }
    
    
    mutating func convert(conCurr : String) -> Void{
        switch currency {
            case("USD"):
                switch conCurr {
                    case("EUR"):
                        amount = amount * 1.5
                    case("GBP"):
                        amount = amount * 0.5
                    case("CAN"):
                        amount = amount * 1.25
                    default:
                        print("Invalid currency to convert to")
                }
            case("EUR"):
                switch conCurr {
                    case("USD"):
                        amount = amount / 1.5
                    case("GBP"):
                        amount = (amount / 1.5) / 2
                    case("CAN"):
                        amount = (amount / 1.5) * 1.25
                    default:
                        print("Invalid currency to convert to")
                    
                }
            case("GBP"):
                switch conCurr {
                    case("USD"):
                        amount = amount * 2
                    case("EUR"):
                        amount = (amount * 2) * 1.5
                    case("CAN"):
                        amount = (amount * 2) * 1.25
                    default:
                        print("Invalid currency to convert to")
                }
            case("CAN"):
                switch conCurr {
                    case("USD"):
                        amount = amount / 1.25
                    case("EUR"):
                        amount = (amount / 1.25) * 1.5
                    case("GBP"):
                        amount = (amount / 1.25) * 0.5
                    default:
                        print("Invalid currency to convert to")
                }
            default:
                print("Invalid currency to convert to")
            
        }
    }
    
    
    
    mutating func add(addNum : Double, addCurr : String)->Void {
        if (currency == addCurr) {
            amount = amount + addNum
        } else {
            let original = currency
            convert(addCurr)
            amount = amount + addNum
            currency = addCurr
            convert(original)
        }
    }
    
    mutating func subtract (subNum : Double, subCurr : String) ->Void {
        if (currency == subCurr) {
            amount = amount - subNum
        } else {
            convert(subCurr)
            amount = amount - subNum
            convert(currency)
        }
    }
}

class Job {
    var title : String
    var salary : Double
    
    init(title : String, salary : Double) {
        self.title = title
        self.salary = salary
    }
    
    func calculateIncome() -> Double {
        return salary
    }
    
    func raise(percent : Int) {
        salary = salary + (salary * (Double(percent) / 100))
    }
}

//class Person {
//    var firstName : String
//    var lastName : String
//    var age : Int
//    var job : Job
//    var spouse : Person
//    
////    init(firstName : String, lastName : String, age : Int) {
////        self.firstName = firstName
////        self.lastName = lastName
////        self.age = age
////    }
//    
//    init(firstName : String, lastName : String, age : Int, job : Job, spouse : Person) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.age = age
//        if (age >= 16) {
//            self.job = job
//        } else {
//            self.job = nil
//        }
//        if (age >= 18) {
//            self.spouse = spouse
//        } else {
//            self.spouse = nil
//        }
//    }
//    
//    func toString() -> String {
//        let name = firstName + " " + lastName
//        let stringAge = ", age " + String(age)
//        if (age < 16) {
//            return name + stringAge
//        } else if (age < 18) {
//            return name + stringAge + ", works at " + job.title
//        } else {
//            return name + stringAge + ", works at " + job.title + ", has a spouse named " + spouse.firstName + " " + spouse.lastName
//        }
//    }
//}

//class Family {
//    var members : [Person]
//    
//    init(members : [Person]) {
//        self.members = members
//    }
//    
//    func householdIncome() -> Double {
//        var result : Double = 0
//        for member in members {
//            result = result + member.job.salary
//        }
//        return result
//    }
//    
//    func haveChild(firstName : String, lastName : String) -> Void {
//        //members.append(Person(firstName: firstName, lastName: lastName, age: 0, job: nil, spouse: nil))
//    }
//}

// Tests
// Money-Tests
var money1 = Money(amount : 40.0, currency : "USD")
//var money5 = Money(amount: 0.0, currency: "TBS") // should print error
money1.convert("GBP")
print(money1.amount)
money1.convert("EUR")
print(money1.amount)
money1.convert("CAN")
print(money1.amount)
var money2 = Money(amount : 67.73, currency : "GBP")
money2.convert("USD")
print(money2.amount)
money2.convert("EUR")
print(money2.amount)
money2.convert("CAN")
print(money2.amount)
var money3 = Money(amount: 234.85, currency: "EUR")
money3.convert("USD")
print(money3.amount)
money3.convert("GBP")
print(money3.amount)
money3.convert("CAN")
print(money3.amount)
var money4 = Money(amount: 2.50, currency: "CAN")
money4.convert("USD")
print(money4.amount)
money4.convert("GBP")
print(money4.amount)
money4.convert("EUR")
print(money4.amount)
money1.add(5.0, addCurr: "USD")
print(money1.amount)
money1.add(5.0, addCurr: "GBP")
print(money1.amount)
money1.add(5.0, addCurr: "EUR")
print(money1.amount)
money1.add(5.0, addCurr: "CAN")
print(money1.amount)
money2.add(5.0, addCurr: "USD")
print(money2.amount)
money2.add(5.0, addCurr: "GBP")
print(money2.amount)
money2.add(5.0, addCurr: "EUR")
print(money2.amount)
money2.add(5.0, addCurr: "CAN")
print(money2.amount)
money3.add(5.0, addCurr: "USD")
print(money3.amount)
money3.add(5.0, addCurr: "GBP")
print(money3.amount)
money3.add(5.0, addCurr: "EUR")
print(money3.amount)
money3.add(5.0, addCurr: "CAN")
print(money3.amount)
