//: Playground - noun: a place where people can play

import UIKit

//Data Models
struct Player {
    let name: String
    let height: Double
    let isExperienced: Bool
    let guardian: String
}

struct Team {
    let name: String
    let firstPractice: String
    var players: [Player]
}

// Properties //
let players: [Player] = [
    Player(name: "Joe Smith", height: 42, isExperienced: true, guardian: "Jim and Jan Smith"),
    Player(name: "Jill Tanner", height: 36, isExperienced: true, guardian: "Clara Tanner"),
    Player(name: "Bill Bon", height: 43, isExperienced: true, guardian: "Sara and Jenny Bon"),
    Player(name: "Eva Gordon", height: 45, isExperienced: false, guardian: "Wendy and Mike Gordon"),
    Player(name: "Matt Gill", height: 40, isExperienced: false, guardian: "Charles and Sylvia Gill"),
    Player(name: "Kimmy Stein", height: 41, isExperienced: false, guardian: "Bill and Hillary Stein"),
    Player(name: "Sammy Adams", height: 45, isExperienced: false, guardian: "Jeff Adams"),
    Player(name: "Karl Saygan", height: 42, isExperienced: true, guardian: "Heather Bledsoe"),
    Player(name: "Suzane Greenberg", height: 44, isExperienced: true, guardian: "Henrietta Dumas"),
    Player(name: "Sal Dali", height: 41, isExperienced: false, guardian: "Gala Dali"),
    Player(name: "Joe Kavalier", height: 39, isExperienced: false, guardian: "Sam and Elaine Kavalier"),
    Player(name: "Ben Finkelstein", height: 44, isExperienced: false, guardian: "Aaron and Jill Finkelstein"),
    Player(name: "Diego Soto", height: 41, isExperienced: true, guardian: "Robin and Sarika Soto"),
    Player(name: "Chloe Alaska", height: 47, isExperienced: false, guardian: "David and Jamie Alaska"),
    Player(name: "Arnold Willis", height: 43, isExperienced: false, guardian: "Claire Willis"),
    Player(name: "Phillip Helm", height: 44, isExperienced: true, guardian: "Thomas Helm and Eva Jones"),
    Player(name: "Les Clay", height: 42, isExperienced: true, guardian: "WyNonna Brown"),
    Player(name: "Herschel Krustofski", height: 45, isExperienced: true, guardian: "Hyman and Rachel Krustofski")
]

// Player collections by experience
var experiencedPlayers: [Player] = []
var inexperiencedPlayers: [Player] = []

// Teams
var sharks: Team = Team(name: "Sharks", firstPractice: "March 17th, 3pm", players: [])
var dragons: Team = Team(name: "Dragons", firstPractice: "March 17th, 1pm", players: [])
var raptors: Team = Team(name: "Raptors", firstPractice: "March 18th, 1pm", players: [])



// Methods
func separateByExperience(players: [Player]) {
    players.forEach { $0.isExperienced == true ? experiencedPlayers.append($0) : inexperiencedPlayers.append($0)}
}

func assign(group: [Player]) {
    var numberInArray = 0
    var playersCount = group.count
    let players = group.shuffled()
    
    while playersCount > 0 {
        sharks.players.append(players[numberInArray])
        numberInArray += 1
        playersCount -= 1
        if playersCount == 0 { break }
        
        dragons.players.append(players[numberInArray])
        numberInArray += 1
        playersCount -= 1
        if playersCount == 0 { break }
        
        raptors.players.append(players[numberInArray])
        numberInArray += 1
        playersCount -= 1
        if playersCount == 0 { break }
    }
}

func findAverageHeight(of team: Team) -> Double {
    var totalHeight = Double()
    team.players.forEach { totalHeight += $0.height }
    
    return totalHeight / Double(team.players.count)
}

func compareTeamHeights() -> Bool {
    let sharksAverageHeight = findAverageHeight(of: sharks)
    let dragonsAverageHeight = findAverageHeight(of: dragons)
    let raptorsAverageHeight = findAverageHeight(of: raptors)
    
    if fabs(sharksAverageHeight - dragonsAverageHeight) <= 1.5 && fabs(sharksAverageHeight - raptorsAverageHeight) <= 1.5 && fabs(dragonsAverageHeight - raptorsAverageHeight) <= 1.5 {
        let heighDifference = heightDifference(for: [sharksAverageHeight, dragonsAverageHeight, raptorsAverageHeight])
        print("""
                Sharks height: \(sharksAverageHeight)
                Dragons height: \(dragonsAverageHeight)
                Raptors height: \(raptorsAverageHeight)
            
                All team heights within \(heighDifference) inch range
            """)
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

func printRoster(team: Team) {
    print("\n\(team.name) Players:")
    var playerNum = 1
    team.players.forEach {
        print("\(playerNum). \($0.name)")
        playerNum += 1
    }
}

func printMessages(for team: Team) {
    print(team.name)
    for player in team.players {
        print("""
            
            -----------------------
            
            Dear \(player.guardian)
            
            The \(team.name) would like to welcome your child \(player.name) to the team. The \(team.name) first practice will be on \(team.firstPractice). Good luck!
            
            
            Brandon Mahoney
            Soccer League Coordinator
            
        """)
    }
}

func resetTeams() {
    sharks.players.removeAll()
    dragons.players.removeAll()
    raptors.players.removeAll()
}

func assignTeams() {
    //Assign teams
    assign(group: inexperiencedPlayers)
    assign(group: experiencedPlayers)
    
    if compareTeamHeights() {
        //Print out roster
        printRoster(team: sharks)
        printRoster(team: dragons)
        printRoster(team: raptors)
        
        print("\n----------Letters----------\n")
        printMessages(for: sharks)
        printMessages(for: dragons)
        printMessages(for: raptors)
    } else {
        resetTeams()
        assignTeams()
    }
}

separateByExperience(players: players)
assignTeams()
