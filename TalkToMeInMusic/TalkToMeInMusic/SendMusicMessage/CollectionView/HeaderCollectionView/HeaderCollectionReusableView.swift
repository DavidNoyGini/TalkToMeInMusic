//
//  HeaderCollectionReusableView.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 30/12/2021.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static var reuseIdentifier: String {
       return String(describing: HeaderCollectionReusableView.self)
     }
    
    @IBOutlet weak var sectionTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
