//
//  ResultResponse.swift
//  MyFirstApplication
//
//  Created by Mahmut Gazi Doğan on 24.11.2022.
//

import Foundation

struct ResponseModel:Codable {
    var info:InfoModel?
    var results:[ResultsModel]?
}
