//: Playground - noun: a place where people can play

import UIKit


// MARK: Properties
let players = [
    ["name": "Joe Smith", "height": "42", "experience": "YES", "guardian": "Jim and Jan Smith"],
    ["name": "Jill Tanner", "height": "36", "experience": "YES", "guardian": "Clara Tanner"],
    [ "name": "Bill Bon", "height": "43", "experience": "YES", "guardian": "Sara and Jenny Bon"],
    ["name": "Eva Gordon", "height": "45", "experience": "NO", "guardian": "Wendy and Mike Gordon" ],
    ["name": "Matt Gill", "height": "40", "experience": "NO", "guardian": "Charles and Sylvia Gill"],
    ["name": "Kimmy Stein", "height": "41", "experience": "NO", "guardian": "Bill and Hillary Stein" ],
    ["name": "Sammy Adams", "height": "45", "experience": "NO", "guardian": "Jeff Adams"],
    ["name": "Karl Saygan", "height": "42", "experience": "YES", "guardian": "Heather Bledsoe"],
    ["name": "Suzane Greenberg", "height": "44", "experience": "YES", "guardian": "Henrietta Dumas"],
    ["name": "Sal Dali", "height": "41","experience": "NO","guardian": "Gala Dali"],
    ["name": "Joe Kavalier", "height": "39", "experience": "NO", "guardian": "Sam and Elaine Kavalier"],
    ["name": "Ben Finkelstein", "height": "44", "experience": "NO", "guardian": "Aaron and Jill Finkelstein"],
    ["name": "Diego Soto", "height": "41", "experience": "YES", "guardian": "Robin and Sarika Soto"],
    ["name": "Chloe Alaska", "height": "47", "experience": "NO", "guardian": "David and Jamie Alaska"],
    ["name": "Arnold Willis", "height": "43", "experience": "NO", "guardian": "Claire Willis"],
    ["name": "Phillip Helm", "height": "44", "experience": "YES", "guardian": "Thomas Helm and Eva Jones"],
    ["name": "Les Clay", "height": "42", "experience": "YES", "guardian": "WyNonna Brown"],
    ["name": "Herschel Krustofski", "height": "45", "experience": "YES", "guardian": "Hyman and Rachel Krustofski"]
]

// Player collections by experience
var playersWithExperience = [[String: String]]()
var playersWithoutExperience = [[String: String]]()

// Team player collections
var teamSharks = [[String: String]]()
var teamDragons = [[String: String]]()
var teamRaptors = [[String: String]]()

// Team info
let sharksInfo = ["name": "Sharks", "firstPractice": "March 17th, 3pm"]
let dragonsInfo = ["name": "Dragons", "firstPractice": "March 17th, 1pm"]
let raptorsInfo = ["name": "Raptors", "firstPractice": "March 18th, 1pm"]

var letters = [String]()



// MARK: Methods
func separatePlayersByExperience(in players: [[String: String]]) {
    for player in players {
        if player["experience"] == "YES" {
            playersWithExperience.append(player)
        } else {
            playersWithoutExperience.append(player)
        }
    }
}

func assign(players: [[String: String]]) {
    var numberInArray = 0
    var playersCount = players.count
    while playersCount > 0 {
        
        teamSharks.append(playersWithExperience[numberInArray])
        numberInArray += 1
        playersCount -= 1
        if playersCount == 0 { break }
        
        teamDragons.append(playersWithExperience[numberInArray])
        numberInArray += 1
        playersCount -= 1
        if playersCount == 0 { break }
        
        teamRaptors.append(playersWithExperience[numberInArray])
        numberInArray += 1
        playersCount -= 1
        if playersCount == 0 { break }
    }
}

func findAverageHeight(of team: [[String: String]]) -> Double {
    var teamMean = Double()
    var totalHeight = Double()
    for person in team {
        totalHeight += Double(person["height"]!)!
    }
    teamMean = totalHeight / Double(team.count)
    return teamMean
}

func compareTeamHeights() -> Bool {
    let sharksAverageHeight = findAverageHeight(of: teamSharks)
    let dragonsAverageHeight = findAverageHeight(of: teamDragons)
    let raptorsAverageHeight = findAverageHeight(of: teamRaptors)
    
    if fabs(sharksAverageHeight - dragonsAverageHeight) <= 1.5 && fabs(sharksAverageHeight - raptorsAverageHeight) <= 1.5 && fabs(dragonsAverageHeight - raptorsAverageHeight) <= 1.5 {
        let heighDifference = heightDifference(for: [sharksAverageHeight, dragonsAverageHeight, raptorsAverageHeight])
        print("\nSharks height: \(sharksAverageHeight)\nDragons height: \(dragonsAverageHeight)\nRaptors height: \(raptorsAverageHeight)\n")
        print("\nAll team heights within \(heighDifference) inch range\n\n")
        return true
    }else{
        print("\nTeam heights not within 1.5 inch range. Resetting teams and recursively calling assignTeams()\n\n")
        return false
    }
}

func heightDifference(for avgHeights: [Double]) -> Double{
    var heights = avgHeights
    heights.sort { $0 < $1 }
    
    return heights[heights.count - 1] - heights[0]
}

func printRoster(for teamName: String, players: [[String: String]]) {
    print("\n\(teamName) Players:")
    var playerNum = 1
    for player in players {
        let playerName = player["name"]!
        print("\(playerNum). \(playerName)")
        playerNum += 1
    }
}

func createLetters(for team: [[String: String]], with teamInfo: [String: String]) {
    print("\(String(describing: teamInfo["name"]))")
    for player in team {
        guard let guardians = player["guardian"],
            let playerName = player["name"],
            let teamName = teamInfo["name"],
            let firstPractice = teamInfo["firstPractice"]
            else { return }
        
        let letter = "\n----------\nDear \(guardians)\n\nThe \(teamName) would like to welcome your child \(playerName) to the team. The \(teamName) first practice will be on \(firstPractice). Good luck!\n\n\nBrandon Mahoney\nSoccer League Coordinator\n----------\n\n"
        letters.append(letter)
        
        print(letter)
    }
}

func resetTeams() {
    teamSharks.removeAll()
    teamDragons.removeAll()
    teamRaptors.removeAll()
}

func assignTeams() {
    playersWithExperience.shuffle()
    playersWithoutExperience.shuffle()
    
    //Assign teams
    assign(players: playersWithoutExperience)
    assign(players: playersWithExperience)
    
    if compareTeamHeights() {
        //Print out roster
        printRoster(for: "Sharks", players: teamSharks)
        printRoster(for: "Dragons", players: teamDragons)
        printRoster(for: "Raptors", players: teamRaptors)
        
        print("\n----------Letters----------\n")
        createLetters(for: teamSharks, with: sharksInfo)
        createLetters(for: teamDragons, with: dragonsInfo)
        createLetters(for: teamRaptors, with: raptorsInfo)
    } else {
        resetTeams()
        assignTeams()
    }
    
}

separatePlayersByExperience(in: players)
assignTeams()
