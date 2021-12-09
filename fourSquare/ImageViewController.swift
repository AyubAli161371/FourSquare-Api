//
//  ImageViewController.swift
//  fourSquare
//
//  Created by Ayub Ali on 01/12/2021.
//

import UIKit

class ImageViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
   


    
    var images = [image]()
    var placeDetail: String = ""
 
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
  // MARK: - collection view 

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SliderCollectionViewCell
        let prefix = images[indexPath.row].prefix
        let suffix = images[indexPath.row].suffix
        let size = "original"
        let imgUrl = prefix+size+suffix

        cell.imgSlider.downloaded(from: imgUrl)

        return cell
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
