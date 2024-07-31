## Building CV using LaTex and 
Based on [@ccwang002 (Liang-Bo Wang)'s CV](https://github.com/ccwang002/cv/tree/master), with modifications to group publications by primary authorship and co-authorship.

### Steps
1. [Download](https://code.visualstudio.com/download) and install Visual Studio Code.
2. [Install](https://mathjiajia.github.io/vscode-and-latex/) LaTeX Workshop.
3. Open Visual Studio Code. In MacOS, press `cmd`+`shift`+`P` to find command `Preference: Open User Setting (JSON)`.
4. Copy and paste the [JSON context](https://raw.githubusercontent.com/ccwang002/cv/master/.vscode/settings.json).
5. Run the following in terminal
```
brew install basictex
sudo tlmgr install \
    latexmk \
    biber biblatex biblatex-nature \
    titlesec enumitem lastpage \
    fancyhdr csquotes \
    datetime2 datetime2-english \
    tracklang fmtcount
```
6. Build CV using the following command
```
latexmk -lualatex main.tex
```

