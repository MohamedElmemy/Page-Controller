//
//  onboardingCollectionViewCell.swift
//  new02
//
//  Created by Ahmed Elmemy on 01/08/2022.
//

import UIKit

class onboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing : onboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    
    func setup(_ slide : onboardingSlide){
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.description
    }
}
