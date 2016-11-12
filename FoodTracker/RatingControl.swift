//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Risan Bagja Pradana  on 11/8/16.
//  Copyright © 2016 Risan Bagja Pradana. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    // MARK: Properties
    let ratingButtonSpacing: Int = 3
    let totalRatingButtons: Int = 5
    var ratingButtonSize: Int!
    
    let emptyStarImage = UIImage(named: "emptyStar")
    let filledStarImage = UIImage(named: "filledStar")
    
    var rating: Int = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var ratingButtons = [UIButton]()
    
    // MARK: Initialization.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        ratingButtonSize = Int(frame.size.height)
        
        for _ in 0..<totalRatingButtons {
            addRatingButton()
        }
    }
    
    // Layout the subviews.
    override func layoutSubviews() {
        for (index, ratingButton) in ratingButtons.enumerated() {
            let x = index * (ratingButtonSize + ratingButtonSpacing)
            ratingButton.frame = CGRect(x: x, y: 0, width: ratingButtonSize, height: ratingButtonSize)
        }
        
        updateButtonSelectionStates()
    }
    
    // Add rating button to the view
    func addRatingButton() -> Void {
        let ratingButton = UIButton(frame: CGRect(x: 0, y: 0, width: ratingButtonSize, height: ratingButtonSize))
        ratingButton.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchDown)
        
        ratingButton.setImage(emptyStarImage, for: .normal)
        ratingButton.setImage(filledStarImage, for: .selected)
        ratingButton.setImage(filledStarImage, for: [.highlighted, .selected])
        ratingButton.adjustsImageWhenHighlighted = false
        
        ratingButtons.append(ratingButton)
        addSubview(ratingButton)
    }
    
    // Match the size specified on the interface builder.
    override var intrinsicContentSize: CGSize {
        let controlWidth: Int = (ratingButtonSize * totalRatingButtons) + (ratingButtonSpacing * (totalRatingButtons - 1))
        return CGSize(width: controlWidth, height: ratingButtonSize)
    }
    
    // MARK: Button action.
    func ratingButtonTapped(button: UIButton) -> Void {
        rating = ratingButtons.index(of: button)! + 1
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() -> Void {
        for (index, ratingButton) in ratingButtons.enumerated() {
            ratingButton.isSelected = index < rating
        }
    }

}
