//
//  SendMusicMessageViewModel.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 28/12/2021.
//

import UIKit

class SendMusicMessageViewModel {
    
    private var dataSource: [[SendMusicMessageModel]] = []
    
    func numberOfSections() -> Int {
        return dataSource.count
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return dataSource[section].count
    }
    
    func cellForItemAt(indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

    func didSelectItemAt(indexPath: IndexPath) {
        
    }
    
    private func makeDataSource(){
        makeNotesAray {
            makeNoteAttributeAray {
                print("reload collection")
            }
        }
    }
    
    private func makeNotesAray(competion: (() -> Void)){
        var array: [Notes] = []
        
        for note in Notes.allCases {
            array.append(note)
        }
        dataSource.append(array)
        competion()
    }
    
    private func makeNoteAttributeAray(competion: (() -> Void)){
        var array: [NoteAttribute] = []
        
        for attribute in NoteAttribute.allCases {
            array.append(attribute)
        }
        dataSource.append(array)
        competion()
    }
}

