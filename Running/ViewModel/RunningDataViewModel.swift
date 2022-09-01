//
//  RunningDataViewModel.swift
//  Running
//
//  Created by Frank Chu on 8/31/22.
//

import Foundation

enum FourTimeOptions: String {
    case week = "一周", month = "30天", year = "一年"
}

struct TypeOfChartData {
    
    let type: FourTimeOptions
    var nameOfImage: String {
        switch type {
        case .week:
            return "GraphWeek"
        case .month:
            return "GraphMonth"
        case .year:
            return "GraphYear"
        }
    }
}

protocol TypeOfTimeDisplayProtocol {
//    var options: [ChartTimeOptions] { get set }
    var headerTitle: String { get }
}

extension RunningDataViewModel {
    struct TypeOfTimeDisplay {
//        var options: [ChartTimeOptions]
        var headerTitle: String {
            return "最近\(typeOfTimeOptions.rawValue)"
        }
        
        let typeOfTimeOptions: FourTimeOptions
        
        var headerDateString: String {
            var days = 0
            switch self.typeOfTimeOptions {
            case .week:
                days = 7
            case .month:
                days = 31
            case .year:
                days = 365
            }
            return "\(Calendar.current.date(byAdding: .day, value: -days, to: Date())!.formatted(date: .abbreviated, time: .omitted))至\(Date().formatted(date: .abbreviated, time: .omitted))"
        }
        
        var typeOfChartData: TypeOfChartData {
            .init(type: typeOfTimeOptions)
        }
        
        var recommendationString: String {
            switch self.typeOfTimeOptions {
            case .week:
                return "本周\(self.recommendationsExample.shuffled()[0])"
            case .month:
                return "\(self.recommendationsExample.shuffled()[0])"
            case .year:
                return "最近一年\(self.recommendationsExample.shuffled()[0])"
            }
        }
        
        private let recommendationsExample: [String] = [
            "整体跑步姿势在进步！请保持住！",
            "初期配合度小幅波动，整体配合度提高",
            "整体配合度趋于稳定上升，提高空间较大",
            "整体上有所提高",
            "标准度略微降低，让你的跑友给你一些建议吧！"
        ]
        
        
        init(typeOfTimeDisplay: FourTimeOptions) {
            self.typeOfTimeOptions = typeOfTimeDisplay
        }
        
        
        
    }
}

final class RunningDataViewModel: ObservableObject {
    @Published var typeOfTimeDisplayData: [TypeOfTimeDisplay] = [
        .init(typeOfTimeDisplay: .week),
        .init(typeOfTimeDisplay: .month),
        .init(typeOfTimeDisplay: .year)
    ]
    
    @Published var data: RunningDataModel = RunningDataModel()
    
    private let textDisplay: [RunningDataModel.DataDisplay: String] = [.paceFrequency : "步频配合", .runningStrideLength : "步长数据", .speedVariation : "变速配合", .runningGroundContactTime: "触地时间", .runningPosture: "姿势数据", .runningVerticalOscillation : "垂直振幅"]
    
    func refreshRunningData() {
        self.data.dataDisplay = [
            .paceFrequency: Int.random(in: 76..<85),
            .speedVariation: Int.random(in: 78..<94),
            .runningPosture: Int.random(in: 65..<88),
            .runningStrideLength: Int.random(in: 85..<93),
            .runningGroundContactTime: Int.random(in: 73..<86),
            .runningVerticalOscillation: Int.random(in: 70..<92)
        ]
    }
    
    func returnTextTitle(dataType: RunningDataModel.DataDisplay) -> String {
        return self.textDisplay[dataType] ?? "加载中"
    }
    
    func endRunning() {
        self.data.isEndRun = true
        self.pauseTimeCounting()
    }
    func pauseTimeCounting() {
        self.data.isCountTime = false
    }
    func continueTimeCounting() {
        self.data.isCountTime = true
    }
    
    func getMinSec(second: Int) -> String {
        var min = 0, sec = 0
        sec = second % 60
        
        if second > 60 {
            min = second / 60
        }
        if second > 2500 {
            return "∞"
        } else {
            if sec < 10 {
                return "\(min)'0\(sec)"
            } else {
                return "\(min)'\(sec)"
            }
        }
        
    }
    func getTime(second: Int) -> String {
        var min = 0, sec = 0
        sec = second % 60
        
        if second > 60 {
            min = second / 60
        }
        if sec < 10 {
            return "\(min):0\(sec)"
        } else {
            return "\(min):\(sec)"
        }
    }
    
    func getDistance(distance: Int) -> String {
        let dis = Double(distance) / 1000.0
        return String(format: "%.2f", dis)
    }
    
    func getAccessibilityTime(second: Int) -> String {
        var min = 0, sec = 0
        sec = second % 60
        
        if second > 60 {
            min = second / 60
        }
        if sec < 10 {
            return "\(min)分零\(sec)秒"
        } else {
            return "\(min)分\(sec)秒"
        }
    }
}
