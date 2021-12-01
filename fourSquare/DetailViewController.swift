//
//  DetailViewController.swift
//  fourSquare
//
//  Created by Ayub Ali on 01/12/2021.
//

import UIKit

class DetailViewController: UIViewController,UICollectionViewDataSource {
   
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let apiManager = ApiManager()
    var imagesData = [image]()
    var placeDetail : results!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = placeDetail.name
        categoryLbl.text = placeDetail.categories.first?.name
        
        
        // for size of image to in collection view
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 230)
        collectionView.collectionViewLayout = layout
        
    }
   
    
    //  Data will load
    override func viewWillAppear(_ animated: Bool) {
        apiManager.callImageApi(fsq_id: placeDetail.fsq_id) { (results) in
            self.imagesData = results
            print("success")
            self.collectionView.reloadData()
            let prefix = self.imagesData[1].prefix  //  site url
            let suffix = self.imagesData[1].suffix  // image url
            let size = "800x400"                    // sizw
            let url =  prefix+size+suffix           // to add
            self.coverImage.downloaded(from: url)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesData.count ?? 0   // for nill value
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MyCollectionViewCell
        let prefix = imagesData[indexPath.row].prefix
        let suffix = imagesData[indexPath.row].suffix
        let size = "original"
        let imgUrl = prefix+size+suffix
        cell.collectionImg.downloaded(from: imgUrl)
        return cell
    }
    
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated:true)
    }
    

}
   
