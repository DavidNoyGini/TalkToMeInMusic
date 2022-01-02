//
//  HeaderCollectionReusableView.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 30/12/2021.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier: String = "HeaderCollectionReusableView"
    static let syncingBadgeKind: String = "syncingBadgeKind"
    
    @IBOutlet weak var sectionTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
