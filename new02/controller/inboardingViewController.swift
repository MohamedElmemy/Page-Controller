//
//  inboardingViewController.swift
//  new02
//
//  Created by Ahmed Elmemy on 29/07/2022.
//

import UIKit
import MOLH

class inboardingViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var LanguageButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var Nextbtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides : [onboardingSlide] = []
    
    
    var currentPage = 0{
        didSet{
            pageControl.currentPage = currentPage
            if currentPage != slides.count - 1 {
                Nextbtn.setTitle("Next".localized, for: .normal)
                
            }else {
                Nextbtn.setTitle("Get Started".localized, for: .normal)
            }
        }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        LanguageButton.setTitle("LanguageButton".localized , for: .normal)
        
        slides = [onboardingSlide(image: UIImage(named: "Image1")! , description: "image1".localized) ,
                  onboardingSlide(image: UIImage(named: "Image2")!, description: "image2".localized) ,
                  onboardingSlide(image: UIImage(named: "Image3")!, description: "image3".localized) ,
                  onboardingSlide(image: UIImage(named: "Image4")!, description: "image4".localized) ,
                  onboardingSlide(image: UIImage(named: "Image5")!, description: "image5".localized)
        ]
        
        
        
        pageControl.numberOfPages = slides.count
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        Nextbtn.setTitle("Next".localized, for: .normal)
      
    }
    
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        
        if currentPage == slides.count - 1 {
            //            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            ////            controller.modalPresentationStyle = .fullScreen
            //            present(controller, animated: true, completion: nil)
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Auth", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            
            self.navigationController?.pushViewController(newViewController, animated: true)
        }else{
            
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
        
    }
    
    @IBAction func Changelanguage(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Alert".localized, message: "Message".localized, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Launch".localized, style: UIAlertAction.Style.destructive, handler: { action in
            
            
            MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
            MOLH.reset()
            
            
          
            
            
        }))
        
        
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! onboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
           }
        
        
    }
    
    

