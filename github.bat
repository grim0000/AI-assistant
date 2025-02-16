@echo off

REM Navigate to the project directory
cd /d D:\JARVIS AI

REM Check if GitHub CLI is installed
gh --version >nul 2>&1
if %errorlevel% neq 0 (
    echo GitHub CLI is not installed. Please install it from https://cli.github.com/ and try again.
    pause
    exit /b 1
)

REM Authenticate with GitHub
gh auth login

REM Create a new GitHub repository
REM Replace YOUR_GITHUB_USERNAME and YOUR_REPOSITORY_NAME with your GitHub username and desired repository name
gh repo create grim0000/AIassistant --public --confirm

REM Initialize a new Git repository
git init

REM Add all files to the repository
git add -A

REM Commit the changes with a message
git commit -m "Initial commit"

REM Add the remote repository URL
git remote add origin https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPOSITORY_NAME.git

REM Push the changes to the remote repository
git push -u origin master

echo Project has been successfully uploaded to GitHub.
pause