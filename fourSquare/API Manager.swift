//
//  API Manager.swift
//  fourSquare
//
//  Created by Ayub Ali on 29/11/2021.
//

import Foundation
import UIKit

// MARK: - Search places Api
class ApiManager{

func callPlacesApi(query: String, lat:Float, long:Float,   completion: @escaping (Result<Initial,Error>) -> Void)

{
    
    let headers = [
        
        "Accept": "application/json",
        
        "Authorization": "fsq3a1bktaaSmiWyTJ9Qacs5eK/Rz1AmQCGYf7u0MYvwSX4="
        
    ]
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/search?query=\(query)&ll=\(lat)%2C\(long)")! as URL,
                                      
                                      cachePolicy: .useProtocolCachePolicy,
                                      
                                      timeoutInterval: 10.0)
    
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        
        if let error = error {
            print(error)
        }
        
        
        
        guard let response = response as? HTTPURLResponse else {
            print("Empty Response")
            return
        }
        
        
        
        guard let data = data else {
            print("Empty Data")
            return
        }
        
        do{
            let jsonData = try JSONDecoder().decode(Initial.self,from: data)
            
            DispatchQueue.main.async {
                completion(.success(jsonData))
            }
        }
        
        catch
            
        {
            completion(.failure(error))
        }
        
    })
    
    dataTask.resume()
}
    
    
// MARK: - For images api

    func callImageApi(fsq_id: String,   completion: @escaping ([image]) ->()) -> Void

    {
        
        let headers = [
            
            "Accept": "application/json",
            
            "Authorization": "fsq3a1bktaaSmiWyTJ9Qacs5eK/Rz1AmQCGYf7u0MYvwSX4="
            
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/\(fsq_id)/photos") as! URL,
                                          
                                          cachePolicy: .useProtocolCachePolicy,
                                          
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if let error = error {
                print(error)
            }
            
            
            
            guard let response = response as? HTTPURLResponse else {
                print("Empty Response")
                return
            }
            
            
            
            guard let data = data else {
                print("Empty Data")
                return
            }
            
            do{
                let jsonData = try JSONDecoder().decode([image].self,from: data)
                DispatchQueue.main.async {
                    completion(jsonData)
                }
                
            }
            
            catch
                
            {
                print(error)
            }
            
        })
        
        dataTask.resume()
    }

    
   // MARK: - tip api
    func callTipsApi(fsq_id: String,   completion: @escaping  ([tips]) ->()) -> Void

        {



            let headers = [

              "Accept": "application/json",

              "Authorization": "fsq3a1bktaaSmiWyTJ9Qacs5eK/Rz1AmQCGYf7u0MYvwSX4="

            ]



            let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/\(fsq_id)/tips") as! URL,

                    cachePolicy: .useProtocolCachePolicy,

                    timeoutInterval: 10.0)

            request.httpMethod = "GET"

            request.allHTTPHeaderFields = headers



            let session = URLSession.shared

            

            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in

                

                if let error = error {

                    print(error)

                }

                

                guard let response = response as? HTTPURLResponse else {

                    print("Empty Response")

                    return

                }

                

                guard let data = data else {

                    print("Empty Data")

                    return

                }

                

                do{

                    let placesTips = try JSONDecoder().decode([tips].self,from: data)

                    DispatchQueue.main.async {

                        completion(placesTips)

                    }

                }

                catch

                {

                   print(error)

                }

            })



            dataTask.resume()

          

        }
    
    
    
    // MARK: - Calling Places Nearby API

        

        func callNearbyPlacesApi(lat:Double, long:Double,    completion: @escaping (Result<Initial,Error>) -> Void)

        {


            let headers = [

              "Accept": "application/json",

              "Authorization": "fsq3a1bktaaSmiWyTJ9Qacs5eK/Rz1AmQCGYf7u0MYvwSX4="

            ]

            let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/nearby?ll=\(lat)%2C\(long)&limit=20")! as URL,

                                                    cachePolicy: .useProtocolCachePolicy,

                                                timeoutInterval: 10.0)

            request.httpMethod = "GET"

            request.allHTTPHeaderFields = headers



            let session = URLSession.shared

            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in

                

                if let error = error {

                    print(error)

                }

                

                guard let response = response as? HTTPURLResponse else {

                    print("Empty Response")

                    return

                }

                

                guard let data = data else {

                    print("Empty Data")

                    return

                }

                

                do{

                    let jsonData = try JSONDecoder().decode(Initial.self,from: data)

                

                    DispatchQueue.main.async {

                        completion(.success(jsonData))

                    }

                }

                catch

                {

                    completion(.failure(error))

                }

            })



            dataTask.resume()

          

        }

        



    }





// MARK: - for download images from site
extension UIImageView {

    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {

        contentMode = mode

        URLSession.shared.dataTask(with: url) { data, response, error in

            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {

        guard let url = URL(string: link) else { return }

        downloaded(from: url, contentMode: mode)

    }

}



