//
//  Result.swift
//  MyFirstApplication
//
//  Created by Mahmut Gazi Doğan on 24.11.2022.
//

import Foundation

struct ResultsModel: Codable {
    var id:Int?
    var name:String?
    var status:String?
    var species:String?
    var type:String?
    var gender:String?
    var origin:OriginModel?
    var location:LocationModel?
    var image:String?
    var url:String?
    var created:String?
}

// MODELS (Origin,Location,Episode)

struct OriginModel: Codable{
    var name:String?
    var url:String?
}

struct LocationModel: Codable {
    var name:String?
    var url:String?
}
