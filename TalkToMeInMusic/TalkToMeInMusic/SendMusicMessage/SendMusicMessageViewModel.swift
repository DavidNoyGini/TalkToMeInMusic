//
//  SendMusicMessageViewModel.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 28/12/2021.
//

import UIKit

class SendMusicMessageViewModel {
    
    // MARK: - Private variables
    private var allNotes: [Note]{
        var notes: [Note] = []
        for note in Note.allCases {
            notes.append(note)
        }
        return notes
    }
    private var octave: UInt8 = 36
    private var lowC: UInt8 = 24
    private let midiPlayer = MidiPlayer()

    // MARK: - init
    init(){}
    
    // MARK: - Public func
    func applySnapshot() -> Snapshot {

        var snapshot = Snapshot()
        
        let noteSection = makeNotesSection()
        let noteAttributeSection = makeNoteAttributeSection()

        snapshot.appendSections([noteSection, noteAttributeSection])

        snapshot.appendItems(noteSection.items, toSection: noteSection)
        snapshot.appendItems(noteAttributeSection.items, toSection: noteAttributeSection)

        return snapshot
    }

    func createLayout() -> UICollectionViewLayout{
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
                                                                       layoutEnvironment: NSCollectionLayoutEnvironment)
            -> NSCollectionLayoutSection? in

            let sectionLayoutKind = SectionType.allCases[sectionIndex]
            switch sectionLayoutKind {
            case .note:
                return self.notesLayout()
            case .noteAttribute:
                return self.notesAttributeLayout()
            }
        }
        return layout
    }
    
    private func notesLayout() -> NSCollectionLayoutSection {
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(50.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        let itemSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalWidth(0.25))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(0.25)
        ),
        subitem: item,
        count: 4)

        let section = NSCollectionLayoutSection(group: horizontalGroup)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    private func notesAttributeLayout() -> NSCollectionLayoutSection {
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(50.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        let leftItemSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1),
          heightDimension: .fractionalWidth(4/9))
        let leftItem = NSCollectionLayoutItem(layoutSize: leftItemSize)
        
        let itemGroupSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1/3),
          heightDimension: .fractionalWidth(4/9))
        
        let leftGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: itemGroupSize,
            subitem: leftItem,
            count: 1)
        
        let rightItemSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1),
          heightDimension: .fractionalWidth(1/3))
        let rightItem = NSCollectionLayoutItem(layoutSize: rightItemSize)
        
        let upHorizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1/3)
        ),
        subitem: rightItem,
        count: 3)
        
        let downHorizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1/3)
        ),
        subitem: rightItem,
        count: 2)
        
        let rightGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(2/3),
            heightDimension: .fractionalWidth(2/3)
        ), subitems: [upHorizontalGroup, downHorizontalGroup])
        
        let generalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0)),
            subitems: [leftGroup, rightGroup])
        
        let section = NSCollectionLayoutSection(group: generalGroup)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    // MARK: - Private func
    private func makeNotesSection() -> Section{
        let section = Section(sectionType: .note, items: allNotes)
        return section
    }
    
    private func makeNoteAttributeSection() -> Section{
        var noteAttributes: [NoteAttribute] = []
        
        for attribute in NoteAttribute.allCases {
            noteAttributes.append(attribute)
        }
        let section = Section(sectionType: .noteAttribute, items: noteAttributes)
        return section
    }
}

// MARK: - NoteTappedDelegate
extension SendMusicMessageViewModel: NoteTappedDelegate {
    func noteTapped(note: Note) {
        print(note.rawValue)
        let noteindex = allNotes.firstIndex(where: {$0 == note}) ?? 0
        let noteNumber = UInt8(noteindex)
        midiPlayer.noteOn(midiNote: MidiNote(noteNumber: noteNumber &+ lowC &+ octave))
    }
}

// MARK: - AttributeTappedDelegate
extension SendMusicMessageViewModel: AttributeTappedDelegate {
    func attributeTapped(noteAttribute: NoteAttribute) {

        switch noteAttribute {
        case .muted:
            midiPlayer.noteOff()
        case .short:
            print("short")
        case .medium:
            print("medium")
        case .long:
            print("long")
        case .octaveUp:
            if octave < 60 {
            octave &+= 12
            }
        case .octaveDown:
            if octave > 23 {
            octave &-= 12
            }
        }
    }

}
