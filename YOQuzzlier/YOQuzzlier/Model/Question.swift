//
//  Question.swift
//  YOQuzzlier
//
//  Created by yangou on 2018/10/23.
//  Copyright © 2018年 hello. All rights reserved.
//

import UIKit

class Question{
    let question : String
    let correct : Bool
    
    init(text:String,correctStatus:Bool) {
        question = text
        correct = correctStatus
    }
    
}
