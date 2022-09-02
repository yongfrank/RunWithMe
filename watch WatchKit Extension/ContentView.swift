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
import UIKit
struct ContentView: View {
    
    @Binding private var isPresented: Bool
    
    @StateObject var locationManager = LocationManager()
    
    @State private var showData: Bool = false
    
    @State private var stop: Bool = false
    
    
    
    init(isPresented: Binding<Bool>) {
        _isPresented = isPresented

    }
    
    
    var body: some View {
        
        
        Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
            .edgesIgnoringSafeArea(.all)
        .padding()
        .onTapGesture {
            stop = true
        }
        
        if stop == true {
            VStack {
                HStack {
                    VStack {
                        Image("Circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("跑步结束")
                            .foregroundColor(Color.white)
                        
                    }.onTapGesture {
                        self.showData = true
                    }
                    Spacer()
                    
                    VStack {
                        Image("Triangle")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("跑步继续")
                            .foregroundColor(Color.white)
                    }.onTapGesture {
                        self.stop = false
                    }
                }
                
                Spacer(minLength: 10)
                
                HStack {
                    VStack {
                        Text("总时长")
                            .foregroundColor(Color.white)
                        Text("0")
                            .foregroundColor(Color.white)
                        Text("平均频率")
                            .foregroundColor(Color.white)
                        Text("0")
                            .foregroundColor(Color.white)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("距离")
                            .foregroundColor(Color.white)
                        Text("0")
                            .foregroundColor(Color.white)
                        Text("心率")
                            .foregroundColor(Color.white)
                        Text("0")
                            .foregroundColor(Color.white)
                    }
                }
            }
            .fullScreenCover(isPresented: $showData, content: {
                DataView(isPresented: $showData)
            })
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))

        }
    
    }
}
struct ContentView_Previews: PreviewProvider {
    
    @State private static var show: Bool = true
    static var previews: some View {
        ContentView(isPresented: $show)
    }
}

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate,WCSessionDelegate {
    
    private let locationManager = CLLocationManager()
    
    var lastMessage: CFAbsoluteTime = 0
    
    @Published var location: CLLocationCoordinate2D?
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 42.0422448, longitude: -102.0079053),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
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
