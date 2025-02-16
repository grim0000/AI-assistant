@echo off

REM Navigate to the project directory
cd /d D:\JARVIS AI

REM Initialize a new Git repository
git init

REM Add all files to the repository
git add .

REM Commit the changes with a message
git commit -m "Initial commit"

REM Add the remote repository URL
REM Replace YOUR_GITHUB_USERNAME and YOUR_REPOSITORY_NAME with your GitHub username and repository name
git remote add origin https://github.com/grim0000/AI-assistant.git

REM Push the changes to the remote repository
git push -u origin master

echo Project has been successfully uploaded to GitHub.
pause