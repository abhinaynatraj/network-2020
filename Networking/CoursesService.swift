//
//  CoursesService.swift
//  Networking
//
//  Created by Abhiney Natarajan on 2020-02-26.
//  Copyright © 2020 Abhiney Natarajan. All rights reserved.
//

import Foundation

enum CoursesService {
    case course
    case courses
}

extension CoursesService: Service {
    var baseURL: String {
        return "https://api.letsbuildthatapp.com"
    }
    
    var path: String {
        switch self {
        case .course:
            return "/jsondecodable/course"
        case .courses:
            return "/jsondecodable/courses"
        }
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var method: ServiceMethod {
        return .get
    }
    
    
}
