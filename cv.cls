% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2024/07/17 My CV class]

% Class options
% Inherit options of article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Packages
\RequirePackage[margin=1.3cm]{geometry}         % Margin
\RequirePackage[english]{babel}                 % Language styles
\RequirePackage{graphicx}                       % Importing graphics
\RequirePackage{microtype}                      % Tweak typographics
\microtypesetup{
    activate=true,
    babel=true,
}

% Define colors (xcolor)
\RequirePackage[usenames,dvipsnames]{xcolor}
\definecolor{color-title}{gray}{0.10}   % theme color
\definecolor{color-text}{gray}{0.10}    % light black
\definecolor{color-detail}{gray}{0.40}  % dark gray

% Set default text color
% Ref: https://tex.stackexchange.com/a/26560
\makeatletter
\newcommand{\globalcolor}[1]{
    \color{#1}\global\let\default@color\current@color%
}
\makeatother
\AtBeginDocument{\globalcolor{color-text}}

% Unicode fonts
\RequirePackage{fontspec}

% Page styling
\RequirePackage{ragged2e}  % better ragged controls
% Use raggedright instead of RaggedRight will suppress all hypenations,
% but it leads to better layout in this case.
\raggedright
\raggedbottom

% Header and footer formatting (fancyhdr)
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyhf{}
\makeatletter%
\fancyfoot[R]{%
    \footnotesize
    \color{color-detail}
    Page \thepage\ of \@abspage@last%
}

\fancyfoot[L]{
    \footnotesize
    \color{color-detail}
    Wen-Wei Liang | CV
}

\makeatother

% Section title styling (titlesec)
\RequirePackage{titlesec}
\newcommand{\defaultsectionstyle}{
    \titleformat{\section}
        {\lightsourceserif\bfseries\scshape\Large\color{color-title}}
        {}{0pt}{}
        [\hrule height 0.6pt]
    % original section spacing is:
    %   {3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
    \titlespacing{\section}
        {0pt}  % left
        {2ex}  % before
        {1ex}  % after
}
\defaultsectionstyle

% Quotes
\RequirePackage[autostyle,english=american]{csquotes}
\MakeOuterQuote{"}

% Hyperlinks (hyperref)
\RequirePackage[hidelinks]{hyperref}
\urlstyle{same}

% Date and time format (datetime2)
% provide \Today
\RequirePackage[style=iso]{datetime2}

% Multi-column settings (multicol)
\RequirePackage{multicol}
\setlength{\columnsep}{12pt}  % default space between columns
\setlength{\multicolsep}{0pt}  % default vertical margin

% Custom list customization (enumitem)
% define custom list environments
\RequirePackage{enumitem}
\newlist{entrylist}{itemize}{2}
\setlist[entrylist]{
    label={},
    leftmargin=0pt,
    labelindent=\parindent,
    topsep=4pt plus 2pt minus 1pt,
    parsep=0pt,
    partopsep=0pt,
    itemsep=1ex plus 0.5ex minus 0.5ex,
}

\newlist{detaillist}{itemize}{1}
\setlist[detaillist]{
    label=\textbullet,
    leftmargin=1.5em,
    topsep=3pt,
    parsep=0pt,
    partopsep=0pt,
    itemsep=2pt plus 0.5pt minus 0.5pt,
    first=\normalsize
}

% Shorthand
\newcommand{\email}[1]{\href{mailto:#1}{#1}}

% Bibliography and styling
\RequirePackage[
    backend=biber,
    style=nature,
    sorting=ydnt,
    date=year,
    isbn=false,
    url=false,
    doi=true,
    eprint=false,
    minnames=35,
    maxnames=35,
    block=space,
    defernumbers=true
]{biblatex}

\AtEveryBibitem{\clearlist{language}} % clear language
% use small font for the bibliography
\renewcommand*{\bibfont}{\normalfont\normalfont}
% change the horizontal distance between the numeric label and the reference
\setlength{\biblabelsep}{\labelsep}
% Make author name bold in the reference and add co-first author notation
% using manual annotation (always work in biblatex v3.13+).
% Ref: https://tex.stackexchange.com/a/561064
\renewcommand*{\mkbibcompletename}[1]{
    {
        \ifitemannotation{highlight}{\bfseries}{}
        #1
    }
    \ifitemannotation{co-first}{\textsuperscript{*}}{}
    \ifitemannotation{co-second}{\textsuperscript{+}}{}
}
