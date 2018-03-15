//
//  restaurants.swift
//  midterm
//
//  Created by Pujan Tandukar on 3/15/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import Foundation
import RealmSwift

class restaurants: Object{
    @objc dynamic var name = String()
    @objc dynamic var url = String()
}

struct restaurant{
    var name: String
    var url: String
}
