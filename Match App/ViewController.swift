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
        
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        let card = cardArray[indexPath.row]
        
        if card.isFlipped == false && card.isMatched == false {
            cell.flip()
            
            card.isFlipped = true
            
            
            if firstFlippedCardIndex == nil {
                
            }
        }
        
    }


}

