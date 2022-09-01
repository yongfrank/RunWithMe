//
//  DataPreview.swift
//  Running
//
//  Created by Frank Chu on 5/12/22.
//

import SwiftUI

struct DataPreview: View {
    var body: some View {
        NavigationView {
            
            VStack {
                Image("dataWithPeople")
                    .resizable()
                    .frame(width: 313, height: 118, alignment: .center)
                    .padding(.top)
                
                NavigationLink {
                    CadenceData()
                } label: {
                    Image("DataButton1")
                        .resizable()
                        .scaledToFill()
                        .padding(.horizontal)
                }
                NavigationLink {
                    PaceView()
                } label: {
                    Image("DataButton2")
                        .resizable()
                        .scaledToFill()
                        .padding(.horizontal)
                }
                NavigationLink {
                    PoseData()
                } label: {
                    Image("DataButton3")
                        .resizable()
                        .scaledToFill()
                        .padding(.horizontal)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct DataPreview_Previews: PreviewProvider {
    static var previews: some View {
        DataPreview()
    }
}
