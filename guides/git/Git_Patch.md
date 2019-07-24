
# Git Patches

# How to work with git patches

## Infos

- every commit will be one patch
- it is also possible to create a patch based on a branch to a other branch
  

## How to create and apply a patch with Git Bash

### Example in one repo
---
[see the orgin article online](https://www.devroom.io/2009/10/26/how-to-create-and-apply-a-patch-with-git/)

### Before you start
- To make creating patches easier, there are some common git practices you should follow. It’s not necessary, but it will make your life easier.
- If you fix a bug or create a new feature – do it in a separate branch!
- Let’s say you want to create a patch for my imdb gem. You should clone my repository and create a new branch for the fix you have in mind. In this sample we’ll do an imaginary fix for empty posters.

````git
git clone git://github.com/ariejan/imdb.git
cd imdb
git checkout -b fix_empty_poster
````
Now, in the new **fix_empty_poster** branch you can hack whatever you need to fix. Write tests, update code etc. etc.

When you’re satisfied with all you changes, it’s time to create your patch. FYI: I’m assuming you made a few commits in the **fix_empty_poster** branch and did not yet merge it back in to the **master** branch.

### Create a Patch
Okay, I’ve made some commits, here’s the **git log** for the **fix_empty_poster** branch:

````git
git log --pretty=oneline -3
* ce30d1f - (fix_empty_poster) Added poster URL as part of cli output (7 minutes ago)
* 5998b80 - Added specs to test empty poster URL behaviour (12 minutes ago)
* aecb8cb - (REL-0.5.0, origin/master, origin/HEAD, master) Prepare release 0.5.0 (4 months ago)
````

Okay, now it’s time to go and make a patch! All we really want are the two latest commits, stuff them in a file and send them to someone to apply them. But, since we created a separate branch, we don’t have to worry about commits at all!

````git
git format-patch master --stdout > fix_empty_poster.patch
````

This will create a new file **fix_empty_poster.patch** with all changes from the current (**fix_empty_poster**) against **master**. Normally, git would create a separate patch file for each commit, but that’s not what we want. All we need is a single patch file.

Now, you have a patch for the fix you wrote. Send it to the maintainer of the project **xyz**

### Appling the Patch

… who will apply the patch you just sent! But, before you do that, there are some other steps you should take.

First, take a look at what changes are in the patch. You can do this easily with **git apply**

````git
git apply --stat fix_empty_poster.patch
````

Note that this command does not apply the patch, but only shows you the stats about what it’ll do. After peeking into the patch file with your favorite editor, you can see what the actual changes are.

Next, you’re interested in how troublesome the patch is going to be. Git allows you to test the patch before you actually apply it.


````git
git apply --check fix_empty_poster.patch
````

If you don’t get any errors, the patch can be applied cleanly. Otherwise you may see what trouble you’ll run into. To apply the patch, I’ll use **git am** instead of **git apply**. The reason for this is that git am allows you to sign off an applied patch. This may be useful for later reference.

````git
git am --signoff < fix_empty_poster.patch
Applying: Added specs to test empty poster URL behaviour
Applying: Added poster URL as part of cli output
````

Okay, patches were applied cleanly and your master branch has been updated. Of course, run your tests again to make sure nothing got borked.

In you git log, you’ll find that the commit messages contain a “Signed-off-by” tag. This tag will be read by Github and others to provide useful info about how the commit ended up in the code.




## How to create and apply a patch with Git Tortoise

### Example with 2 different repos
---
### Create a Patch

- right-click on local code folder -> /TortoiseGit/Create Patch Serial
- directory must be the code repository
- Range
  - From -> From which commit the patch should start. The selected commit is not included in this case. It starts after the selected commit. 
  - To -> the selected commit is included in the patch
- the created patches are stored in the root directory of the repository


```
git.exe format-patch -o "D:/BEXIS APP/_BEXIS2CODE_FOR_MODULES" 39c118d5894faf9ce3e664925f6526f8b2b537d9..f88f34f407b3ebfa0385a1204c8db5d8929a0a75

D:/BEXIS APP/_BEXIS2CODE_FOR_MODULES/0001-272-refactor-transform-function-to-get-all-matches-i.patch
D:/BEXIS APP/_BEXIS2CODE_FOR_MODULES/0002-272-miner-changes-to-set-boolean-values-correct.patch

Success (203 ms @ 22.07.2019 10:32:26)

````

### Apply a Patch

- right-click on local code folder -> /TortoiseGit/Apply Patch Serial
- Add Patches
- click apply

- if there should be conflicts, they will be displayed in the visual strudio and can be fixed there.
- When you have resolved this problem, you can skip the patch
    - apply patch again - a window pops up -> select skip
 