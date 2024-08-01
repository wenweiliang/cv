## Building CV using LaTex and 
Based on [@ccwang002 (Liang-Bo Wang)'s CV](https://github.com/ccwang002/cv/tree/master), with modifications to categorize publications by primary authorship and co-authorship.

### Steps
1. Install the necessary dependencies in terminal.
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
2. [Download](https://code.visualstudio.com/download) and install Visual Studio Code.
3. Follow this [guide](https://mathjiajia.github.io/vscode-and-latex/) to install the LaTeX Workshop extension in Visual Studio Code.
4. Open Visual Studio Code. In MacOS, press `cmd`+`shift`+`P` , then type and select `Preference: Open User Setting (JSON)`.
5. Copy and paste the [settings JSON content ](https://raw.githubusercontent.com/ccwang002/cv/master/.vscode/settings.json) into the User Settings file.

6. Run the following command to compile CV
```
latexmk -lualatex main.tex
```

7. Invite paperpilebot as a collaborator to the github to update publication automatically. Refresh `paperpile.bib`.
8. Mannualy edit `paperpile_annotated.bib` to highlight first authors.