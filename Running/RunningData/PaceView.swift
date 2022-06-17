//
//  PaceView.swift
//  Running
//
//  Created by Frank Chu on 5/12/22.
//

import SwiftUI

struct PaceView: View {
    var body: some View {
        Image("pace")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .navigationTitle("姿势数据")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct PaceView_Previews: PreviewProvider {
    static var previews: some View {
        PaceView()
    }
}
