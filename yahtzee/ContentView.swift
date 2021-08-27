//
//  ContentView.swift
//  yahtzee
//
//  Created by joey serenko on 7/22/21.
//

import SwiftUI

enum yahtzeeVals{
    case aces
    case twos
    case threes
    case fours
    case fives
    case sixes
    
    case threeOfKind
    case fourOfKind
    case fullHouse
    case smStraight
    case lgStraight
    case YAHTZEE
}

struct ContentView: View {
    @State var die1: Int = 1
    @State var die2: Int = 1
    @State var die3: Int = 1
    @State var die4: Int = 1
    @State var die5: Int = 1
    
    @State var rrDie1: Bool = true
    @State var rrDie2: Bool = true
    @State var rrDie3: Bool = true
    @State var rrDie4: Bool = true
    @State var rrDie5: Bool = true
    @State var dice: Dice = Dice.init(diceVals: [1,1,1,1,1], needsRoll: [true, true, true, true, true])
    @State var scoreModel: Scoring = Scoring.init()
    
    @State var turnCount = 1
    @State var points = 0
    @State var errorMsg: String = ""
    var body: some View {
        VStack {
            VStack {
                Group {
                    HStack{
                        Spacer()
                        Text(errorMsg)
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text("Current Turn: \(turnCount)")
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text("Current Number of Points: \(points)")
                        Spacer()
                    }
                    .padding()
                    VStack {
                        VStack{
                            HStack{
                                Text("Die 1: \(die1)")
                                Text("Die 2: \(die2)")
                                Text("Die 3: \(die3)")
                                Text("Die 4: \(die4)")
                                Text("Die 5: \(die5)")
                            }
                        }
                        
                    }
                    HStack{
                        Spacer()
                        Text("Needs reroll?")
                        Spacer()
                    }
                    Toggle(isOn: $rrDie1) {
                        Text("Die 1")
                    }
                    Toggle(isOn: $rrDie2) {
                        Text("Die 2")
                    }
                    Toggle(isOn: $rrDie3) {
                        Text("Die 3")
                    }
                    Toggle(isOn: $rrDie4) {
                        Text("Die 4")
                    }
                    Toggle(isOn: $rrDie5) {
                        Text("Die 5")
                    }
                }
                Button(action:
                        {
                            if(turnCount < 3){
                                dice.updateRolls(d1: rrDie1, d2: rrDie2, d3: rrDie3, d4: rrDie4, d5: rrDie5)
                                dice.rollDice(numDice: 5)
                                die1 = dice.diceVals[0]
                                die2 = dice.diceVals[1]
                                die3 = dice.diceVals[2]
                                die4 = dice.diceVals[3]
                                die5 = dice.diceVals[4]
                                turnCount += 1
                            }
                            rrDie1 = true
                            rrDie2 = true
                            rrDie3 = true
                            rrDie4 = true
                            rrDie5 = true
                        }) {
                    Text("Roll dice")
                }
            }
            List {
                Group{
                    HStack{
                        Text("Aces")
                        Spacer()
                        Button(action: {
                            scoreModel.dice[0] = die1
                            scoreModel.dice[1] = die2
                            scoreModel.dice[2] = die3
                            scoreModel.dice[3] = die4
                            scoreModel.dice[4] = die5
                            
                            let score = scoreModel.scoreAces()
                            if(score == 9999){
                                errorMsg = "Error, choose something else"
                            }
                            else{
                                points += score
                                turnCount = 1
                            }
                        }, label: {
                            Text("Choose")
                        })
                    }
                    HStack{
                        Text("Threes")
                        Spacer()
                        Button(action: {
                            scoreModel.dice[0] = die1
                            scoreModel.dice[1] = die2
                            scoreModel.dice[2] = die3
                            scoreModel.dice[3] = die4
                            scoreModel.dice[4] = die5
                            
                            let score = scoreModel.scoreThrees()
                            if(score == 9999){
                                errorMsg = "Error, choose something else"
                            }
                            else{
                                points += score
                                turnCount = 1
                            }
                        }, label: {
                            Text("Choose")
                        })
                    }
                    HStack{
                        Text("Fours")
                        Spacer()
                        Button(action: {
                            scoreModel.dice[0] = die1
                            scoreModel.dice[1] = die2
                            scoreModel.dice[2] = die3
                            scoreModel.dice[3] = die4
                            scoreModel.dice[4] = die5
                            
                            let score = scoreModel.scoreFours()
                            if(score == 9999){
                                errorMsg = "Error, choose something else"
                            }
                            else{
                                points += score
                                turnCount = 1
                            }
                        }, label: {
                            Text("Choose")
                        })
                    }
                    HStack{
                        Text("Fives")
                        Spacer()
                        Button(action: {
                            scoreModel.dice[0] = die1
                            scoreModel.dice[1] = die2
                            scoreModel.dice[2] = die3
                            scoreModel.dice[3] = die4
                            scoreModel.dice[4] = die5
                            
                            let score = scoreModel.scoreFives()
                            if(score == 9999){
                                errorMsg = "Error, choose something else"
                            }
                            else{
                                points += score
                                turnCount = 1
                            }
                        }, label: {
                            Text("Choose")
                        })
                    }
                    HStack{
                        Text("Sixs")
                        Spacer()
                        Button(action: {
                            scoreModel.dice[0] = die1
                            scoreModel.dice[1] = die2
                            scoreModel.dice[2] = die3
                            scoreModel.dice[3] = die4
                            scoreModel.dice[4] = die5
                            
                            let score = scoreModel.scoreSixs()
                            if(score == 9999){
                                errorMsg = "Error, choose something else"
                            }
                            else{
                                points += score
                                turnCount = 1
                            }
                        }, label: {
                            Text("Choose")
                        })
                    }
                    HStack{
                        Text("Three Of A Kind")
                        Spacer()
                        Button(action: {
                            scoreModel.dice[0] = die1
                            scoreModel.dice[1] = die2
                            scoreModel.dice[2] = die3
                            scoreModel.dice[3] = die4
                            scoreModel.dice[4] = die5
                            
                            let score = scoreModel.scoreThreeOfKind()
                            if(score == 9999){
                                errorMsg = "Error, choose something else"
                            }
                            else{
                                points += score
                                turnCount = 1
                            }
                        }, label: {
                            Text("Choose")
                        })
                    }
                    HStack{
                        Text("Four Of A Kind")
                        Spacer()
                        Button(action: {
                            scoreModel.dice[0] = die1
                            scoreModel.dice[1] = die2
                            scoreModel.dice[2] = die3
                            scoreModel.dice[3] = die4
                            scoreModel.dice[4] = die5
                            
                            let score = scoreModel.scoreFourOfKind()
                            if(score == 9999){
                                errorMsg = "Error, choose something else"
                            }
                            else{
                                points += score
                                turnCount = 1
                            }
                        }, label: {
                            Text("Choose")
                        })
                    }
                    HStack{
                        Text("Small Straight")
                        Spacer()
                        Button(action: {
                            scoreModel.dice[0] = die1
                            scoreModel.dice[1] = die2
                            scoreModel.dice[2] = die3
                            scoreModel.dice[3] = die4
                            scoreModel.dice[4] = die5
                            
                            let score = scoreModel.scoreSmStraight()
                            if(score == 9999){
                                errorMsg = "Error, choose something else"
                            }
                            else{
                                points += score
                                turnCount = 1
                            }
                        }, label: {
                            Text("Choose")
                        })
                    }
                    HStack{
                        Text("Large Straight")
                        Spacer()
                        Button(action: {
                            scoreModel.dice[0] = die1
                            scoreModel.dice[1] = die2
                            scoreModel.dice[2] = die3
                            scoreModel.dice[3] = die4
                            scoreModel.dice[4] = die5
                            
                            let score = scoreModel.scoreLgStraight()
                            if(score == 9999){
                                errorMsg = "Error, choose something else"
                            }
                            else{
                                points += score
                                turnCount = 1
                            }
                        }, label: {
                            Text("Choose")
                        })
                    }
                    HStack{
                        Text("Yahtzee!")
                        Spacer()
                        Button(action: {
                            scoreModel.dice[0] = die1
                            scoreModel.dice[1] = die2
                            scoreModel.dice[2] = die3
                            scoreModel.dice[3] = die4
                            scoreModel.dice[4] = die5
                            
                            let score = scoreModel.scoreYahtzee()
                            if(score == 9999){
                                errorMsg = "Error, choose something else"
                            }
                            else{
                                points += score
                                turnCount = 1
                            }
                        }, label: {
                            Text("Choose")
                        })
                    }
                }
            }
        }
    }
}


struct Dice{
    var diceVals: [Int]
    var needsRoll: [Bool]
    
    mutating func rollDice(numDice: Int){
        for i in 0...numDice - 1{
            if(needsRoll[i]){
                diceVals[i] = Int.random(in: 1...6)
            }
        }
    }
    mutating func updateRolls(d1: Bool, d2: Bool, d3: Bool, d4: Bool, d5: Bool){
        needsRoll[0] = d1
        needsRoll[1] = d2
        needsRoll[2] = d3
        needsRoll[3] = d4
        needsRoll[4] = d5
    }
    
    
}
struct Scoring{
    var dice: [Int] = [1, 1, 1, 1, 1, 1]
    var acesA = true
    var twosA = true
    var threesA = true
    var foursA = true
    var fivesA = true
    var sixesA = true
    var threeOfKindA = true
    var fourOfKindA = true
    var smStraightA = true
    var lgStraightA = true
    var yahtzeeA = true
    
    func isThreeOfKind() -> Bool{
        var freqNum: [Int] = [0, 0, 0, 0, 0, 0]
        var isValid: Bool = false
        for i in dice{
            freqNum[dice[i] - 1] += 1
        }
        for i in freqNum{
            if(freqNum[i] >= 3)
            {
                isValid = true
            }
        }
        return isValid
    }
    func isFourOfKind() -> Bool{
        var freqNum: [Int] = [0, 0, 0, 0, 0, 0]
        var isValid: Bool = false
        for i in dice{
            freqNum[dice[i] - 1] += 1
        }
        for i in freqNum{
            if(freqNum[i] >= 4)
            {
                isValid = true
            }
        }
        return isValid
    }
    func isYahtzee() -> Bool{
        var freqNum: [Int] = [0, 0, 0, 0, 0, 0]
        var isValid: Bool = false
        for i in dice{
            freqNum[dice[i] - 1] += 1
        }
        for i in freqNum{
            if(freqNum[i] == 5)
            {
                isValid = true
            }
        }
        return isValid
    }
    func findRunLen() -> Int{
        var freqNum: [Int] = [0, 0, 0, 0, 0, 0]
        var isPopulated: [Bool] = [false, false, false, false, false, false]
        var runLen: Int = 1
        for i in 0...5{
            switch dice[i] {
            case 1:
                freqNum[0] += 1
                break
            case 2:
                freqNum[1] += 1
                break
            case 3:
                freqNum[2] += 1
                break
            case 4:
                freqNum[3] += 1
                break
            case 5:
                freqNum[4] += 1
                break
            case 6:
                freqNum[5] += 1
                break
            default:
                break
            }
        }
        for i in dice{
            if(freqNum[i] > 0)
            {
                isPopulated[i] = true
            }
        }
        for i in dice{
            if(isPopulated[i]){
                runLen += 1
            }
        }
        return runLen
    }
    
    
    mutating func scoreAces() -> Int{
        if(acesA){
            var score: Int = 0
            for i in dice{
                if(dice[i] == 1){
                    score = score + dice[i]
                }
            }
            acesA = false
            return score
        }
        return 9999
    }
    mutating func scoreTwos() -> Int{
        if(twosA){
            var score: Int = 0
            for i in dice{
                if(dice[i] == 2){
                    score = score + dice[i]
                }
            }
            twosA = false
            return score * 2
        }
        return 9999
    }
    mutating func scoreThrees() -> Int{
        if(threesA){
            var score: Int = 0
            for i in dice{
                if(dice[i] == 3){
                    score = score + dice[i]
                }
            }
            threesA = false
            return score * 3
        }
        return 9999
    }
    mutating func scoreFours() -> Int{
        if(foursA){
            var score: Int = 0
            for i in dice{
                if(dice[i] == 4){
                    score = score + dice[i]
                }
            }
            foursA = false
            return score * 4
        }
        return 9999
    }
    mutating func scoreFives() -> Int{
        if(fivesA){
            var score: Int = 0
            for i in dice{
                if(dice[i] == 5){
                    score = score + dice[i]
                }
            }
            fivesA = false
            return score * 5
        }
        return 9999
    }
    mutating func scoreSixs() -> Int{
        if(sixesA){
            var score: Int = 0
            for i in dice{
                if(dice[i] == 6){
                    score = score + dice[i]
                }
            }
            sixesA = false
            return score * 6
        }
        return 9999
    }
    mutating func scoreThreeOfKind() -> Int{
        var score: Int = 0
        if(threeOfKindA){
            if(isThreeOfKind()){
                for i in dice{
                    score += dice[i]
                }
            }
            threeOfKindA = false
            return score
        }
        return 9999
    }
    mutating func scoreFourOfKind() -> Int{
        var score: Int = 0
        if(fourOfKindA){
            if(isFourOfKind()){
                for i in dice{
                    score += dice[i]
                }
            }
            fourOfKindA = false
            return score
        }
        return 9999
    }
    mutating func scoreSmStraight() -> Int{
        var score: Int = 0
        if(smStraightA){
            if(findRunLen() >= 4){
                score = 30
                smStraightA = false
                return score
            }
        }
        return 9999
    }
    mutating func scoreLgStraight() -> Int{
        var score: Int = 0
        if(lgStraightA){
            if(findRunLen() == 5){
                score = 30
                lgStraightA = false
                return score
            }
        }
        return 9999
    }
    mutating func scoreYahtzee() -> Int{
        var score: Int = 0
        if(yahtzeeA){
            if(isYahtzee()){
                score = 50
                yahtzeeA = false
                return score
            }
        }
        return 9999
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
