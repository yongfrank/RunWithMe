//
//  MapView.swift
//  Running
//
//  Created by Frank Chu on 7/5/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var vm = LocationViewModel()
    @State var locations = [Location]()
    var timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let annotationTimer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
//        Map(coordinateRegion: $vm.region, showsUserLocation: true)
        Map(coordinateRegion: $vm.region, showsUserLocation: true, annotationItems: locations) { location in
            MapAnnotation(coordinate: location.coordinate) {
                Image(systemName: "circlebadge.fill")
            }
        }
        .ignoresSafeArea()
        .onAppear {
            vm.checkIfLocationServicesIsEnabled()
        }
        .onReceive(timer) { nowTime in
            vm.checkIfLocationServicesIsEnabled()
//            print(nowTime)
        }
        .onReceive(annotationTimer) { _ in
            locations.append(Location(latitude: vm.region.center.latitude, longitude: vm.region.center.longitude))
            // print(locations)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
