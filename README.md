
## git-command-aliases

#### Fetch and Pull Branch from origin

```bash
  git-check "BranchName"
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `BranchName` | `string` | **Required**. Branch Name |

```bash
git fetch origin "BranchName"
git checkout "BranchName"
git pull origin "BranchName"
```

#### Commit and Push to origin with "BranchName" "CommitName" credentials has been taken.

```bash
  git-push "BranchName" "CommitName"
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `BranchName` | `string` | **Required**. Branch Name |
| `CommitName` | `string` | **Required**. Commit Name |

```bash
git checkout -b "BranchName"
git add .
git commit -m "CommitName"
git push origin "BranchName"
```


#### Delete all local branches except "BranchName"

```bash
  git-delete-local "BranchName"
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `BranchName` | `string` | **Required**. Branch Name |

```bash
git branch
find /v "BranchName"
xargs git branch -D ::xargs is included.
```
