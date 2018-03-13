//
//  Memory.swift
//  project1
//
//  Created by Pujan Tandukar on 3/7/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import Foundation
import RealmSwift

class Memory: Object{
    @objc dynamic var name = String()
    @objc dynamic var emotion = String()
    @objc dynamic var descriptions = String()
    @objc dynamic var date = String()
    @objc dynamic var image = Data()
//    @objc dynamic var color = UIColor()
}

struct myMemo{
    var emotion = String()
    var color = UIColor()
    var name = String()
    var description = String()
    var date = String()
    var image = UIImage()
}

enum emotions: String{
    case Happy = "Happy"
    case Sad = "Sad"
    case Excited = "Excited"
    case Suprised = "Suprised"
    case Anger = "Anger"
}
