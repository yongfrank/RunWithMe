//
//  SettingsView.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack{
                Image("Settings")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 316, height: 363)
                    .offset(y: -50)
                Spacer()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
