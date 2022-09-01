//
//  ContentView.swift
//  watch WatchKit Extension
//
//  Created by  yuting on 2022/8/26.
//

import SwiftUI
import MapKit
import CoreLocation
import WatchConnectivity
import HealthKit

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()

    var body: some View {
           ZStack(alignment: .bottom) {
               Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
                   .edgesIgnoringSafeArea(.all)
               .padding()
           }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate,WCSessionDelegate {

    private let locationManager = CLLocationManager()
    
    var lastMessage: CFAbsoluteTime = 0
    
    @Published var location: CLLocationCoordinate2D?
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 42.0422448, longitude: -102.0079053),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    )

    override init() {
        super.init()
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        
        
        locationManager.delegate = self
        locationManager.distanceFilter = 1
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        let status: CLAuthorizationStatus = locationManager.authorizationStatus
        if status == .authorizedWhenInUse || status == .authorizedAlways {
        // Ask permissions
            locationManager.requestLocation()
        }
    }
    
    func requestLocation() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse: break
                // do what is needed if you have access to location
        case .denied, .restricted: break
                // do what is needed if you have no access to location
            case .notDetermined:
                self.locationManager.requestWhenInUseAuthorization()
        @unknown default: break
                // raise an error - This case should never be called
            }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.first else { return }
        DispatchQueue.main.async {
            self.location = location.coordinate
            self.region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
            )
        }
        if WCSession.default.isReachable {
            
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            print("即将发送：latitude:\(latitude)")
            print("即将发送：longitude:\(longitude)")
            
            let message = ["latitude" : latitude , "longitude" : longitude]
            WCSession.default.sendMessage(message, replyHandler: { (replyDict) -> Void in
                print("发送经纬度到app 成功")
            }, errorHandler: { (error) -> Void in
                print("发送经纬度到app 错误\(error)")
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print (error)
    }
    
    //WCSessionDelegate
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
            print("session activationDidCompleteWith:\(activationState)")
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("didReceiveMessage")
    }
    
    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        print("didReceiveMessageData")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print("didReceiveMessage")
    }
    
    func session(_ session: WCSession, didReceiveMessageData messageData: Data, replyHandler: @escaping (Data) -> Void) {
        print("didReceiveMessageData")
    }
}
