//
//  FightViewController.swift
//  StarWarTrek
//
//  Created by Douglas Galante on 10/19/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FightViewController: UIViewController {

    @IBOutlet weak var starWarsFighterView: UIImageView!
    @IBOutlet weak var starTrekFighterView: UIImageView!
    
    var starWarsFighterImage: UIImage!
   
    
    
    
    
    var starTrekFighterImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starWarsFighterView.image = starWarsFighterImage
        starTrekFighterView.image = starTrekFighterImage
        
        let characterArray = [starWarsFighterView, starTrekFighterView]
        
        for character in characterArray {
             let gesture = UIPanGestureRecognizer(target: self, action: #selector(panCharacter))
            
            character?.addGestureRecognizer(gesture)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func panCharacter(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: view)
        let character = sender.view
        character?.center = point
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
