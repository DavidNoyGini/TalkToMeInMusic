//
//  SendMusicMessageCollectionViewCellViewModel.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 30/12/2021.
//

import Foundation

protocol NoteTappedDelegate: AnyObject {
    func noteTapped(note: Note)
}

protocol AttributeTappedDelegate: AnyObject {
    func attributeTapped(noteAttribute: NoteAttribute)
}

class SendMusicMessageCollectionViewCellViewModel {
    
    weak var noteDelegate: NoteTappedDelegate?
    weak var attributeDelegate: AttributeTappedDelegate?
    private var cell: SendMusicMessageModelPotocol?
    
    func setCell(cell: SendMusicMessageModelPotocol) {
        self.cell = cell
    }
    
    func cellTapped() {
        guard let tappedCell = cell else {return}

        switch tappedCell {
        case is Note:
            guard let note = tappedCell as? Note else {return}
            noteDelegate?.noteTapped(note: note)
        case is NoteAttribute:
            guard let noteAttribute = tappedCell as? NoteAttribute else {return}
            attributeDelegate?.attributeTapped(noteAttribute: noteAttribute)
        default:
            return
        }
    }
}


