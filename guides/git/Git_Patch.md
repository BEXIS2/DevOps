
# Git Patches 1234

# How to work with git patches

## Infos

- every commit will be one patch
- it is also possible to create a patch based on a branch to a other branch
  




## How to create and apply a patch with Git Bash

### Example for one commit

#### create patch

1. **git log --pretty=oneline** 

>Attention, this is only a small part of the possibilities that git has to create patches. 

2. **git format-patch COMMIT_REFERENCE**
   

- specific patch
  
        git format-patch commitID

Example:

````git

dblaa@HESTRA MINGW64 /d/GIT_TEST/ForkGitTestProject (master)
$ git log --pretty=oneline -3
492a82b7d80e8440f2b92933718a30db3eba0ce7 (HEAD -> master, origin/master, origin/HEAD) create cool automatic stuff without control
29aa14ee1e12fc44da40d5359c38e054e9c4a717 add model
accf2d71dc8a2d9e25dc4a3655b36fd8945e5594 Merge pull request #2 from BEXIS2/master

dblaa@HESTRA MINGW64 /d/GIT_TEST/ForkGitTestProject (master)
$ git format-patch 29aa14ee1e12fc44da40d5359c38e054e9c4a717
0001-create-cool-automatic-stuff-without-control.patch

````

- patch from head

        git format-patch -n HEAD^

````git

dblaa@HESTRA MINGW64 /d/GIT_TEST/ForkGitTestProject (master)
$ git log --pretty=oneline -3
492a82b7d80e8440f2b92933718a30db3eba0ce7 (HEAD -> master, origin/master, origin/HEAD) create cool automatic stuff without control
29aa14ee1e12fc44da40d5359c38e054e9c4a717 add model
accf2d71dc8a2d9e25dc4a3655b36fd8945e5594 Merge pull request #2 from BEXIS2/master

dblaa@HESTRA MINGW64 /d/GIT_TEST/ForkGitTestProject (master)
$ git format-patch -n HEAD^
0001-create-cool-automatic-stuff-without-control.patch

````

- all commits until head

        git format-patch HEAD~~ 

Example:

````git

dblaa@HESTRA MINGW64 /d/GIT_TEST/ForkGitTestProject (master)
$ git log --pretty=oneline -3
492a82b7d80e8440f2b92933718a30db3eba0ce7 (HEAD -> master, origin/master, origin/HEAD) create cool automatic stuff without control
29aa14ee1e12fc44da40d5359c38e054e9c4a717 add model
accf2d71dc8a2d9e25dc4a3655b36fd8945e5594 Merge pull request #2 from BEXIS2/master

dblaa@HESTRA MINGW64 /d/GIT_TEST/ForkGitTestProject (master)
$ git format-patch 492a82b7d80e8440f2b92933718a30db3eba0ce7

dblaa@HESTRA MINGW64 /d/GIT_TEST/ForkGitTestProject (master)
$ git format-patch HEAD~~
0001-add-model.patch
0002-create-cool-automatic-stuff-without-control.patch

dblaa@HESTRA MINGW64 /d/GIT_TEST/ForkGitTestProject (master)

````

#### apply patch

> To make it easier to capture the patches via git, i would advise you to store the patches in the project's router directory. You can use **git apply some.patch** to have the changes from the .patch file applied to your current working directory. They will be unstaged and **need to be committed** by you.


        git am *.patch

````git

dblaa@HESTRA MINGW64 /d/GIT_TEST/GitTestProject (master)
$ git ls-files --others --exclude-standard
0001-create-cool-automatic-stuff-without-control.patch

dblaa@HESTRA MINGW64 /d/GIT_TEST/GitTestProject (master)
$ git apply --stat 0001-create-cool-automatic-stuff-without-control.patch
 .../Controllers/TempModelsController.cs            |  127 ++++++++++++++++++++
 .../WebApplication/Models/WebApplicationContext.cs |   24 ++++
 Mega/WebApplication/Views/TempModels/Create.cshtml |   28 ++++
 Mega/WebApplication/Views/TempModels/Delete.cshtml |   25 ++++
 .../WebApplication/Views/TempModels/Details.cshtml |   19 +++
 Mega/WebApplication/Views/TempModels/Edit.cshtml   |   30 +++++
 Mega/WebApplication/Views/TempModels/Index.cshtml  |   28 ++++
 Mega/WebApplication/Web.config                     |   70 +++++++----
 Mega/WebApplication/WebApplication.csproj          |   13 ++
 Mega/WebApplication/WebApplication.csproj.user     |   12 ++
 Mega/WebApplication/packages.config                |    1
 11 files changed, 349 insertions(+), 28 deletions(-)

dblaa@HESTRA MINGW64 /d/GIT_TEST/GitTestProject (master)
$ git apply --check 0001-create-cool-automatic-stuff-without-control.patch              error: patch failed: Mega/WebApplication/WebApplication.csproj:121
error: Mega/WebApplication/WebApplication.csproj: patch does not apply



dblaa@HESTRA MINGW64 /d/GIT_TEST/GitTestProject (master)
$ git apply --reject --whitespace=fix 0001-create-cool-automatic-stuff-without-control.patch
0001-create-cool-automatic-stuff-without-control.patch:77: trailing whitespace.
        // Aktivieren Sie zum Schutz vor übermäßigem Senden von Angriffen die spezifischen Eigenschaften, mit denen eine Bindung erfolgen soll. Weitere Informationen
0001-create-cool-automatic-stuff-without-control.patch:109: trailing whitespace.
        // Aktivieren Sie zum Schutz vor übermäßigem Senden von Angriffen die spezifischen Eigenschaften, mit denen eine Bindung erfolgen soll. Weitere Informationen
0001-create-cool-automatic-stuff-without-control.patch:177: trailing whitespace.
        //
0001-create-cool-automatic-stuff-without-control.patch:182: trailing whitespace.

0001-create-cool-automatic-stuff-without-control.patch:205: trailing whitespace.
@using (Html.BeginForm())
Checking patch Mega/WebApplication/Controllers/TempModelsController.cs...
Checking patch Mega/WebApplication/Models/WebApplicationContext.cs...
Checking patch Mega/WebApplication/Views/TempModels/Create.cshtml...
Checking patch Mega/WebApplication/Views/TempModels/Delete.cshtml...
Checking patch Mega/WebApplication/Views/TempModels/Details.cshtml...
Checking patch Mega/WebApplication/Views/TempModels/Edit.cshtml...
Checking patch Mega/WebApplication/Views/TempModels/Index.cshtml...
Checking patch Mega/WebApplication/Web.config...
Checking patch Mega/WebApplication/WebApplication.csproj...
error: while searching for:
    <Compile Include="App_Start\FilterConfig.cs" />
    <Compile Include="App_Start\RouteConfig.cs" />
    <Compile Include="Controllers\HomeController.cs" />
    <Compile Include="Global.asax.cs">
      <DependentUpon>Global.asax</DependentUpon>
    </Compile>
    <Compile Include="Models\TempModel.cs" />
    <Compile Include="Properties\AssemblyInfo.cs" />
  </ItemGroup>
  <ItemGroup>

error: patch failed: Mega/WebApplication/WebApplication.csproj:121
Hunk #3 succeeded at 168 (offset -3 lines).
Checking patch Mega/WebApplication/WebApplication.csproj.user...
Checking patch Mega/WebApplication/packages.config...
Applied patch Mega/WebApplication/Controllers/TempModelsController.cs cleanly.
Applied patch Mega/WebApplication/Models/WebApplicationContext.cs cleanly.
Applied patch Mega/WebApplication/Views/TempModels/Create.cshtml cleanly.
Applied patch Mega/WebApplication/Views/TempModels/Delete.cshtml cleanly.
Applied patch Mega/WebApplication/Views/TempModels/Details.cshtml cleanly.
Applied patch Mega/WebApplication/Views/TempModels/Edit.cshtml cleanly.
Applied patch Mega/WebApplication/Views/TempModels/Index.cshtml cleanly.
Applied patch Mega/WebApplication/Web.config cleanly.
Applying patch Mega/WebApplication/WebApplication.csproj with 1 reject...
Hunk #1 applied cleanly.
Rejected hunk #2.
Hunk #3 applied cleanly.
Applied patch Mega/WebApplication/WebApplication.csproj.user cleanly.
Applied patch Mega/WebApplication/packages.config cleanly.

````

-> now you need to commit it


**other helpful lines**

    git am --abort


### Example in one repo with one branch
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


```git
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
 