//
//  ContentModel.swift
//  LearningApp
//
//  Created by David Zhao on 03/01/2022.
//

import Foundation

class ContentModel: ObservableObject {

    @Published var modules: [Module] = [Module]()
    var styleData: Data?
    
    @Published var currentModule:Module?
    var currentModuleIndex = 0
    
    init() {
        self.getLocalData()
    }
    
    func beginModule(_ moduleId:Int) {
        for index in 0..<self.modules.count {
            if self.modules[index].id == moduleId {
                self.currentModuleIndex = index
                break
            }
        }
        self.currentModule = self.modules[self.currentModuleIndex]
    }
    
    func getLocalData() {
        
        // MARK: - Get Json Data
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            let jsonData = try Data(contentsOf: jsonURL!)
            let jsonDecoder = JSONDecoder()
            let decodedData = try jsonDecoder.decode([Module].self, from: jsonData)
            self.modules = decodedData
            
        } catch {
            // TO DO log url Error
        }
        
        // MARK: - Style data
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            let styleData = try Data(contentsOf: styleURL!)
            self.styleData = styleData
            
        } catch {
            // TO DO log url Error
        }
    }
    
}
