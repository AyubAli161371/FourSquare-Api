//
//  Model.swift
//  fourSquare
//
//  Created by Ayub Ali on 30/11/2021.
//

import Foundation



struct Initial:Codable

{
    let results: [results]
    let context: context
}


struct results:Codable

{
    let fsq_id:String
    let categories: [categories]
    let chains: [chains]
    let distance: Float
    let name:String
    let timezone:String
    let geocodes: geocodes
    let location: location
}




struct categories: Codable

{
    let id: Int
    let name:String
    let icon: icon
}



struct icon: Codable
{
    let prefix:String
    let suffix:String
}



struct geocodes:Codable
{
    let main: main
}




struct location: Codable
{
    let address:String
    let country:String
    let dma:String
    let locality:String
    let postcode:String
    let region:String
}





                

struct main:Codable
{
    let latitude: Float
    let longitude: Float
}




struct chains: Codable
{

}



struct context : Codable
{
    let geo_bounds: geo_bounds
}



struct geo_bounds:Codable
{
    let circle: circle
}



struct circle:Codable
{
    let center: center
    let radius:Int
}



struct center:Codable
{
    let latitude:Float
    let longitude:Float
}


struct image:Codable
{
    let id: String
    let created_at: String
    let prefix: String
    let suffix: String
    let width: Int
    let height: Int
}
