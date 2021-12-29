//
//  SendMusicMessageViewModel.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 28/12/2021.
//

import UIKit

struct SendMusicCollectionSection {
    var headerTitle: String
    var cells: [SendMusicMessageModelPotocol]
    var backgroundColor: UIColor
}

class SendMusicMessageViewModel {
    
    private var sections: [SendMusicCollectionSection] = []
//    private var dataSource: [[SendMusicMessageModelPotocol]] = []
      
    init(){
        makeDataSource()
    }
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return sections[section].cells.count
    }
    
    func getCellForItemAt(indexPath: IndexPath) -> SendMusicMessageModelPotocol {
        let section = sections[indexPath.section]
        let item = section.cells[indexPath.row]
        return item
    }

    func didSelectItemAt(indexPath: IndexPath) {
        
    }
    
    private func makeDataSource() {
        makeNotesAray()
        makeNoteAttributeAray()
    }
    
    private func makeNotesAray(){
        var array: [Notes] = []
        
        for note in Notes.allCases {
            array.append(note)
        }
        let section = SendMusicCollectionSection(headerTitle: "Notes", cells: array, backgroundColor: .cyan)
        self.sections.append(section)
    }
    
    private func makeNoteAttributeAray(){
        var array: [NoteAttribute] = []
        
        for attribute in NoteAttribute.allCases {
            array.append(attribute)
        }
        let section = SendMusicCollectionSection(headerTitle: "Note Attribute", cells: array, backgroundColor: .red)
        self.sections.append(section)
    }
}

