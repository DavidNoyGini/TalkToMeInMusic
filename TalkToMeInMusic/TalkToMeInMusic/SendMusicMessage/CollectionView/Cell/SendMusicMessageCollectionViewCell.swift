//
//  SendMusicMessageCollectionViewCell.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 28/12/2021.
//

import UIKit
import Reusable

class SendMusicMessageCollectionViewCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var button: UIButton!
    var tappedCell: SendMusicMessageModelPotocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with cell: SendMusicMessageModelPotocol){
        tappedCell = cell
        button.setTitle(cell.rowValuw, for: .normal)
        button.tintColor = cell.cellColor()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
    }
    
//    private func tapAction(){
//        guard let cell = tappedCell as? Notes else {return}
//        
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
//    }
    
}
