//
//  Photos.swift
//  WA_Exam_App
//
//  Created by Blashko Maksim on 08.03.2021.
//

import Foundation

struct CuratedPhotos {
    var page: String
    var photos: [Photos]
}

struct Photos {
    var id: Int
    var url: String
    var photographer: String
}
