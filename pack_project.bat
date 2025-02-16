@echo off

REM Navigate to the project directory
cd /d D:\JARVIS AI

REM Install required Python packages
pip install -r requirements.txt

REM Install PyInstaller
pip install pyinstaller

REM Create a spec file for PyInstaller
echo ^<^<^<EOF > JARVIS.spec
# -*- mode: python ; coding: utf-8 -*-

block_cipher = None

a = Analysis(
    ['Main.py'],
    pathex=['D:/JARVIS AI'],
    binaries=[],
    datas=[
        ('Frontend/Files/ImageGeneration.data', 'Frontend/Files'),
        ('.env', '.')
    ],
    hiddenimports=[
        'Frontend.GUI',
        'Backend.Model',
        'Backend.RealtimeSearchEngine',
        'Backend.Automation',
        'Backend.Chatbot',
        'Backend.SpeechToText',
        'Backend.TextToSpeech'
    ],
    hookspath=[],
    runtime_hooks=[],
    excludes=[],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
)
pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)
exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name='JARVIS',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=True,
)
coll = COLLECT(
    exe,
    a.binaries,
    a.zipfiles,
    a.datas,
    strip=False,
    upx=True,
    upx_exclude=[],
    name='JARVIS',
)
EOF

REM Run PyInstaller with the spec file
pyinstaller JARVIS.spec

REM Move the executable to the project root directory
move dist\JARVIS.exe JARVIS.exe

REM Clean up build directories
rmdir /s /q build
rmdir /s /q dist
del JARVIS.spec

echo Packaging complete. The executable is located at D:\JARVIS AI\JARVIS.exe
pause