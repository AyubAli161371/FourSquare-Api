//
//  NearPleacesViewController.swift
//  fourSquare
//
//  Created by Ayub Ali on 07/12/2021.
//

import UIKit

class NearPleacesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var nearPlaces: UITableView!
    
    let apiManager = ApiManager()
    var detailPlace: results!
    var nearbyPlaces = [results]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        }
    
    override func viewWillAppear(_ animated: Bool) {

            apiManager.callNearbyPlacesApi(lat: Double(detailPlace.geocodes.main.latitude), long: Double(detailPlace.geocodes.main.longitude)) { (data) in

                   switch data{

                       //success condition

                       case .success(let listOf):

                       self.nearbyPlaces = listOf.results

                       self.nearPlaces.reloadData()

                       print("Success")

                       //failure condition

                       case .failure(let error):

                           print("Error Processing JSON Data \(error)")

                       }

               }

           }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

               return nearbyPlaces.count

           }



           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

               let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! NearPlaceCell



               let prefix = nearbyPlaces[indexPath.row].categories.first?.icon.prefix
               let suffix = nearbyPlaces[indexPath.row].categories.first?.icon.suffix
               let size = "bg_120"
               let imgUrl = prefix!+size+suffix!

               cell.placeName.text = nearbyPlaces[indexPath.row].name
               cell.product.text = nearbyPlaces[indexPath.row].categories.first?.name
               cell.distance.text = "Distance: \(nearbyPlaces[indexPath.row].distance)"
              cell.nearImage.downloaded(from: imgUrl)

               return cell

           }


    
   
}




