//
//  TipsViewController.swift
//  fourSquare
//
//  Created by Ayub Ali on 07/12/2021.
//

import UIKit

class TipsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tipTabel: UITableView!

    let apiManager = ApiManager()
    var detailPlace: results!
    var tipsData = [tips]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
  
    override func viewDidAppear(_ animated: Bool) {
        apiManager.callTipsApi(fsq_id: detailPlace.fsq_id, completion: {
            (results) in
    
                if results.isEmpty
    
                {
    
                    self.tipTabel.reloadData()
                    print("No Data Found")
    
                }
    
                else
    
                {
                    self.tipsData = results
                    self.tipTabel.reloadData()
    
                }
        })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
            return  tipsData.count ?? 0
    
        }
    
    
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TipsTableViewCell
    
            cell.tipsLabel.text = tipsData[indexPath.row].text
    
            return cell
    
        }
    

}



