//
//  BreakfastViewController.swift
//  fourSquare
//
//  Created by Ayub Ali on 28/11/2021.
//

import UIKit
import CoreLocation


class BreakfastViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    let apiManager = ApiManager()
    var places = [results]()
    var searchQuery: String!
    var latitude: Float = 41.8781
    var longitude: Float = -87.6298
    
    var details : results! //  data present in results
    var query:String!
    
    var filteredData = [results]()
    var search = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var lblSearch: UILabel!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        lblSearch.isHidden = true
        
        
        // MARK: - main thread
        
        DispatchQueue.main.async { [self] in
            
            self.apiManager.callPlacesApi(query: query, lat: latitude, long: longitude) {(data) in
                
                switch data{
                    
                case .success(let listOf):
                    
                    self.places = listOf.results
                    
                    if places.isEmpty{
                        alertPop(message: "No Data Found", vc: self)
                    }
                    
                    else{
                        
                        self.myTable.reloadData()
                        
                    }
                    
                case .failure(let error):
                    
                    print("Error Processing JSON Data \(error)")
                    
                }
                
            }
            
        }
        
    }
    
    
    // MARK: - passing data forword or next view
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToDetail"
        {
            let vc = segue.destination as! DetailViewController
            vc.placeDetail = details
        }
    }

    

    // MARK: - for index to be clicked
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        details = places[indexPath.row]
        performSegue(withIdentifier: "moveToDetail", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if search{
            return filteredData.count < 0 ? 0 : filteredData.count
        }
        else{
            return places == nil ? 0: (places.count)
            
        }
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell") as! MyTableCell
        if search{
            
                    let data = filteredData[indexPath.row]
                    let prefix = data.categories.first?.icon.prefix
                    let size = "bg_120"
                    let suffix = data.categories.first?.icon.suffix
                    let imgUrl = prefix!+size+suffix!

            
                    cell.placeName.text = data.name
                    cell.placeDistance.text = "Distance: \(data.distance)"
                    cell.placeImage.downloaded(from: imgUrl)
                    cell.placeProduct.text = data.categories.first?.name
            
                    return cell
        }
            
            
            else{
            
                    let data = places[indexPath.row]
                    let prefix = data.categories.first?.icon.prefix
                    let size = "bg_120"
                    let suffix = data.categories.first?.icon.suffix
                    let imgUrl = prefix!+size+suffix!

            
                    cell.placeName.text = data.name
                    cell.placeDistance.text = "Distance: \(data.distance)"
                    cell.placeImage.downloaded(from: imgUrl)
                    cell.placeProduct.text = data.categories.first?.name
            
                    return cell
            
        }
    

    
}
    
    // MARK: - to show alert
    
    func alertPop(message: String, vc: UIViewController)
   
       {
           let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
           alertController.addAction(okAction)
           vc.present(alertController, animated: true, completion: nil)
   
       }

    
   
    
    
    
    // MARK: - IBactions
    
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true)
       
    }
    

}




// MARK: - search bar to search name


extension BreakfastViewController: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
       // lblSearch.isHidden = filteredData.count != 0
        
        

        if searchText.isEmpty
        {
            search = false
            lblSearch.isHidden = true
           
        }
        else
        {
            filteredData = places.filter({$0.name.lowercased().contains(searchText.lowercased())})
           

            if filteredData.isEmpty

            {
                lblSearch.isHidden = false

            }
            else
            {
                lblSearch.isHidden = true
                search = true
              
            }

        }
        myTable.reloadData()
    }

}


