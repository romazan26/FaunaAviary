//
//  AviaryViewModel.swift
//  FaunaAviary
//
//  Created by Роман on 16.07.2024.
//

import Foundation
import CoreData


final class AviaryViewModel: ObservableObject{
    let manager = CoreDataManager.instance
    
    @Published var aviarys: [Aviary] = []
    @Published var animals: [Animal] = []
    
    @Published var simpleTitleAviary = ""
    
    @Published var textFieldTag = 1
    
    @Published var simpleSpentOnAnimals  = ""
    
    @Published var simpleTitleAnimal1 = ""
    @Published var simpleTitleAnimal2 = ""
    @Published var simpleTitleAnimal3 = ""
    @Published var simpleTitleAnimal4 = ""
    @Published var simpleTitleAnimal5 = ""
    @Published var simpleTitleAnimal6 = ""
    @Published var simpleTitleAnimal7 = ""
    @Published var simpleTitleAnimal8 = ""
    @Published var simpleTitleAnimal9 = ""
    
    @Published var simpleCountAnimal1 = ""
    @Published var simpleCountAnimal2 = ""
    @Published var simpleCountAnimal3 = ""
    @Published var simpleCountAnimal4 = ""
    @Published var simpleCountAnimal5 = ""
    @Published var simpleCountAnimal6 = ""
    @Published var simpleCountAnimal7 = ""
    @Published var simpleCountAnimal8 = ""
    @Published var simpleCountAnimal9 = ""
    
    @Published var isPresentNewAviary = false
    
    @Published var allSpent: Int16 = 0

    
    init(){
        getAviary()
        getAnimail()
        getAllSpent()
    }
    
    //MARK: - UPDATA
    func updataAviary(with id: ObjectIdentifier){
        let request = NSFetchRequest<Aviary>(entityName: "Aviary")
        do{
            aviarys = try manager.context.fetch(request)
            
            let aviary = aviarys.first(where: { $0.id == id })
            aviary?.nameAviary = simpleTitleAviary
            aviary?.spentOnAnimals = Int16(simpleSpentOnAnimals) ?? 0
        }catch let error {
            print("Dont updata: \(error.localizedDescription)")
        }
        save()
        clearData()
    }
    
    //MARK: - Fill in the data
    func fillData(aviary: Aviary){
        simpleTitleAviary = aviary.nameAviary ?? ""
        simpleSpentOnAnimals = String(aviary.spentOnAnimals)
    }
    
    //MARK: - All spent zoo
    func getAllSpent(){
        allSpent = 0
        aviarys.removeAll()
        getAviary()
        for aviary in aviarys {
            allSpent += aviary.spentOnAnimals
        }
    }
    
    //MARK: - Delete Aviary
    func deleteAviary(with id: ObjectIdentifier){
        let request = NSFetchRequest<Aviary>(entityName: "Aviary")
        do{
            aviarys = try manager.context.fetch(request)
            
            guard let aviary = aviarys.first(where: {$0.id == id}) else {return}
            getAnimail()
            for animal in animals {
                if animal.aviary == aviary{
                    manager.context.delete(animal)
                }
            }
            manager.context.delete(aviary)
            
        }catch let error {
            print("Dont updata: \(error.localizedDescription)")
        }
        save()
        
    }
    
    //MARK: - Delete animal
    func deleteAnimal(with id: ObjectIdentifier){
        let request = NSFetchRequest<Animal>(entityName: "Animal")
        do{
            animals = try manager.context.fetch(request)
            guard let animal = animals.first(where: {$0.id == id}) else {return}
            manager.context.delete(animal)
        }catch let error {
            print("Dont updata: \(error.localizedDescription)")
        }
        save()
    }
    
    //MARK: - Clear data
    func clearData(){
        simpleTitleAviary = ""
        
        textFieldTag = 1
        
        simpleSpentOnAnimals  = ""
        
        simpleTitleAnimal1 = ""
        simpleTitleAnimal2 = ""
        simpleTitleAnimal3 = ""
        simpleTitleAnimal4 = ""
        simpleTitleAnimal5 = ""
        simpleTitleAnimal6 = ""
        simpleTitleAnimal7 = ""
        simpleTitleAnimal8 = ""
        simpleTitleAnimal9 = ""
        
        simpleCountAnimal1 = ""
        simpleCountAnimal2 = ""
        simpleCountAnimal3 = ""
        simpleCountAnimal4 = ""
        simpleCountAnimal5 = ""
        simpleCountAnimal6 = ""
        simpleCountAnimal7 = ""
        simpleCountAnimal8 = ""
        simpleCountAnimal9 = ""
    }
    
    //MARK: - Add data
    func addAviary(){
        let newAviary = Aviary(context: manager.context)
        newAviary.nameAviary = simpleTitleAviary
        newAviary.spentOnAnimals = Int16(simpleSpentOnAnimals) ?? 0
        
        if !simpleTitleAnimal1.isEmpty{
            addAnimal(simpleAnimal: simpleTitleAnimal1, simpleCount: simpleCountAnimal1, aviary: newAviary)
        }
        if !simpleTitleAnimal2.isEmpty{
            addAnimal(simpleAnimal: simpleTitleAnimal2, simpleCount: simpleCountAnimal2, aviary: newAviary)
        }
        if !simpleTitleAnimal3.isEmpty{
            addAnimal(simpleAnimal: simpleTitleAnimal3, simpleCount: simpleCountAnimal3, aviary: newAviary)
        }
        if !simpleTitleAnimal4.isEmpty{
            addAnimal(simpleAnimal: simpleTitleAnimal4, simpleCount: simpleCountAnimal4, aviary: newAviary)
        }
        if !simpleTitleAnimal5.isEmpty{
            addAnimal(simpleAnimal: simpleTitleAnimal5, simpleCount: simpleCountAnimal5, aviary: newAviary)
        }
        if !simpleTitleAnimal6.isEmpty{
            addAnimal(simpleAnimal: simpleTitleAnimal6, simpleCount: simpleCountAnimal6, aviary: newAviary)
        }
        if !simpleTitleAnimal7.isEmpty{
            addAnimal(simpleAnimal: simpleTitleAnimal7, simpleCount: simpleCountAnimal7, aviary: newAviary)
        }
        if !simpleTitleAnimal8.isEmpty{
            addAnimal(simpleAnimal: simpleTitleAnimal8, simpleCount: simpleCountAnimal8, aviary: newAviary)
        }
        if !simpleTitleAnimal9.isEmpty{
            addAnimal(simpleAnimal: simpleTitleAnimal9, simpleCount: simpleCountAnimal9, aviary: newAviary)
        }
        
        save()
        getAllSpent()
        clearData()
    }
    
    func addAnimal(simpleAnimal: String, simpleCount: String, aviary: Aviary){
        let newAnimal = Animal(context: manager.context)
        newAnimal.name = simpleAnimal
        newAnimal.count = Int16(simpleCount) ?? 0
        newAnimal.aviary = aviary
    }
    
    //MARK: Get data
    func getAviary(){
        let request = NSFetchRequest<Aviary>(entityName: "Aviary")
        do{
            aviarys = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    func getAnimail(){
        let request = NSFetchRequest<Animal>(entityName: "Animal")
        do{
            animals = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Save data
    func save(){
        animals.removeAll()
        aviarys.removeAll()
        manager.save()
        getAviary()
        getAnimail()
        getAllSpent()
    }
}
    

