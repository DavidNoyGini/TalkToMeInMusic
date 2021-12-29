//
//  SendMusicMessageViewController.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 28/12/2021.
//

import UIKit

class SendMusicMessageViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var receivedMessageCounter: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Variables
    private let viewModel = SendMusicMessageViewModel()
    private let headerHeight = 30.0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
    }
    
    // MARK: - BAction
    @IBAction func playReceivedMessage(_ sender: UIButton) {
    }
    
    @IBAction func playBeforeSend(_ sender: UIButton) {
    }
    
    @IBAction func sendMessage(_ sender: UIButton) {
    }
    
    // MARK: - Private func
    private func collectionViewSetup(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: SendMusicMessageCollectionViewCell.self)
        
    }
}

    // MARK: - CollectionViewDataSource
extension SendMusicMessageViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as SendMusicMessageCollectionViewCell
        
        let cellModel = viewModel.getCellForItemAt(indexPath: indexPath)
        cell.configure(with: cellModel)
        
        return cell
    }
}

    // MARK: - CollectionViewDelegate
extension SendMusicMessageViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension SendMusicMessageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width,
                      height: headerHeight)
    }
}
