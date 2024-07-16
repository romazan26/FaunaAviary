//
//  ViewModel.swift
//  FaunaAviary
//
//  Created by Роман on 16.07.2024.
//

import Foundation
import CoreData

final class ZooViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    
    @Published var zoos:[Zoo] = []
    
    @Published var isPresentZoo = false
    
    @Published var simpleZooTitle = ""
    
    init(){
        getZoo()
    }
    
    //MARK: - Clear data
    func clearData(){
        simpleZooTitle = ""
    }
    
    //MARK: - Add data
    func addZoo(){
        let newZoo = Zoo(context: manager.context)
        newZoo.titleZoo = simpleZooTitle
        
        save()
        clearData()
    }
    
    //MARK: Get data
    func getZoo(){
        let request = NSFetchRequest<Zoo>(entityName: "Zoo")
        do{
            zoos = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Save data
    func save(){

        zoos.removeAll()
        manager.save()
        getZoo()
    }
}
