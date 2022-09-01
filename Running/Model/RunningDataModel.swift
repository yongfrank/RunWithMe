//
//  RunningDataModel.swift
//  Running
//
//  Created by Frank Chu on 8/31/22.
//

import Foundation

struct RunningDataModel {
    var totalTime: Int = 0
    var distance: Int = Int.random(in: 3..<10)
    var avgPace: Int = Int.random(in: 2500..<3000)
    var heartRate: Int = Int.random(in: 60..<85)
    var isCountTime = true
    var isEndRun = false
    
    //    var typeOfExercise: DataDescription
    //    var returnResult: Int
    //
    //    enum DataDescription {
    //        case totalTime, avgPace, distance, heartRate
    //    }
    //    init(typeOfExercise: DataDescription) {
    //        self.typeOfExercise = typeOfExercise
    //        self.returnResult =
    //    }
    var dataDisplay: [DataDisplay : Int] = [
        .paceFrequency: Int.random(in: 76..<85),
        .speedVariation: Int.random(in: 78..<94),
        .runningPosture: Int.random(in: 65..<88),
        .runningStrideLength: Int.random(in: 85..<93),
        .runningGroundContactTime: Int.random(in: 73..<86),
        .runningVerticalOscillation: Int.random(in: 70..<92)
    ]
    var rateWords = ["相较于上次步频配合有进步，平均配合度达到了\(Int.random(in: 75..<95))%", "相较于上次步频配合有进步，平均配合度达到了\(Int.random(in: 75..<95))%", "相较于上次步频配合有进步，平均配合度达到了\(Int.random(in: 75..<95))%"]
    
    enum DataDisplay {
        case runningStrideLength, runningGroundContactTime, runningVerticalOscillation
        case runningPosture, paceFrequency, speedVariation
    }
}
