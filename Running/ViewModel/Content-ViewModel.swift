//
//  Content-ViewModel.swift
//  Running
//
//  Created by Frank Chu on 6/17/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var runData: RunningDataModel
    private var repository = RunningRepository()
    
    
    func load() {
        
    }
    
}
