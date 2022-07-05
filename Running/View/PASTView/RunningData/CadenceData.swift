//
//  CadenceData.swift
//  Running
//
//  Created by Frank Chu on 5/12/22.
//

import SwiftUI

struct CadenceData: View {
    var body: some View {
        Image("Data")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .navigationTitle("步频配合")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct CadenceData_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CadenceData()
        }
    }
}
