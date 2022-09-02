//
//  ChartView.swift
//  Running
//
//  Created by Frank Chu on 8/31/22.
//


import SwiftUI
import Charts

//struct ChartDescription: AXChartDescriptorRepresentable {
//    func makeChartDescriptor() -> AXChartDescriptor {
//
//    }
//
//
//}

enum RecmendationState {
    case steady, down, up, sharplyUp, loading
}


struct ChartView: View {
    let smallSection: RunningDataViewModel.TypeOfTimeDisplay
    
    @State var data: [DataOfCharts]
//    @State var data: PersonChartViewModel
    @State var averageData: Int?
    @State var recommendationState: RecmendationState = .loading
    @State var stdVariance: Int?
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .firstTextBaseline) {
                Text(smallSection.headerTitle)
                    .font(.title2)
                    .bold()
                Text(smallSection.headerDateString)
                    .font(.caption2)
            }
            self.backgroundPink(height: 140)
        }
        .onAppear {
            DispatchQueue.main.async {
                var averageDatas = [Double]()
                for item in self.data {
                    averageDatas.append(Double(item.average))
                }
                let standardVariance = averageDatas.std()
                let average = averageDatas.avg()
                let median = self.calculateMedian(array: averageDatas)
                
                if average > median && averageDatas.last! < averageDatas.first! {
                    if standardVariance > 5.0 {
                        self.recommendationState = .up
                    } else {
                        self.recommendationState = .sharplyUp
                    }
                } else {
                    if averageDatas.last! > averageDatas.first! && standardVariance > 4.0 {
                        self.recommendationState = .down
                    } else {
                        self.recommendationState = .steady
                    }
                }
                
                self.stdVariance = Int(standardVariance)
                self.averageData = Int(average)
            }
        }
    }
    
    func backgroundPink(height: CGFloat) -> some View {
        ZStack(alignment: .top) {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    Color(#colorLiteral(red: 0.9215686321258545, green: 0.9215686321258545, blue: 0.9215686321258545, alpha: 1))
                )
            
            //            .frame(maxHeight: height)
            VStack(alignment: .leading) {
                ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        Color(#colorLiteral(red: 0.8745098114013672, green: 0.09411764144897461, blue: 0.46122294664382935, alpha: 1))
                    )
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius:20, x:2, y:8)
                    
                    
                    if #available(iOS 16.0, *) {
                        Chart(data) {
                            BarMark(
                                x: .value("时间", $0.date2),
                                y: .value("配合度", $0.animate ? $0.coopration2 : 0)
                                ,width: .fixed(3)
                            )
                            .foregroundStyle(Color(.white))
//                            .accessibilityHidden(true)
                            
                            BarMark(
                                x: .value("时间", $0.date),
                                y: .value("助跑者配合度", $0.animate ? $0.coopration : 0)
                                ,width: .fixed(3)
                            )
                            .foregroundStyle(Color(hex: "C2C2C2"))
                            
                            LineMark(
                                x: .value("时间", $0.date, unit: .day),
                                y: .value("平均配合度", $0.animate ? $0.average : 0)
//                                ,width: .fixed(3)
                            )
                            .lineStyle(StrokeStyle(lineWidth: 3, dash: [5,8]))
                            .foregroundStyle(Color(hex: "C2C2C2"))
                            
                            
//                            .accessibilityHidden(true)
                        }
//                                .chartLegend(.hidden)
//                                .chartXAxis(.hidden)
//                                .chartYAxis(.hidden)
                        //        .frame(width: 300, height: 200)
//                        .accessibilityElement()
                        .onAppear {
                            for (index, _) in data.enumerated() {
                                //                withAnimation(.easeIn(duration: 0.8)) {
                                DispatchQueue.main.asyncAfter(deadline: .now() + Double(data.count - index) * 0.02) {
                                    
                                    withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.7)) {
                                        data[index].animate = true
                                    }
                                }
                            }
                        }
                        .chartYScale(domain: 0...100)
//                        .frame(width: 300, height: 200)
                        .padding(.horizontal)
                        .padding(.top)
//                        .frame(maxHeight: 120)
                    } else {
                        Image(smallSection.typeOfChartData.nameOfImage)
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal)
                    }
                }
                
                Text(smallSection.recommendationString + String(trendDataStates(state: self.recommendationState)))
                    .font(.caption2)
                    .padding(.bottom, 5)
                    .padding(.horizontal, 20)
            }
        }
        .padding(.vertical, 5)
    }
    
    
    func calculateMedian(array: [Double]) -> Double {
        let sorted = array.sorted()
        if sorted.count % 2 == 0 {
            return Double((sorted[(sorted.count / 2)] + sorted[(sorted.count / 2) - 1])) / 2
        } else {
            return Double(sorted[(sorted.count - 1) / 2])
        }
    }
    
    func trendDataStates(state: RecmendationState) -> String {
        switch state {
        case .steady:
            return "趋于平稳，平均配合度\(self.averageData ?? 0)%，建议稳步提升训练强度。"
        case .down:
            return "有所降低，降低了\(self.stdVariance ?? 0)%，建议未来两周增加训练量。"
        case .up:
            return "趋于稳定上升，平均配合度\(self.averageData ?? 0)%，提高空间较大。"
        case .sharplyUp:
            return "显著提升，提升了\(self.stdVariance ?? 0)%，保持训练量，劳逸结合。"
        case .loading:
            return ""
        }
    }
}


struct CharView_Previews: PreviewProvider {
    static var previews: some View {
        ChartDataView(contentType: .runningVerticalOscillation, ringPercent: Int.random(in: 70..<90))
            .environmentObject(RunningDataViewModel())
            .environmentObject(MainPageViewMode())
            .environmentObject(StateOfSomething())
        
//        ChartView(smallSection: .init(typeOfTimeDisplay: .week), data: generateData(type: .week))
    }
}
