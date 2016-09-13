//: Playground - noun: a place where people can play

import UIKit

let players = [
    [
        "name": "Joe Smith",
        "height": 42,
        "experience": "YES",
        "guardian": "Jim and Jan Smith"
    ],
    [
        "name": "Jill Tanner",
        "height": 36,
        "experience": "YES",
        "guardian": "Clara Tanner"
    ],
    [
        "name": "Bill Bon",
        "height": 43,
        "experience": "YES",
        "guardian": "Sara and Jenny Bon"
    ],
    [
        "name": "Eva Gordon",
        "height": 45,
        "experience": "NO",
        "guardian": "Wendy and Mike Gordon"
    ],
    [
        "name": "Matt Gill",
        "height": 40,
        "experience": "NO",
        "guardian": "Charles and Sylvia Gill"
    ],
    [
        "name": "Kimmy Stein",
        "height": 41,
        "experience": "NO",
        "guardian": "Bill and Hillary Stein"
    ],
    [
        "name": "Sammy Adams",
        "height": 45,
        "experience": "NO",
        "guardian": "Jeff Adams"
    ],
    [
        "name": "Karl Saygan",
        "height": 42,
        "experience": "YES",
        "guardian": "Heather Bledsoe"
    ],
    [
        "name": "Suzane Greenberg",
        "height": 44,
        "experience": "YES",
        "guardian": "Henrietta Dumas"
    ],
    [
        "name": "Sal Dali",
        "height": 41,
        "experience": "NO",
        "guardian": "Gala Dali"
    ],
    [
        "name": "Joe Kavalier",
        "height": 39,
        "experience": "NO",
        "guardian": "Sam and Elaine Kavalier"
    ],
    [
        "name": "Ben Finkelstein",
        "height": 44,
        "experience": "NO",
        "guardian": "Aaron and Jill Finkelstein"
    ],
    [
        "name": "Diego Soto",
        "height": 41,
        "experience": "YES",
        "guardian": "Robin and Sarika Soto"
    ],
    [
        "name": "Chloe Alaska",
        "height": 47,
        "experience": "NO",
        "guardian": "David and Jamie Alaska"
    ],
    [
        "name": "Arnold Willis",
        "height": 43,
        "experience": "NO",
        "guardian": "Claire Willis"
    ],
    [
        "name": "Phillip Helm",
        "height": 44,
        "experience": "YES",
        "guardian": "Thomas Helm and Eva Jones"
    ],
    [
        "name": "Les Clay",
        "height": 42,
        "experience": "YES",
        "guardian": "WyNonna Brown"
    ],
    [
        "name": "Herschel Krustofski",
        "height": 45,
        "experience": "YES",
        "guardian": "Hyman and Rachel Krustofski"
    ]
]

var playersWithExperience: [[String: Any]] = []
var playersWithoutExperience: [[String: Any]] = []

var shortplayers: [[String: Any]] = []

var teamSize = players.count/3




var sharks: [[String: Any]] = []
var dragons: [[String: Any]] = []
var raptors: [[String: Any]] = []




func playerExperience() {
    
    for player in players {
        if player ["experience"] == "YES"{
            playersWithExperience.append(player)
        }else{
            playersWithoutExperience.append(player)
        }
    }
    
    
    
    for player in playersWithExperience {
        if player ["height"] <= 42 {
            shortplayers.append(player)
        }
    }
}


playerExperience()
playersWithExperience
playersWithExperience.count
playersWithoutExperience
playersWithoutExperience.count


shortplayers
shortplayers.count
