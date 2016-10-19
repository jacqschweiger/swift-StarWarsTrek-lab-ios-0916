//
//  ViewController.swift
//  StarWarTrek
//
//  Created by James Campagno on 10/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var anakinView: UIImageView!
    @IBOutlet weak var chebaccaView: UIImageView!
    @IBOutlet weak var hanSoloView: UIImageView!
    @IBOutlet weak var lukeSkywalkerView: UIImageView!
    @IBOutlet weak var captainKirkView: UIImageView!
    @IBOutlet weak var drMcCoyView: UIImageView!
    @IBOutlet weak var spockView: UIImageView!
    @IBOutlet weak var uhuruView: UIImageView!
    
    @IBOutlet weak var StarTrekScrollView: UIScrollView!
    
    @IBOutlet weak var StarWarsScrollView: UIScrollView!
    
    var imageList: [UIImageView] = []
    
    var firstCharacterSelected: Bool = false
    var secondCharacterSelected: Bool = false
    
    var starWarsSelected: Bool = false
    var starTrekSelected: Bool = false
    
    var starTrekImageView: UIImageView!
    var starWarsImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addImagesToList()
        addGesturRecognizerForViews()
//        StarTrekScrollView.contentSize = CGSize(width: anakinView.frame.width, height: 0.0)
//        StarWarsScrollView.contentSize = CGSize(width: anakinView.frame.width, height: 0.0)
    }
    
    func addImagesToList() {
        imageList = [anakinView, chebaccaView, hanSoloView, lukeSkywalkerView, captainKirkView, drMcCoyView, spockView, uhuruView]
    }
    
    func addGesturRecognizerForViews() {
        for view in imageList {
            let gest = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            gest.numberOfTapsRequired = 2
            view.addGestureRecognizer(gest)
        }
    }
    
    func imageTapped(_ sender: UIGestureRecognizer) {
        let tappedImage = sender.view as! UIImageView
        
        switch tappedImage.superview!.superview!{
        case StarWarsScrollView!:
            if !starWarsSelected{
                print("starwars selected")
                starWarsSelected = true
                starWarsImageView = tappedImage
                tappedImage.layer.borderWidth = 2
                tappedImage.layer.borderColor = UIColor.green.cgColor
            }
        case StarTrekScrollView!:
            if !starTrekSelected{
                print("starTrek selected")
                starTrekSelected = true
                starTrekImageView = tappedImage
                tappedImage.layer.borderWidth = 2
                tappedImage.layer.borderColor = UIColor.green.cgColor
            }
        default:
            break
            
        }
        
        if starWarsSelected && starTrekSelected{
            performSegue(withIdentifier: "fight", sender: sender)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let dest = segue.destination as! FightViewController
            dest.starTrekFighterImage = starTrekImageView.image
            dest.starWarsFighterImage = starWarsImageView.image
    }
}


