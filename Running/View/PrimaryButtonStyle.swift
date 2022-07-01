//
//  PrimaryButtonStyle.swift
//  Running
//  https://youtu.be/xRu-YjukXlM
//  Created by Frank Chu on 6/27/22.
//

//import SwiftUI
//
//struct PrimaryButtonStyle: ButtonStyle {
//    var fillColor: Color  = .darkPrimaryButton
//    func makeBody(configuration: Configuration) -> some View {
//        return PrimaryButton(
//            configuration: configuration,
//            fillcolor: fillColor
//        )
//    }
//    
//    struct PrimaryButton: View {
//        let configuration: Configuration
//        let fillColor: Color
//        var body: some View {
//            return configuration.label
//                .padding(20)
//                .background(
//                    RoundedRectangle(cornerRadius: 8)
//                        .fillColor(
//                            fillColor
//                        )
//                )
//                
//        }
//    }
//}
//
//struct PrimaryButtonStyle_Previews: PreviewProvider {
//    static var previews: some View {
////        Button("HI") {}
//        Text("HI")
//    }
//}
//
//extension Color {
//    static let darkPrimaryButton = Color.white
//}
