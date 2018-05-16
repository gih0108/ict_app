//
//  CardModel.swift
//  Match App
//
//  Created by student35 on 2018. 5. 3..
//  Copyright © 2018년 student35. All rights reserved.
//

import Foundation


class CardModel {
    
    func getCards() -> [Card] {
        
        // Declare the array to store numbers we've already generated
        var generateNumbersArray = [Int]()
        
        // Declare an array to store the generated cards
        var generatedCardsArray = [Card]()
    
        
        // Randomly generate pairs of cards
        while generateNumbersArray.count < 8 {
            
            //Get a random number
            let randomNumber = arc4random_uniform(13) + 1
            
            // Ensure that the random number isn't one we already have
            if generateNumbersArray.contains(Int(randomNumber)) == false {
                
                // Log the number
                print(randomNumber)
                
                // Store the number into the generatedNumberArray
                generateNumbersArray.append(Int(randomNumber))
                
                // Create the first card object
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                
                // Add the created card
                generatedCardsArray.append(cardOne)
                
                // Create the second card object
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                
                generatedCardsArray.append(cardTwo)
            }
        }
        
        // TODO : Randomize the array
        generatedCardsArray[0] = generatedCardsArray[1]
        generatedCardsArray[1] = generatedCardsArray[0]
        
        // Return the array
        return generatedCardsArray
        
    }
    
}
