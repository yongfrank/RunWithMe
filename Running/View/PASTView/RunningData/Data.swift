//
//  Data.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

struct Data: View {
    var body: some View {
        NavigationView {
            VStack {
                DataView()
//                    .frame(width: 350, height: 900)
                    .navigationBarHidden(true)
            }
        }
    }
}

struct Data_Previews: PreviewProvider {
    static var previews: some View {
        Data()
    }
}
