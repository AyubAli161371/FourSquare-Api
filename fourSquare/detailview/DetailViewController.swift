//
//  DetailViewController.swift
//  fourSquare
//
//  Created by Ayub Ali on 01/12/2021.
//

import UIKit

class DetailViewController: UIViewController {
   
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    
    
    
    @IBOutlet weak var imagesContainer: UIView!
    @IBOutlet weak var tipsContainer: UIView!
    @IBOutlet weak var nearbyPlaceContainer: UIView!
    
    
    
    let apiManager = ApiManager()
    var imagesData = [image]()
    var placeDetail : results!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipsContainer.isHidden = true
        nearbyPlaceContainer.isHidden = true
        
        titleLbl.text = placeDetail.name
        categoryLbl.text = placeDetail.categories.first?.name
        

    }
    
    // MARK: - cover image
    override  func viewWillAppear(_ animated: Bool) {
            apiManager.callImageApi(fsq_id: placeDetail.fsq_id) { (results) in
                self.imagesData = results
                print("success")
                let prefix = self.imagesData[1].prefix  //  site url
                let suffix = self.imagesData[1].suffix  // image url
                let size = "800x400"                    // sizw
                let url =  prefix+size+suffix           // to add
                self.coverImage.downloaded(from: url)
            }
    }
    
    // MARK: - Passing data to next containers
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "imageContainer"
        {
            let vc = segue.destination as! ImageCollectionView
            vc.detailPlace = placeDetail
            
        }
        else if segue.identifier == "TipsContainer"
        {
            let vc = segue.destination as! TipsViewController
            vc.detailPlace = placeDetail
        }
        else if segue.identifier == "PlaceContainer"
        {
            let vc =  segue.destination as! NearPleacesViewController
            vc.detailPlace = placeDetail
        }
    }
  

    
    

    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated:true)
    }
    
    @IBAction func didSegmentChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            imagesContainer.isHidden = false
            tipsContainer.isHidden = true
            nearbyPlaceContainer.isHidden = true
        }
        else if sender.selectedSegmentIndex == 1{
            imagesContainer.isHidden = true
            tipsContainer.isHidden = false
            nearbyPlaceContainer.isHidden = true
        }
        else if sender.selectedSegmentIndex == 2{
            imagesContainer.isHidden = true
            tipsContainer.isHidden = true
            nearbyPlaceContainer.isHidden = false
        }
        
        
    }
    
}
   
