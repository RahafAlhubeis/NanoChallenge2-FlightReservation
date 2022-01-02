//
//  main.swift
//  SecondProject
//
//  Created by Rahaf Alhubeis on 22/05/1443 AH.
//

import Foundation


var flights = initFlights()
//initFlights()
var finish = true
repeat {
print("Hello, Travelers!")
print("----------------- Menu -----------------")
print("Please choose from the menu")
print("1- View the avalible flights")
print("2- Search for flight")
print("3- Flight ticket reservation")
print("4- Exit")


if let userchoes = readLine() {

    switch userchoes {
    case "1":
        viewFlights(array : flights)
    case "2":
        searchFlight(array : flights)
    case "3":
        reservation()
    case "4":
     //   toDo()
        print("Thank you! hope to see you again soon 🤍!")
        finish = false
    default:
        print("Please enter the number again!")
    }

}

} while finish

func initFlights() ->  [flight] {
    var flights: [flight] = []

    let flight1 = flight (ID: "EA456", name: "X6HFAJ", departure: "Riyadh, Saudi Arabia", destination: "London, UK", departureTime: "13:00", destinationTime: "21:00")

    let flight2 = flight (ID: "EA456", name: "X6HFAJ", departure: "Riyadh, Saudi Arabia", destination: "London, UK", departureTime: "13:00", destinationTime: "21:00")

    let flight3 = flight (ID: "EA456", name: "X6HFAJ", departure: "Riyadh, Saudi Arabia", destination: "London, UK", departureTime: "13:00", destinationTime: "21:00")

    let flight4 = flight (ID: "EA846", name: "X6HFAJ", departure: "Riyadh, Saudi Arabia", destination: "Rome, Italy", departureTime: "13:00", destinationTime: "21:00")

    let flight5 = flight (ID: "EY956", name: "X6HFAJ", departure: "Riyadh، Saudi Arabia", destination: "New York, US", departureTime: "13:00", destinationTime: "21:00")

    let flight6 = flight (ID: "AR296", name: "X6HFAJ", departure: "Riyadh، Saudi Arabia", destination: "Paris, France", departureTime: "13:00", destinationTime: "21:00")

    let flight7 = flight (ID: "RS456", name: "X6HFAJ", departure: "Riyadh، Saudi Arabia", destination: "Dammam, Saudi Arabia", departureTime: "13:00", destinationTime: "21:00")

     flights = [flight1, flight2, flight3, flight4, flight5, flight6, flight7]
    return flights
}

func viewFlights(array : [flight]){
    for flight in array {
       let Ticket = """
        Flight Number: \(flight.ID)                         Flight Name: \(flight.name)
        Departures: \(flight.departure)             Destination: \(flight.destination)
        Departures Time: \(flight.departureTime)                       Destination Time: \(flight.destinationTime)
        ---------------------------------------------------------------------
        """
        print(Ticket)
    }
}

func searchFlight(array : [flight]){
    print("Please enter the Flight Number")
    var found = false
    if let flightNumber = readLine() {
        for flight in array {
            if(flightNumber == flight.ID){
                let Ticket = """
                 Flight Number: \(flight.ID)                         Flight Name: \(flight.name)
                 Departures: \(flight.departure)             Destination: \(flight.destination)
                 Departures Time: \(flight.departureTime)                       Destination Time: \(flight.destinationTime)
                 ---------------------------------------------------------------------
                 """
                 print(Ticket)
                found = true
            }
        }
    }
    if (found == false){
        print("Sorry there is no flight with this number!")
    }
}

func reservation(){
print("To book a flight, please fill in the following information!")
print("Enter your name:")
    if let userName = readLine() {
        print("Enter the departure city:")
        if let departureCity = readLine() {
            print("Enter the destination city:")
            if let destinationCity = readLine() {
               print("Enter Number of seats:")
                 if let seatsNumber = readLine() {
                    print("what class do you want? \n -Economy \n -Business \n -First Class")
                        if let userclass = readLine() {
                          print("Great! Now you complete all your information \n Here are the avalible tickets \n ")

                            let seatsAvailable = countSeats(seats: seatsNumber, departure: departureCity, destination: destinationCity)
                            if seatsAvailable {
                               var numberOfTikets: Int = 0;
                            for flight in flights {
                                if departureCity.lowercased() == flight.departure.lowercased() && destinationCity.lowercased() == flight.destination.lowercased() && Int(seatsNumber) ?? 0 != numberOfTikets {

                                    let Ticket = """
                                     Flight Number: \(flight.ID)                         Flight Name: \(flight.name)
                                     Departures: \(flight.departure)             Destination: \(flight.destination)
                                     Departures Time: \(flight.departureTime)                       Destination Time: \(flight.destinationTime)
                                     ---------------------------------------------------------------------
                                     """
                                     print(Ticket)
                                    numberOfTikets += 1
                                }
                               }
                            } else {
                                print("Sorry there is't available flights :( \n")
                            }
          }
        }
       }
     }
   }
}

func countSeats (seats: String, departure: String, destination: String) -> Bool {
    var count: Int = 0;
    for flight in flights {
        if departure.lowercased() == flight.departure.lowercased() && destination.lowercased() == flight.destination.lowercased() {
            count += 1
        }
    }
    if count == 0 {
     return false
    }
    if Int(seats) ?? 0 > count {
    return false
    }
    return true
}

class flight{
    var ID : String
    var name : String
    var departure : String
    var destination: String
    var departureTime: String
    var destinationTime: String

    init(ID: String, name: String, departure: String, destination: String, departureTime: String, destinationTime: String ) {
          self.ID = ID
          self.name = name
          self.departure = departure
          self.destination = destination
          self.departureTime = departureTime
          self.destinationTime = destinationTime
      }
    }


//class Task {
//    var taskdoone : String
//    var priority : String
//    init(taskdoone: String, priority: String) {
//          self.taskdoone = taskdoone
//          self.priority = priority
//      }
//}

//func toDo() {
//    var todolist: [Task] = []
//    var check = true
//
//    repeat {
//    print("enter task or Done when your finish")
//        if let task : String = readLine() {
//            if(task.lowercased() == "done" ) {
//            check = false
//            print("your list is done")
//            print(todolist)
//            break
//
//        }
//        else {
//            print("Enter priority")
//            if let priority : String = readLine(){
//            let task1 = Task (taskdoone: task, priority: priority)
//          todolist.append(task1)
//      //     print(task)
//
//        }
//    }
//    }
//    } while check
//}






