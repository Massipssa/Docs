# Basics 
- Each commit has a hash code
- Master branch created by default
- Head: is pointer that indicates the current branch on which we are
  -  ```git log --all --decorate --oneline --graph```
- Create new branch
  -  ```git branch [branch-name]```
- Show all branch
  -  ``git branch``
- Create and checkout to branch
  -  ```git checkout -b [branch-name]```
  - Head will move out to this branch
- Add to stage area and commit a same time
  -  ```git -a -m  "commit message"```

- Remove files from staging area
  
  - ```git reset [file-name]``` or ```git reset``` # reset all
  
- Merge
  - Fast-forward: when it exists direct path between the two branches
  - 3-way: it will create a three-way commit 

- Delete branch
  -  ```git branch --merged``` # confirm that the branch is already merged before to delete it
  -  ```git branch -d [branch-name]```
- Detached head
  - ```git checkout [hash]``` # this will detach the head from the last commit
  - To comme back to last commit  ```git checkout [branch-name]```
  

- Rebase
  - ``git merge --squash [branch-name]`` # summarize the last change on one commit and merge to branch
  - Rebase workflow
    ```shell
      git pull 
      git checkout my_feature
      git rebase master
      git checkout master
      git rebase my_feature
    ```

## Remote repo
- Clone
- Pull and push
- Delete branch on remote
  ```git push origin --delete [branch-name]```