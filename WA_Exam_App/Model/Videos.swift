//
//  Videos.swift
//  WA_Exam_App
//
//  Created by Blashko Maksim on 08.03.2021.
//

import Foundation

struct PopularVideos {
    var page: String
    var url: String
    var videos: [Videos]
}

struct Videos {
    var id: Int
    var url: String
    var imageURL: String
    var duration: Int
    var videoFiles: [VideoFile]
}

struct VideoFile {
    var id: Int
    var fileType: String
    var link: String
}
