//
//  ViewController.swift
//  Networking
//
//  Created by Abhiney Natarajan on 2020-02-26.
//  Copyright © 2020 Abhiney Natarajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCourses()
    }
    
    func fetchCourses() {
        let provider = ServiceProvider<CoursesService>()

        provider.load(service: .course) { result in
            switch result {
            case .success(let resp):
                print(resp)
                let str = String(decoding: resp, as: UTF8.self)
                print(str)
            case .failure(let error):
                print(error.localizedDescription)
            case .empty:
                print("No data")
            }
        }
        
        provider.load(service: .course, decodeType: Course.self) { result in
            switch result {
            case .success(let resp):
                print(resp)
            case .failure(let error):
                print(error.localizedDescription)
            case .empty:
                print("No data")
            }
        }
        
        provider.load(service: .courses, decodeType: Courses.self) { result in
            switch result {
            case .success(let resp):
                print(resp)
            case .failure(let error):
                print(error.localizedDescription)
            case .empty:
                print("No data")
            }
        }
    }


}

