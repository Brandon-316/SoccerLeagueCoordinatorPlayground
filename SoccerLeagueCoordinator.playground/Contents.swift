//: Playground - noun: a place where people can play

import UIKit

let players = [
    [
        "name": "Joe Smith",
        "height": "42",
        "experience": "YES",
        "guardian": "Jim and Jan Smith"
    ],
    [
        "name": "Jill Tanner",
        "height": "36",
        "experience": "YES",
        "guardian": "Clara Tanner"
    ],
    [
        "name": "Bill Bon",
        "height": "43",
        "experience": "YES",
        "guardian": "Sara and Jenny Bon"
    ],
    [
        "name": "Eva Gordon",
        "height": "45",
        "experience": "NO",
        "guardian": "Wendy and Mike Gordon"
    ],
    [
        "name": "Matt Gill",
        "height": "40",
        "experience": "NO",
        "guardian": "Charles and Sylvia Gill"
    ],
    [
        "name": "Kimmy Stein",
        "height": "41",
        "experience": "NO",
        "guardian": "Bill and Hillary Stein"
    ],
    [
        "name": "Sammy Adams",
        "height": "45",
        "experience": "NO",
        "guardian": "Jeff Adams"
    ],
    [
        "name": "Karl Saygan",
        "height": "42",
        "experience": "YES",
        "guardian": "Heather Bledsoe"
    ],
    [
        "name": "Suzane Greenberg",
        "height": "44",
        "experience": "YES",
        "guardian": "Henrietta Dumas"
    ],
    [
        "name": "Sal Dali",
        "height": "41",
        "experience": "NO",
        "guardian": "Gala Dali"
    ],
    [
        "name": "Joe Kavalier",
        "height": "39",
        "experience": "NO",
        "guardian": "Sam and Elaine Kavalier"
    ],
    [
        "name": "Ben Finkelstein",
        "height": "44",
        "experience": "NO",
        "guardian": "Aaron and Jill Finkelstein"
    ],
    [
        "name": "Diego Soto",
        "height": "41",
        "experience": "YES",
        "guardian": "Robin and Sarika Soto"
    ],
    [
        "name": "Chloe Alaska",
        "height": "47",
        "experience": "NO",
        "guardian": "David and Jamie Alaska"
    ],
    [
        "name": "Arnold Willis",
        "height": "43",
        "experience": "NO",
        "guardian": "Claire Willis"
    ],
    [
        "name": "Phillip Helm",
        "height": "44",
        "experience": "YES",
        "guardian": "Thomas Helm and Eva Jones"
    ],
    [
        "name": "Les Clay",
        "height": "42",
        "experience": "YES",
        "guardian": "WyNonna Brown"
    ],
    [
        "name": "Herschel Krustofski",
        "height": "45",
        "experience": "YES",
        "guardian": "Hyman and Rachel Krustofski"
    ]
]

var playersWithExperience: [[String: String]] = []
var playersWithoutExperience: [[String: String]] = []

var shortExperienced: [[String: String]] = []
var tallExperienced: [[String: String]] = []
var shortInexperienced: [[String: String]] = []
var tallInexperienced: [[String: String]] = []

var teamSize = players.count/3



var sharks: [[String: String]] = []
var dragons: [[String: String]] = []
var raptors: [[String: String]] = []



var totalHeight: Double = Double()
var meanHeight: Double = Double()

for person in players
{
    totalHeight += Double(person["height"]!)!
}
print(totalHeight)
totalHeight

meanHeight = totalHeight / Double(players.count)





func assignTeams() {

// Seperate players by experience
    for player in players {
        if player ["experience"] == "YES"{
            playersWithExperience.append(player)
        }else{
            playersWithoutExperience.append(player)
        }
    }
    
  
//Players with experience height
    for player in playersWithExperience {
//        let heightTotal = players.flatMap({ Double($0["height"]!) }).reduce(0, +)
//        let heightMean = heightTotal / Double(players.count)
        if Double(player ["height"]!)! <= meanHeight {
            shortExperienced.append(player)
        }else{
            tallExperienced.append(player)
        }
    }
    shortExperienced.count
    tallExperienced.count
    
//Players without experience height
    for player in playersWithoutExperience {
//        let heightTotal = players.flatMap({ Double($0["height"]!) }).reduce(0, +)
//        let heightMean = heightTotal / Double(players.count)
        if Double(player ["height"]!)! <= meanHeight {
            shortInexperienced.append(player)
        }else{
            tallInexperienced.append(player)
        }
    }
    shortInexperienced.count
    tallInexperienced.count
    

    

//Assign teams
    //Assign short experienced
    
    
    var numberInArray = 0
    let shortCount = shortExperienced.count
    while shortCount > 0 {
        sharks.append(shortExperienced[numberInArray])
        numberInArray += 1
        if (shortCount <= 1) {
            break
        }
        dragons.append(shortExperienced[numberInArray])
        numberInArray += 1
        if (shortCount <= 1) {
            break
        }
        raptors.append(shortExperienced[numberInArray])
        numberInArray += 1
        if (shortCount <= 1) {
            break
        }
    }
    sharks.count
    print(sharks)
    dragons.count
    print(dragons)
    raptors.count
    print(raptors)
    
    

    
    //Assign tall experienced
    for player in tallExperienced {
        
    }
    
    //Assign short inexperienced
    for player in shortInexperienced {
        
    }
    
    //Assign tall inexperienced
    for player in tallInexperienced {
        
    }
    
}


assignTeams()
playersWithExperience
playersWithExperience.count
playersWithoutExperience
playersWithoutExperience.count

shortExperienced
shortExperienced.count
tallExperienced
tallExperienced.count

shortInexperienced
shortInexperienced.count
tallInexperienced
tallInexperienced.count
