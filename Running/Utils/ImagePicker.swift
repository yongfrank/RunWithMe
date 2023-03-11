//
//  ImagePicker.swift
//  Running
//
//  Created by Frank Chu on 8/28/22.
//

import SwiftUI
import PhotosUI
/// Wrapping a UIKit view controller requires us to create a struct
/// that conforms to the `UIViewControllerRepresentable` protocol.
///
/// That protocol builds on View, which means the struct we’re defining can be used inside a SwiftUI view hierarchy,
/// however we don’t provide a body property
/// because the view’s body is the view controller itself –
/// it just shows whatever UIKit sends back.
struct ImagePicker: UIViewControllerRepresentable {

    @Binding var imageSelectedInImagePickerStruct: UIImage?
    
    /// - Parameters:
    /// - image: pass the property into image picker. It will be updated when the image is selected
    init(image: Binding<UIImage?>) {
        
        //  See Extended Reading Materials
        //  When initializing a binding variable,
        //  the syntax has changed from a $ to an underscore.
        //  https://developer.apple.com/forums/thread/120034
        self._imageSelectedInImagePickerStruct = image
    }
    
    /// These methods have really precise signatures,
    /// so I’m going to show you a neat shortcut.
    /// The reason the methods are long is because SwiftUI needs to know
    /// what type of view controller our struct is wrapping,
    /// so if we just straight up tell Swift that type Xcode will help us do the rest.
    ///
    /// That isn’t enough code to compile correctly,
    /// but when Xcode shows an error saying “Type ImagePicker does not conform to
    /// protocol `UIViewControllerRepresentable`”,
    /// please click the red and white circle to the left of the error and select “Fix”.
    /// This will make Xcode write the two methods we actually need,
    /// and in fact those methods are actually enough for Swift to figure out
    /// the view controller type so you can delete the typealias line.
    typealias UIViewControllerType = PHPickerViewController
    
    /// Conforming to UIViewControllerRepresentable does require us to
    /// fill in that struct with two methods:
    /// one called `makeUIViewController()`,
    /// which is responsible for creating the initial view controller
    ///
    /// The `makeUIViewController()` method is important,
    /// so please replace its existing “code” line with this:
    func makeUIViewController(context: Context) -> PHPickerViewController {
        
        /// It creates a new photo picker configuration,
        /// asking it to provide us only images,
        var config = PHPickerConfiguration()
        config.filter = .images
        
        /// then uses that config to create and return a `PHPickerViewController`
        /// that does the actual work of selecting an image.
        let picker = PHPickerViewController(configuration: config)
        
        /// The next step is to tell the `PHPickerViewController`
        /// that when something happens it should tell our coordinator.
        /// That code won’t compile,
        /// but before we fix it I want to spend just a moment digging in to what just happened.
        ///
        /// The reason our code doesn't compile is that Swift is checking
        /// that our coordinator class is *capable* of acting as
        /// a delegate for ** PHPickerViewController **, finding that it isn't,
        /// and so is refusing to build our code any further.
        /// To fix this we need to modify our ** Coordinator ** class.
        picker.delegate = context.coordinator

        return picker
    }
    
    /// and another called `updateUIViewController()`,
    /// which is designed to let us update the view controller when some SwiftUI state changes.
    ///
    /// We aren’t going to be using` updateUIViewController()`,
    /// so you can just delete the “code” line from there so that the method is empty.
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    /// However, we hit a problem: although we could show the image picker,
    /// we weren’t able to respond to the user selecting an image or pressing cancel.
    /// To make that happens requires a wholly new concept: coordinators.
    /// First, add this nested class inside the ImagePicker struct
    ///
    /// class inherit from `NSObject`
    /// the photo picker can say things like
    /// “hey, the user selected an image, what do you want to do?
    ///
    /// `PHPickerViewControllerDelegate`
    /// adds functionality for detecting when the user selects an image.
    /// (NSObject lets Objective-C check for the functionality;
    /// this protocol is what actually provides it.)
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        
        /// Rather than just pass the data down one level,
        /// a better idea is to tell the coordinator what its parent is,
        /// so it can modify values there directly.
        /// That means adding an ImagePicker property
        var parentInClassOfCoordinator: ImagePicker
        
        /// and associated initializer to the Coordinator class.
        /// And now we can modify `makeCoordinator()`
        init(parent: ImagePicker) {
            self.parentInClassOfCoordinator = parent
        }
        
        /// The `picker` method receives two objects we care about:
        /// the picker view controller that the user was interacting with,
        /// plus an array of the users selections because it's possible
        /// to let the user select mutiple images at once.
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            /// It's our job to do threee things:
            /// 1. Tell the Picker to dismiss itself
            picker.dismiss(animated: true)
            
            /// 2. Exit if the user made no selection - if they tapped Cancel.
            guard let provider = results.first?.itemProvider else { return }
            
            /// 3. If this has an image we can use, use it
            /// and if so place it into the parent.image
            /// `func canLoadObject(ofClass aClass: NSItemProviderReading.Type) -> Bool`
            if provider.canLoadObject(ofClass: UIImage.self) {
                // loadObject(ofClass aClass: NSItemProviderReading.Type, completionHandler: @escaping @Sendable (NSItemProviderReading?, Error?) -> Void) -> Progress
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    /// Notice how we need the typecast for UIImage -
                    /// that's because the data we're provided could in theory be anything.
                    self.parentInClassOfCoordinator.imageSelectedInImagePickerStruct = image as? UIImage
                }
            }
                
        }
        
    }
    
    /// SwiftUI won’t automatically use it for the view’s coordinator.
    /// Instead, we need to add a new method called `makeCoordinator()`,
    /// which SwiftUI will automatically call if we implement it.
    /// All this needs to do is create and configure an instance of our Coordinator class,
    /// then send it back.
    ///
    /// Right now our Coordinator class doesn’t do anything special,
    /// so we can just send one back by adding this method to the ImagePicker struct:
    ///
    /// and now we just told ImagePicker that
    /// it should have a coordinator to handle communication
    /// from that `PHPickerViewController`.
    func makeCoordinator() -> Coordinator {
        /// And now we can modify `makeCoordinator()`
        /// so that it passes the ImagePicker struct into the coordinator, like this:
        Coordinator(parent: self)
    }
}

//struct ImagePicker: UIViewControllerRepresentable {
//
//    @Binding var image: UIImage?
//
//    private let controller = UIImagePickerController()
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(parent: self)
//    }
//
//    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//        let parent: ImagePicker
//
//        init(parent: ImagePicker) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            parent.image = info[.originalImage] as? UIImage
//
//            picker.dismiss(animated: true)
//        }
//
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            picker.dismiss(animated: true)
//        }
//    }
//
//    func makeUIViewController(context: Context) -> some UIViewController {
//        controller.delegate = context.coordinator
//        return controller
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//
//    }
//}
