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
    
    @Published var isPresentNewAviary = false
    
}
