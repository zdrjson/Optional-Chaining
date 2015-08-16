//
//  main.swift
//  Optional Chaining(swift)
//
//  Created by 张德荣 on 15/8/16.
//  Copyright (c) 2015年 JsonZhang. All rights reserved.
//

import Foundation

class Room {
    let name : String
    init(name : String) {
      self.name = name
    }
}

class Address {
    var buildingName : String?
    var buildingNumber : String?
    var street: String?
    func buildingIndentifier() ->String?{
      if buildingName != nil
      {
        return buildingName
      }
      else if buildingNumber != nil {
       return buildingNumber
      }
      else
      {
        return nil
      }
    }
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms : Int {
     return rooms.count
    }
    
    subscript(i : Int) ->Room{
        return rooms[i]
    }
    func printNumberOfRooms(){
      println("The number of rooms is \(numberOfRooms)")
    }
    
    var address :Address?
    
}

class Person {
    var residence:Residence?
}


let john = Person()
if let roomCount = john.residence?.numberOfRooms{

  println("John's residence has \(roomCount) room(s).")
}
else
{
   println("Unable to retrieve the number of rooms.")
}
//if语句来检查是否能成功调用printNumberOfRooms方法
if john.residence?.printNumberOfRooms() != nil
{
   println("It was possible to print the number of rooms.")
}
else
{
   println("It was not possible to print the number of rooms.")
}

if let firstRoomName = john.residence?[0].name {
      println("The first room  name is \(firstRoomName)")
}
else
{
     println("Unable to retrieve the first room name.")
}


let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name :"Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse

if let firstRoomName = john.residence?[0].name {

  println("The first name is \(firstRoomName)")
}
else
{
  println("Unable to retrieve the first room name.")
}

if let johnsStreet = john.residence?.address?.street {
 println("John's street name is \(johnsStreet).")
}
else
{
 println("Unable to retrieve the address.")
}


let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence?.address = johnsAddress


if let johnsStreet = john.residence?.address?.street{
 println("John's street name is \(johnsStreet).")
}
else
{
 println("Unable to retrieve the address")

}

if let buildingIdentifier = john.residence?.address?.buildingIndentifier()
{
    println("John's building identifier is \(buildingIdentifier)")
}

if let upper = john.residence?.address?.buildingIndentifier()?.uppercaseString{
 println("John's uppercase building identifier is \(upper).")
}


