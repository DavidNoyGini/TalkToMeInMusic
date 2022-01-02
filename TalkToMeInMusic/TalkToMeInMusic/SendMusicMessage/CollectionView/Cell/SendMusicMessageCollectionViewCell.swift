//
//  SendMusicMessageCollectionViewCell.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 28/12/2021.
//

import UIKit

class SendMusicMessageCollectionViewCell: UICollectionViewCell {

    static var reuseIdentifier: String {
       return String(describing: SendMusicMessageCollectionViewCell.self)
     }
    
    @IBOutlet weak var button: UIButton!
    private let viewModel = SendMusicMessageCollectionViewCellViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with cell: SendMusicMessageModelPotocol, delegate: SendMusicMessageViewModel) {
        viewModel.setCell(cell: cell)
        cellDelegate(delegate: delegate)
        button.setTitle(cell.title, for: .normal)
        button.tintColor = cell.cellColor()
    }
    
    private func cellDelegate(delegate: SendMusicMessageViewModel) {
        self.viewModel.noteDelegate = delegate
        self.viewModel.attributeDelegate = delegate
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        viewModel.cellTapped()
    }
}
