## Pull request
- A notification to alert that the development is finished and someone else could start the code review

## Basic commands

- **Stash** 
  - Save changes to temporary place
  ```
    git stash "[description]"
    git stash list
  ```  
  - Apply stash
  
  ```
    ## stash will still remain in stash
    git stash apply [stash-name]
    ## stash will be deleted from stash
    git stash pop  
  ```

  - Drop stash if it's no longer needed
  ```
    git stash drop [stash-name]
  ```
  - Clear all stash
  ```
  git stash cleat
  ```
  
## Rollback changes
- Rollback modification in file before commit
  - ``git checkout [file-name]``
  
- Modify commit message
  - ``git --amend -m "correct message test"``
  
- Left off to add file within a commit (**NB:** this is to be done only if the change are not yet been commit to remote)
  - ``git --amend``

- Commit to the wrong branch 
  - ``git log`` and copy the hash of the wrong commit in wrong branch
  - ``git checkout [correct-branch]``
  - ``git cherry-pick [hash-copied]`` # it doest delete in the original branch
  - ``get checkout [wrong-branch]``
  - ``get rest --soft [hash]``


- Three type of reset: soft, mixed (default), hard
  - For reset hard git keep commit for certain amount of time
- Remove untracked file or directory ``git clean -df``
- Important command to know in case we lost a commit ``git reflog``

