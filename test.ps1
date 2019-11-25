$currentBranchName = git branch | grep \* | cut -d ' ' -f2- 
$parentBranch = git branch -vv | grep $currentBranchName | awk '{print $4}'
$parentBranchCleaned = $parentBranch.Replace("[","").Replace("]","").Replace(":","")
$parent = $parentBranchCleaned.split("/")[1]

Write-Host $currentBranchName
Write-Host $parent

try{
	git checkout $currentBranchName
	git rebase $parent 2>&1 | Write-Host
	git checkout $parent
	git merge $currentBranchName --ff-only
	git push origin $parent
}
catch{
	Write-Host "ERROR CATHCED"
	Write-Host $_
}
pause