//
//  ViewController.swift
//  BootcampInstagramTasarim
//
//  Created by Erbil Can on 25.09.2023.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var postTableView: UITableView!
    
    var storysList = [Storys]()
    var postsList = [Posts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let story1 = Storys(id: 1, userName: "Your Story", image: "pf1", live: true)
        let story2 = Storys(id: 2, userName: "Erbil Can", image: "pf2", live: false)
        let story3 = Storys(id: 3, userName: "Keleş", image: "pf3", live: true)
        let story4 = Storys(id: 4, userName: "Porsche", image: "pf4", live: true)
        let story5 = Storys(id: 5, userName: "Turbo S", image: "pf5", live: true)
        storysList.append(story1)
        storysList.append(story2)
        storysList.append(story3)
        storysList.append(story4)
        storysList.append(story5)
        storysList.append(story4)
        storysList.append(story5)
        storysList.append(story4)
        storysList.append(story5)
        storysList.append(story4)
        storysList.append(story5)
        storysList.append(story4)
        storysList.append(story5)
        
        
        let post1 = Posts(id: 1, userImage: "userPost1", userName: "joshua_I", postLocation: "Tokyo, Japan", postImage: "post1", postLikes: "Liked by craig_love and 44,686 others", postComment: "The game in Japan Was amazing and Iwant to share some photos", postLikesImage: "userPost2", postImageShape: true,postCommentCount: "2 Yorumun tümünü gör",postofDate: "26 dakika önce")
        let post2 = Posts(id: 2, userImage: "userPost2", userName: "e.cankeles", postLocation: "Springfield", postImage: "post2", postLikes: "Liked by porscheclub and 686 others", postComment: "Our scenery and boat", postLikesImage: "pf4", postImageShape: false,postCommentCount: "5 Yorumun tümünü gör",postofDate: "1 gün önce")
        
        postsList.append(post1)
        postsList.append(post2)
        
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        postTableView.delegate = self
        postTableView.dataSource = self
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        tasarim.scrollDirection = .horizontal
        tasarim.itemSize = CGSize(width: 72, height: 100)
        storyCollectionView.collectionViewLayout = tasarim
    }

}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storysList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: "toStoryCell", for: indexPath) as! StoryCollectionViewCell
        
        let story = storysList[indexPath.row]
        cell.imageStoryUser.image = UIImage(named: story.image)
        cell.imageLive.isHidden = story.live
        cell.labelKullanici.text = story.userName
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // Her bir hücrenin boyutunu burada ayarlayın
            return CGSize(width: 92, height: 104) // Örnek bir boyut
        }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView.dequeueReusableCell(withIdentifier: "toPostCell", for: indexPath) as! PostTableViewCell
        
        let post = postsList[indexPath.row]
        cell.imagePostUser.image = UIImage(named: post.userImage)
        cell.imageLikesUserPhoto.image = UIImage(named: post.postLikesImage)
        cell.imagePost.image = UIImage(named: post.postImage)
        cell.labelUserName.text = post.userName
        cell.labelPostLocation.text = post.postLocation
        cell.labelLikes.text = post.postLikes
        cell.labelPostUserName.text = post.userName
        cell.labelUserComment.text = post.postComment
        cell.labelDateofPost.text = post.postCommentCount
        cell.labelCommentCount.text = post.postofDate
        return cell
    }
    
    
}
