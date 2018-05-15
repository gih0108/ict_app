//
//  ViewController.swift
//  Match App
//
//  Created by student35 on 2018. 5. 3..
//  Copyright © 2018년 student35. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var model = CardModel()
    var cardArray = [Card]()
    
    var firstFlippedCardIndex:IndexPath?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call the getCards method of the card model
        cardArray = model.getCards()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    // Mark: - UICollectionView Protocol Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cardArray.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Get an CardCollectionViewCell object
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        
        // Get the card that the collecton view is trying to display
        let card = cardArray[indexPath.row]
        
        // Set that card for the cell
        cell.setCard(card)
        
        return cell
    }
    
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Get the cell that the user selected
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        // Get the card that the user selected
        let card = cardArray[indexPath.row]
        
        if card.isFlipped == false {
            
            // Flip the card
            cell.flip()
            
            // Set the status of the card
            card.isFlipped = true
            
            // Determine if it's the first card or second card that's flipped over
            
            
            if firstFlippedCardIndex == nil {
                
                // This is the first card being flipped
                firstFlippedCardIndex = indexPath
            }
            else{
                
                // This is the second card being flipped
                
                // TODO : Peform the matching logic
                // Flip the card back
                cell.flipBack()
                
                // Set the status of the card
                card.isFlipped = false
            }
        }
        
    } // End the didSelectItemAt method
    
    // Mark : - Game Logic Methods
    
    func checkForMatches(_ secondFlippedCardIndex:IndexPath){
        
        // Get the cells for the two card that were revealed
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
        
        // Get the cards for the two cards that were revealed
        let cardOne = cardArray[firstFlippedCardIndex!.row]
        let cardTwo = cardArray[secondFlippedCardIndex.row]
        
        // Compare the two cards
        cardOne.imageName == cardTwo.imageName {
            // It's a match
            
            // Set the statuese of the cards
            
            // Remove the cards from the grid
        }
        else{
            
            // It's not a match
            
            // Set the statuese of the cards
            
            // Flip both cards back
        }
        
        firstFlippedCardIndex = nil
    }


} // End ViewController class

