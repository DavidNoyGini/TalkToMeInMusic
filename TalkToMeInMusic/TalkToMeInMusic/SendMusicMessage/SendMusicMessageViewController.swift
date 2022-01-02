//
//  SendMusicMessageViewController.swift
//  TalkToMeInMusic
//
//  Created by David Noy on 28/12/2021.
//

import UIKit

typealias DataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>
typealias Snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>

class SendMusicMessageViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var receivedMessageCounter: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Private Variables
    private var viewModel = SendMusicMessageViewModel()
    private lazy var dataSource = createDataSource()
    private let headerHeight = 60.0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
    }
    
    // MARK: - IBAction
    @IBAction func playReceivedMessage(_ sender: UIButton) {
    }
    
    @IBAction func playBeforeSend(_ sender: UIButton) {
    }
    
    @IBAction func sendMessage(_ sender: UIButton) {
    }
    
    // MARK: - Private func
    private func collectionViewSetup(){
        
        // Cells register
        collectionView.register(UINib.init(nibName: SendMusicMessageCollectionViewCell.reuseIdentifier,
                                           bundle: nil),
                                forCellWithReuseIdentifier: SendMusicMessageCollectionViewCell.reuseIdentifier)
        
        collectionView.register(UINib.init(nibName: HeaderCollectionReusableView.identifier,
                                           bundle: nil),
                                forSupplementaryViewOfKind: HeaderCollectionReusableView.syncingBadgeKind,
                                withReuseIdentifier: HeaderCollectionReusableView.identifier)
        
        collectionView.collectionViewLayout = viewModel.createLayout()
        
        // Data source
        let snapshot = viewModel.applySnapshot()
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

// MARK: - CollectionViewDiffableDataSource
extension SendMusicMessageViewController {
    
    func createDataSource() -> DataSource {
        // 1
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, sections) ->
                UICollectionViewCell? in
                // 2
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: SendMusicMessageCollectionViewCell.reuseIdentifier,
                    for: indexPath) as? SendMusicMessageCollectionViewCell
                guard let model = sections as? SendMusicMessageModelPotocol else {return cell}
                cell?.configure(with: model, delegate: self.viewModel)
                return cell
            })
        return dataSource
    }
    
}

// MARK: - CollectionViewDelegateFlowLayout
extension SendMusicMessageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width,
                      height: headerHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HeaderCollectionReusableView.identifier,
            for: indexPath) as? HeaderCollectionReusableView ?? UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.size.width
        
        return CGSize(width: (width/4)-3,
                      height: (width/6)-3)
    }
}
