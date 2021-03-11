//
//  Photos.swift
//  WA_Exam_App
//
//  Created by Blashko Maksim on 08.03.2021.
//

import Foundation

struct CuratedPhotos: Codable {
    var page: String
    var photos: [Photos]
}

struct Photos: Codable {
    var id: Int
    var url: String
    var photographer: String
}
