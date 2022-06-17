//
//  PoseData.swift
//  Running
//
//  Created by Frank Chu on 5/12/22.
//

import SwiftUI

struct PoseData: View {
    var body: some View {
        Image("speed")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .navigationTitle("变速配合")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct PoseData_Previews: PreviewProvider {
    static var previews: some View {
        PoseData()
    }
}
