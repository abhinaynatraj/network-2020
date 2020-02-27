//
//  Courses.swift
//  Networking
//
//  Created by Abhiney Natarajan on 2020-02-26.
//  Copyright © 2020 Abhiney Natarajan. All rights reserved.
//

import Foundation

public class Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let number_of_lessons: Int?
}
