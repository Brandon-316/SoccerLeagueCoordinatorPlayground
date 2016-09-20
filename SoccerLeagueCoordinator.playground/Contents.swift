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

var sharks: [[String: String]] = []
var dragons: [[String: String]] = []
var raptors: [[String: String]] = []

var totalHeight: Double = Double()


func assignTeams() {
// Seperate players by experience
    for player in players {
        if player ["experience"] == "YES"{
            playersWithExperience.append(player)
        }else{
            playersWithoutExperience.append(player)
        }
    }

//Sort players by height
    _ = playersWithExperience.sort {
        if ($0["height"] == $1["height"]) {
            return $0["height"]! < $1["height"]!
        } else {
            return $0["height"]! < $1["height"]!
        }
    }
    
    _ = playersWithoutExperience.sort {
        if ($0["height"] == $1["height"]) {
            return $0["height"]! < $1["height"]!
        } else {
            return $0["height"]! < $1["height"]!
        }
    }
    
//Assign teams
    var numberInArray = 0
    var experiencedCount = playersWithExperience.count
    while experiencedCount > 1 {

        sharks.append(playersWithExperience[numberInArray])
        numberInArray += 1
        experiencedCount -= 1

        dragons.append(playersWithExperience[numberInArray])
        numberInArray += 1
        experiencedCount -= 1

        raptors.append(playersWithExperience[numberInArray])
        numberInArray += 1
        experiencedCount -= 1
    }
    
    var inexperiencedArray = 0
    var inexperiencedCount = playersWithoutExperience.count
    while inexperiencedCount > 1 {
        
        raptors.append(playersWithoutExperience[inexperiencedArray])
        inexperiencedArray += 1
        inexperiencedCount -= 1
        
        dragons.append(playersWithoutExperience[inexperiencedArray])
        inexperiencedArray += 1
        inexperiencedCount -= 1
        
        sharks.append(playersWithoutExperience[inexperiencedArray])
        inexperiencedArray += 1
        inexperiencedCount -= 1
    }
    
//Print out roster
    func printRoster(team: [[String: String]]) {
        for player in team {
            let playerName = player["name"]!
            print(playerName)
        }
    }
    printRoster(team: sharks)
    print("Sharks player count: \(sharks.count)\n")
    printRoster(team: dragons)
    print("Dragons player count: \(dragons.count)\n")
    printRoster(team: raptors)
    print("Raptors player count: \(raptors.count)\n")

    
//Check if difference in height is 1.5"
    func findTeamMean(team: [[String: String]]) -> Double {
        var teamMean: Double = Double()
        var totalHeight: Double = Double()
        for person in team {
            totalHeight += Double(person["height"]!)!
        }
        teamMean = totalHeight / Double(team.count)
        return teamMean
    }

    let sharksAverageHeight = findTeamMean(team: sharks)
    let dragonsAverageHeight = findTeamMean(team: dragons)
    let raptorsAverageHeight = findTeamMean(team: raptors)

    if sharksAverageHeight - dragonsAverageHeight <= 1.5 &&
        sharksAverageHeight - raptorsAverageHeight <= 1.5 &&
        dragonsAverageHeight - raptorsAverageHeight <= 1.5 {
        print("\nAll team heights within 1.5 inch range\n\n")
    }else{
        print("\nTeam heights not within 1.5 inch range\n\n")
    }
    
    
//Print message to guardians
    let sharksFirstPractice = "March 17th, 3pm"
    let sharksName = "Sharks"
    let dragonsFirstPractice = "March 17th, 1pm"
    let dragonsName = "Dragons"
    let raptorsFirstPractice = "March 18th, 1pm"
    let raptorsName = "Raptors"
    
    func printMessages(team: [[String: String]], teamName: String, firstPractice: String) {
        for player in team {
            let guardians = player["guardian"]!
            let playerName = player["name"]!
            
            print("Dear \(guardians)\n\nThe \(teamName) would like to welcome your child \(playerName) to the team. The \(teamName) first practice will be on \(firstPractice). Good luck!\n\n\nBrandon Mahoney\nSoccer League Coordinator\n\n\n")
        }
    }
    
printMessages(team: sharks, teamName: sharksName, firstPractice: sharksFirstPractice)
printMessages(team: dragons, teamName: dragonsName, firstPractice: dragonsFirstPractice)
printMessages(team: raptors, teamName: raptorsName, firstPractice: raptorsFirstPractice)
}

assignTeams()





