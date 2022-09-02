//
//  VarianceCalculate.swift
//  Running
//
//  Created by Frank Chu on 9/2/22.
//
//  数据分析终极一问：指标波动有多大才算是大？
//  https://www.woshipm.com/data-analysis/4450331.html
//  https://developer.aliyun.com/article/789816
//  时序数据常用趋势检测方法 - Hahachao的文章 - 知乎
//  https://zhuanlan.zhihu.com/p/112703276

import Foundation
import UIKit
import SwiftUI

extension Array where Element: FloatingPoint {

    func sum() -> Element {
        return self.reduce(0, +)
    }

    func avg() -> Element {
        return self.sum() / Element(self.count)
    }

    func std() -> Element {
        let mean = self.avg()
        let v = self.reduce(0, { $0 + ($1-mean)*($1-mean) })
        return sqrt(v / (Element(self.count) - 1))
    }
    
}
