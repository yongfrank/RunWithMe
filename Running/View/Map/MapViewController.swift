//
//  MapViewController.swift
//  Running
//
//  Created by  yuting on 2022/8/26.
//

import UIKit
import SwiftUI
import WatchConnectivity
import MapKit

struct MapViewController : UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> MapUIViewController {
        let controller = MapUIViewController()
        return controller
    }
    
    func updateUIViewController(_ uiViewController: MapUIViewController, context: Context) {

    }
}

class MapUIViewController: UIViewController, WCSessionDelegate {
    
    
    
    public private (set) var mapView: MKMapView!
    
    private var Locations:[CLLocationCoordinate2D] = [] //位置数组 用于保存watch发送的位置信息
    
    private var isRun:Bool = true //记录是否跑步中
    
    private var second:NSInteger = 0 //时长秒数 用于记录跑步时长
    
    private var secondTimer:Timer = Timer() //定时器 用于记录跑步时长
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        NSLog("%@", "activationDidCompleteWith activationState:\(activationState) error:\(String(describing: error))")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("%@", "sessionDidBecomeInactive: \(session)")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("%@", "sessionDidDeactivate: \(session)")
    }
    
    func sessionWatchStateDidChange(_ session: WCSession) {
        print("%@", "sessionWatchStateDidChange: \(session)")
    }
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("didReceiveMessage:\(message)")
    }
    
    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        print("didReceiveMessageData:\(messageData)")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print("didReceiveMessage replyHandler:\(message)")
       
        let longitude = message["longitude"]
        let latitude = message["latitude"]
        
        print("longitude:\(longitude!)")
        print("latitude:\(latitude!)")
        
        DispatchQueue.main.async{
            let center = CLLocationCoordinate2D(latitude: latitude as! CLLocationDegrees, longitude: longitude as! CLLocationDegrees)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.mapView.setRegion(region, animated: true)
            
            let newPin = MKPointAnnotation()
            newPin.coordinate = CLLocationCoordinate2D.init(latitude: latitude as! CLLocationDegrees, longitude: longitude as! CLLocationDegrees)
            self.mapView.addAnnotation(newPin)
            
            //将位置加入到数组
            self.Locations.append(center)
        }
      
//        let type = message["type"]
//
//        if type as! String == "location" {
//
//
//        }
    }
    
    func session(_ session: WCSession, didReceiveMessageData messageData: Data, replyHandler: @escaping (Data) -> Void) {
        print("didReceiveMessageData replyHandler:\(messageData)")
    }
    
    @objc func pause() {
        print("收到暂停通知")
        isRun = false
        
        var time = ""
        var distance = 0.0;
        var meanStr = ""
        
        //秒数转换
        if second >= 3600 {
            time = String(format: "%ld小时%02d分%02d秒", second / 3600, (second % 3600) / 60, second % 60)
        }else if second / 60 > 1 {
            time = String(format: "%ld分%02d秒", second / 60, second % 60)
        }else{
            time = String.init(format: "%ld秒",second)
        }
        print("目前时长:\(time)")
        
        
        print("Locations.count:\(Locations.count)")
        if Locations.count > 0 {
            
            var last = Locations[0]; //读取第一个经纬度
            //循环计算距离
            for i in 0 ..< Locations.count {
                let location = Locations[i];
                distance += getDistance(lat1: last.latitude, lng1: last.longitude, lat2: location.latitude, lng2: location.longitude);
                last = location
            }
            print("目前距离:\(distance/1000)公里")
            
            //计算平均配速
            let second_double = NSNumber.init(integerLiteral: second).doubleValue
            let mean = distance / second_double
            meanStr = String(format: "每秒%.2f米", mean);
            
            print("目前平均配速:\(meanStr)")
            
        }else{
            print("没有收到watch发送的位置信息")
            
            print("目前距离:0公里")
            print("目前平均配速:0")
            
        }
        
    }
    
    @objc func start() {
        print("收到继续通知")
        isRun = true
    }
    
    @objc func stop() {
        print("收到结束通知")
        isRun = false
        secondTimer.invalidate()
        
        var time = ""
        var distance = 0.0;
        var meanStr = "每秒0米"
        //秒数转换
        if second >= 3600 {
            time = String(format: "%ld小时%02d分%02d秒", second / 3600, (second % 3600) / 60, second % 60)
        }else if second / 60 > 1 {
            time = String(format: "%ld分%02d秒", second / 60, second % 60)
        }else{
            time = String.init(format: "%ld秒",second)
        }
        print("本次时长:\(time)")
        
        
        
        if Locations.count > 0 {
            
            var last = Locations[0]; //读取第一个经纬度
            //循环计算距离
            for i in 0 ..< Locations.count {
                let location = Locations[i];
                distance += getDistance(lat1: last.latitude, lng1: last.longitude, lat2: location.latitude, lng2: location.longitude);
                last = location
            }
            
            //计算平均配速
            let second_double = NSNumber.init(integerLiteral: second).doubleValue
            let mean = distance / second_double
            meanStr = String(format: "每秒%.2f米", mean);
            
            
        }else{
            print("没有收到watch发送的位置信息")
        }
        print("本次距离:\(distance/1000)公里")
        print("本次平均配速:\(meanStr)")
        
        
        UserDefaults.standard.set(distance, forKey: "distance")
        UserDefaults.standard.set(time, forKey: "time")
        UserDefaults.standard.set(meanStr, forKey: "mean")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //添加监听
        NotificationCenter.default.addObserver(self, selector: #selector(pause), name: NSNotification.Name("PAUSERUN"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(start), name: NSNotification.Name("STARTRUN"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(stop), name: NSNotification.Name("STOPRUN"), object: nil)
        
        mapView = MKMapView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        self.view.addSubview(mapView)
        
        if (WCSession.isSupported()) {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        
        //这里开始跑步
        
        //清空数组
        Locations = []
        self.mapView.removeAnnotations(self.mapView.annotations)
        
        //开启定时器
        secondTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self] timer in
            if isRun == true {
//                print("记录跑步时间 -- \(self.second)秒")
                self.second += 1
            }
        })
    }
    
    //根据角度计算弧度
    func radian(d:Double) -> Double {
         return d * Double.pi/180.0
    }
    //根据弧度计算角度
    func angle(r:Double) -> Double {
         return r * 180/Double.pi
    }

    //根据两点经纬度计算两点距离
    func getDistance(lat1:Double,lng1:Double,lat2:Double,lng2:Double) -> Double {
            let EARTH_RADIUS:Double = 6378137.0
            
            let radLat1:Double = self.radian(d: lat1)
            let radLat2:Double = self.radian(d: lat2)
            
            let radLng1:Double = self.radian(d: lng1)
            let radLng2:Double = self.radian(d: lng2)
     
            let a:Double = radLat1 - radLat2
            let b:Double = radLng1 - radLng2
            
            var s:Double = 2 * asin(sqrt(pow(sin(a/2), 2) + cos(radLat1) * cos(radLat2) * pow(sin(b/2), 2)))
            s = s * EARTH_RADIUS
            return s
    }
    
}

