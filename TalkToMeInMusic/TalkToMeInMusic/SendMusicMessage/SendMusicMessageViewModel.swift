//
//  SendMusicMessageViewModel.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 28/12/2021.
//

import UIKit

//struct SendMusicCollectionSection: Hashable {
//
//    let id = UUID()
//    var headerTitle: String
//    var cells: [SendMusicMessageModelPotocol]
//    var backgroundColor: UIColor
//
//    static func == (lhs: SendMusicCollectionSection, rhs: SendMusicCollectionSection) -> Bool {
//        lhs.id == rhs.id
//    }
//
//    func hash(into hasher: inout Hasher) {
//      hasher.combine(id)
//    }
//}


class SendMusicMessageViewModel {
    
    // MARK: - Private variables

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
            //            let isWideView = layoutEnvironment.container.effectiveContentSize.width > 500
            
//            guard let self = self else {return layout}
//            return self.notesLayout()
            let sectionLayoutKind = SectionType.allCases[sectionIndex]
            switch sectionLayoutKind {
            case .note:
                return self.notesLayout()
            case .noteAttribute:
                return self.notesAttributeLayout()
            }
        }
        return layout
        
        
        
//        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                                      heightDimension: .absolute(50.0))
//        let header = NSCollectionLayoutBoundarySupplementaryItem(
//            layoutSize: headerSize,
//            elementKind: UICollectionView.elementKindSectionHeader,
//            alignment: .top)
//
//
//        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1),
//            heightDimension: .fractionalHeight(1)))
//
//        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1),
//            heightDimension: .fractionalWidth(0.25)
//        ),
//        subitem: item,
//        count: 4)
//
//        let verticalGroup =  NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1),
//            heightDimension: .fractionalHeight(2)),
//        subitems: [horizontalGroup, horizontalGroup, horizontalGroup])
//
//        let section = NSCollectionLayoutSection(group: verticalGroup)
//        section.boundarySupplementaryItems = [header]
//        return UICollectionViewCompositionalLayout(section: section)
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
        var notes: [Note] = []
        
        for note in Note.allCases {
            notes.append(note)
        }
        let section = Section(sectionType: .note, items: notes)
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
    
    private func noteTapped(cell: Note){
        print(cell.rawValue)
    //        switch cell {
    //        case .c:
    //            <#code#>
    //        case .db:
    //            <#code#>
    //        case .d:
    //            <#code#>
    //        case .eb:
    //            <#code#>
    //        case .e:
    //            <#code#>
    //        case .f:
    //            <#code#>
    //        case .gb:
    //            <#code#>
    //        case .g:
    //            <#code#>
    //        case .ab:
    //            <#code#>
    //        case .a:
    //            <#code#>
    //        case .bb:
    //            <#code#>
    //        case .b:
    //            <#code#>
    //        }
        }
}

// MARK: - NoteTappedDelegate
extension SendMusicMessageViewModel: NoteTappedDelegate {
    func noteTapped(note: Note) {
        print(note.rawValue)
        MidiPlayer.sherd.noteOn(midiNote: MidiNote(noteNumber: 60, velocity: 60, channel: 1))
    }
}

// MARK: - AttributeTappedDelegate
extension SendMusicMessageViewModel: AttributeTappedDelegate {
    func attributeTapped(noteAttribute: NoteAttribute) {
        print(noteAttribute.rawValue)
        MidiPlayer.sherd.noteOff(midiNote: MidiNote(noteNumber: 60, velocity: 60, channel: 1))
    }

}
