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

        snapshot.appendSections([.Note, .NoteAttribute])

        snapshot.appendItems(makeNotesArray(), toSection: .Note)
        snapshot.appendItems(makeNoteAttributeArray(), toSection: .NoteAttribute)

        return snapshot
    }

    func createLayout() -> UICollectionViewCompositionalLayout{
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(50.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: HeaderCollectionReusableView.syncingBadgeKind,
            alignment: .top)
        
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)))
        
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(0.25)
        ),
        subitem: item,
        count: 4)
        
        let verticalGroup =  NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(2)),
        subitems: [header, horizontalGroup, horizontalGroup, horizontalGroup])
        
        let section = NSCollectionLayoutSection(group: verticalGroup)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    // MARK: - Private func
    private func makeNotesArray() -> [Note]{
        var notes: [Note] = []
        
        for note in Note.allCases {
            notes.append(note)
        }
        return notes
    }
    
    private func makeNoteAttributeArray() -> [NoteAttribute]{
        var noteAttributes: [NoteAttribute] = []
        
        for attribute in NoteAttribute.allCases {
            noteAttributes.append(attribute)
        }
        return noteAttributes
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
    }
}

// MARK: - AttributeTappedDelegate
extension SendMusicMessageViewModel: AttributeTappedDelegate {
    func attributeTapped(noteAttribute: NoteAttribute) {
        print(noteAttribute.rawValue)
    }

}
