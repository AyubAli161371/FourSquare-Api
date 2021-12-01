//
//  ViewController.swift
//  fourSquare
//
//  Created by Ayub Ali on 27/11/2021.
//

import UIKit

class ViewController: UIViewController {
    var searchQuery: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "moveToList"
        {
            let vc = segue.destination as! BreakfastViewController
            vc.query = searchQuery
        }
    }
    
    

    @IBAction func btnBreakfast(_ sender: Any) {
 
        searchQuery = "Breakfast"
        performSegue(withIdentifier: "moveToList", sender: self)
 
    }
    

    @IBAction func btnLunch(_ sender: Any) {
       

        searchQuery = "Lunch"
        performSegue(withIdentifier: "moveToList", sender: self)
    }

    
    @IBAction func btnDinner(_ sender: Any) {
        

        searchQuery = "dinner"
        performSegue(withIdentifier: "moveToList", sender: self)
    }

    
    @IBAction func btnCoffeeTea(_ sender: Any) {
        searchQuery = "Coffee&Tea"
        performSegue(withIdentifier: "moveToList", sender: self)

    }

    
    @IBAction func btnNightlift(_ sender: Any) {
        searchQuery = "Nightlife"
        performSegue(withIdentifier: "moveToList", sender: self)
    }

    
    @IBAction func btnThingsToDo(_ sender: Any) {
        searchQuery = "Things To Do"
        performSegue(withIdentifier: "moveToList", sender: self)
    }
}

