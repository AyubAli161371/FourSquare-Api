//
//  ImageCollectionView.swift
//  fourSquare
//
//  Created by Ayub Ali on 07/12/2021.
//

import UIKit

class ImageCollectionView: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
  


    var imagesData =  [image]()
    var arrayCount:Int!
    var indexForImage:Int!
    let apiManager = ApiManager()
    var detailPlace: results!

    
    @IBOutlet weak var collectionViewOfImages: UICollectionView!
    @IBOutlet weak var imageCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                       //setting  layout items

                let layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: 180 , height: 220)
                layout.minimumInteritemSpacing = 0
                imageCollection.collectionViewLayout = layout
        
        
        
        
        
    }


    // Handling the data in view will appear

    override func viewWillAppear(_ animated: Bool) {

        //calling the places images API

        apiManager.callImageApi(fsq_id: detailPlace.fsq_id) {  (results) in
            
            if results.isEmpty
            {
                print("No Data ")
            }
            else
            {
                self.imagesData = results
                self.imageCollection.reloadData()
            }}

        }
    

    
    
    


    //handling the number of item in section

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

                arrayCount = imagesData.count
                return  imagesData.count ?? 0

            }

            //handling the data in cells

            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! ImageCollectionViewCell

                let data = imagesData[indexPath.row]
                let prefix = data.prefix
                let suffix = data.suffix
                let size = "original"
                let imgUrl = prefix+size+suffix
                cell.image.downloaded(from: imgUrl)

                return cell

            }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToImageScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToImageScreen"{
            let vc = segue.destination as! ImageViewController
            vc.images = imagesData
        }
    }
}








