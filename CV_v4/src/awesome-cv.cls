%% Start of file `awesome-cv.cls'.
% Awesome CV Class File
%
% This class has been downloaded from:
% https://github.com/posquit0/Awesome-CV
%
% Author:
% Claud D. Park <posquit0.bj@gmail.com>
% http://www.posquit0.com
%
% Notes:
% 1) This class file defines the structure and layout of the template file (cv.tex, resume.tex).
% 2) It has been written in such a way that under most circumstances you
% should not need to edit it.
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%


%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{awesome-cv}[2017/02/05 v1.6.1 Awesome Curriculum Vitae Class]
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to make header & footer efficiently
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Needed to manage math fonts
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
\RequirePackage{fontawesome5}

% Use Latin Modern / Computer Modern style fonts
% \RequirePackage{roboto}
% \RequirePackage[default,opentype]{sourcesanspro}

% File-based Latin Modern declarations are more portable across TeX Live/MiKTeX.
\setmainfont{lmroman10-regular.otf}[
  BoldFont       = lmroman10-bold.otf,
  ItalicFont     = lmroman10-italic.otf,
  BoldItalicFont = lmroman10-bolditalic.otf
]
\setsansfont{lmsans10-regular.otf}[
  BoldFont       = lmsans10-bold.otf,
  ItalicFont     = lmsans10-oblique.otf,
  BoldItalicFont = lmsans10-boldoblique.otf
]
\setmonofont{lmmono10-regular.otf}[
  ItalicFont     = lmmonoslant10-regular.otf
]
\setmathfont{latinmodern-math.otf}

% Needed for the photo ID
\RequirePackage[skins]{tcolorbox}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode,pdfpagelabels=false]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}
% Solves issues Warning: File `cv.out' has changed
\RequirePackage{bookmark}
% Prevent section headings from being orphaned at the bottom of a page
\RequirePackage{needspace}

%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure an optional directory location for fonts(default: 'fonts/')
% Not required anymore but left in place for backward compatability.
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}

%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=1.25cm, top=0.72cm, right=1.25cm, bottom=0.95cm, footskip=.35cm}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}

% Keep pages naturally compact instead of stretching vertical gaps.
\raggedbottom
\emergencystretch=1.5em


%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
% \definecolor{darktext}{HTML}{414141}
% \colorlet{text}{darkgray}
% \colorlet{graytext}{gray}
% \colorlet{lighttext}{lightgray}
% \colorlet{sectiondivider}{gray}
% To make them black
\definecolor{darktext}{HTML}{000000}
\colorlet{text}{black}
\colorlet{graytext}{black}
\colorlet{lighttext}{black}
\colorlet{sectiondivider}{black}

% Awesome colors
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}
\colorlet{awesome}{awesome-red}

% Boolean value to switch section color highlighting
\newbool{acvSectionColorHighlight}
\setbool{acvSectionColorHighlight}{true}

% Awesome section color
\def\@sectioncolor#1#2#3{%
  \ifbool{acvSectionColorHighlight}{{\color{awesome}#1#2#3}}{#1#2#3}%
}


%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
% Latin Modern Roman = Computer Modern style, original LaTeX-like font
\newcommand*{\headerfont}{\rmfamily}
\newcommand*{\headerfontlight}{\rmfamily}
\newcommand*{\footerfont}{\rmfamily}
\newcommand*{\bodyfont}{\rmfamily}
\newcommand*{\bodyfontlight}{\rmfamily}
%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Balanced academic layout tuned for Latin Modern / Computer Modern style.
% Header
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{24.5pt}{26.2pt}\selectfont\headerfont\bfseries\color{text} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{24.5pt}{26.2pt}\selectfont\headerfontlight\color{graytext} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{7.15pt}{8.05pt}\selectfont\bodyfont\upshape\color{awesome} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{6.65pt}{7.35pt}\selectfont\headerfont\upshape\color{text} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{6.35pt}{7.2pt}\selectfont\headerfont\color{text} #1}}
\newcommand*{\headerquotestyle}[1]{{\fontsize{7.8pt}{9pt}\selectfont\bodyfont\itshape\color{darktext} #1}}
\newcommand*{\footerstyle}[1]{{\fontsize{6.8pt}{7.4pt}\selectfont\footerfont\upshape\color{lighttext} #1}}

% Section
\newcommand*{\sectionstyle}[1]{{\fontsize{11.85pt}{12.85pt}\selectfont\bodyfont\bfseries\color{text}\@sectioncolor #1}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{9.5pt}{10.5pt}\selectfont\bodyfont\bfseries\textcolor{text}{#1}}}
\newcommand*{\paragraphstyle}{\fontsize{8.25pt}{9.45pt}\selectfont\bodyfontlight\upshape\color{text}}

% Entry
\newcommand*{\entrytitlestyle}[1]{{\fontsize{9.75pt}{9.75pt}\selectfont\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{7.35pt}{8.05pt}\selectfont\bodyfont\upshape\color{graytext} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{7.25pt}{8.00pt}\selectfont\bodyfontlight\itshape\color{graytext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{7.35pt}{8.00pt}\selectfont\bodyfontlight\itshape\color{awesome} #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{8.15pt}{9.35pt}\selectfont\bodyfontlight\upshape\color{text} #1}}

% Subentry
\newcommand*{\subentrytitlestyle}[1]{{\fontsize{7.4pt}{8.2pt}\selectfont\bodyfont\mdseries\color{graytext} #1}}
\newcommand*{\subentrypositionstyle}[1]{{\fontsize{6.8pt}{7.5pt}\selectfont\bodyfont\upshape\color{graytext} #1}}
\newcommand*{\subentrydatestyle}[1]{{\fontsize{6.8pt}{7.5pt}\selectfont\bodyfontlight\itshape\color{graytext} #1}}
\newcommand*{\subentrylocationstyle}[1]{{\fontsize{6.8pt}{7.5pt}\selectfont\bodyfontlight\itshape\color{awesome} #1}}
\newcommand*{\subdescriptionstyle}[1]{{\fontsize{7.5pt}{8.4pt}\selectfont\bodyfontlight\upshape\color{text} #1}}

% Honor
\newcommand*{\honortitlestyle}[1]{{\fontsize{7.75pt}{8.55pt}\selectfont\bodyfont\color{graytext} #1}}
\newcommand*{\honorpositionstyle}[1]{{\fontsize{7.75pt}{8.55pt}\selectfont\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\honordatestyle}[1]{{\fontsize{7.55pt}{8.25pt}\selectfont\bodyfont\color{graytext} #1}}
\newcommand*{\honorlocationstyle}[1]{{\fontsize{7.55pt}{8.25pt}\selectfont\bodyfontlight\itshape\color{awesome} #1}}

% Skill
\newcommand*{\skilltypestyle}[1]{{\fontsize{8.00pt}{8.85pt}\selectfont\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{7.90pt}{8.95pt}\selectfont\bodyfontlight\color{text} #1}}

% Cover letter
\newcommand*{\lettersectionstyle}[1]{{\fontsize{12.5pt}{13.5pt}\selectfont\bodyfont\bfseries\color{text}\@sectioncolor #1}}
\newcommand*{\recipientaddressstyle}[1]{{\fontsize{8.5pt}{9.5pt}\selectfont\bodyfont\upshape\color{graytext} #1}}
\newcommand*{\recipienttitlestyle}[1]{{\fontsize{10pt}{11pt}\selectfont\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\lettertitlestyle}[1]{{\fontsize{9.2pt}{10.2pt}\selectfont\bodyfontlight\bfseries\color{darktext} \underline{#1}}}
\newcommand*{\letterdatestyle}[1]{{\fontsize{8.5pt}{9.5pt}\selectfont\bodyfontlight\itshape\color{graytext} #1}}
\newcommand*{\lettertextstyle}{\fontsize{9pt}{11.8pt}\selectfont\bodyfontlight\upshape\color{graytext}}
\newcommand*{\letternamestyle}[1]{{\fontsize{9.2pt}{10.2pt}\selectfont\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\letterenclosurestyle}[1]{{\fontsize{8.5pt}{9.5pt}\selectfont\bodyfontlight\itshape\color{lighttext} #1}}

%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Define photo ID
% Usage: \photo[circle|rectangle,edge|noedge,left|right]{<path-to-image>}
\newcommand{\photo}[2][circle,edge,left]{%
  \def\@photo{#2}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{circle} \or \equal{\tmp}{rectangle}}%
      {\let\@photoshape\tmp}{}%
    \ifthenelse{\equal{\tmp}{edge} \or \equal{\tmp}{noedge}}%
      {\let\@photoedge\tmp}{}%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}%
      {\let\@photoalign\tmp}{}%
  }%
}
\def\@photoshape{circle}
\def\@photoedge{edge}
\def\@photoalign{left}

% Define writer's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define writer's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Define writer's position
% Usage: \position{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Defines writer's email (optional)
% Usage: \email{<email address>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's date of birth (optional)
% Usage: \dateofbirth{<date>}
\newcommand*{\dateofbirth}[1]{\def\@dateofbirth{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines writer's gitlab (optional)
% Usage: \gitlab{<gitlab-nick>}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}

% Defines writer's bitbucket (optional)
% Usage: \bitbucket{<bitbucket-nick>}
\newcommand*{\bitbucket}[1]{\def\@bitbucket{#1}}

% Defines writer's stackoverflow profile (optional)
% Usage: \stackoverflow{<so userid>}{<so username>}
%   e.g.https://stackoverflow.com/users/123456/sam-smith
%       would be \stackoverflow{123456}{sam-smith}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Defines writer's orcid (optional)
% Usage: \orcid{<orcid-num>}
\newcommand*{\orcid}[1]{\def\@orcid{#1}}

% Defines writer's twitter (optional)
% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Defines writer's Mastodon (optional)
% Usage: \mastodon{<instance>}{<mastodon-nick>}
\newcommand*{\mastodon}[2]{\def\@mastodoninstance{#1}\def\@mastodonname{#2}}

% Defines writer's resarchgate (optional)
% Usage: \researchgate{<researchgate-account>}
\newcommand*{\researchgate}[1]{\def\@researchgate{#1}}

% Defines writer's skype (optional)
% Usage: \skype{<skype account>}
\newcommand*{\skype}[1]{\def\@skype{#1}}

% Defines writer's reddit (optional)
% Usage: \reddit{<reddit account>}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}

% Defines writer's xing (optional)
% Usage: \xing{<xing name>}
\newcommand*{\xing}[1]{\def\@xing{#1}}

% Defines writer's medium profile (optional)
% Usage: \medium{<medium account>}
\newcommand*{\medium}[1]{\def\@medium{#1}}

% Defines writer's kaggle (optional)
% Usage: \kaggle{<kaggle handle>}
\newcommand*{\kaggle}[1]{\def\@kaggle{#1}}

% Defines writer's google scholar profile (optional)
% Usage: \googlescholar{<googlescholar userid>}{<googlescholar username>}
% e.g.https://scholar.google.co.uk/citations?user=wpZDx1cAAAAJ
% would be \googlescholar{wpZDx1cAAAAJ}{Name-to-display-next-icon}
% If 'googlescholar-name' is not provided than it defaults to
% '\firstname \lastname'
\newcommand*{\googlescholar}[2]{%
  \def\@googlescholarid{#1}%
  \ifthenelse{\equal{#2}{}}{%
    \def\@googlescholarname{\@firstname~\@lastname}%
  }{%
    \def\@googlescholarname{#2}%
  }%
}

% Defines writer's extra information (optional)
% Usage: \extrainfo{<extra information>}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

% Defines writer's quote (optional)
% Usage: \quote{<quote>}
\renewcommand*{\quote}[1]{\def\@quote{#1}}

% Defines recipient's information (cover letter only)
% Usage: \recipient{<recipient name>}{<recipient address>}
% Usage: \recipientname{<recipient name>}
% Usage: \recipientaddress{<recipient address>}
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\newcommand*{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand*{\recipientaddress}[1]{\def\@recipientaddress{#1}}

% Defines the title for letter (cover letter only, optional)
% Usage: \lettertitle{<title>}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}

% Defines the date for letter (cover letter only)
% Usage: \letterdate{<date>}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}

% Defines a message of opening for letter (cover letter only)
% Usage: \letteropening{<message>}
\newcommand*{\letteropening}[1]{\def\@letteropening{#1}}

% Defines a message of closing for letter (cover letter only)
% Usage: \letterclosing{<message>}
\newcommand*{\letterclosing}[1]{\def\@letterclosing{#1}}

% Defines an enclosure for letter (cover letter only, optional)
% Usage: \letterenclosure[<enclosure name>]{<enclosure>}
\newcommand*{\letterenclname}[1][Enclosure]{\def\@letterenclname{#1}}
\newcommand*{\letterenclosure}[2][]{%
  % if an optional argument is provided, use it to redefine \enclname
  \ifthenelse{\equal{#1}{}}{}{\def\@letterenclname{#1}}
  \def\@letterenclosure{#2}
}


%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{1.5mm}
\newcommand{\acvHeaderAfterPositionSkip}{0.15mm}
\newcommand{\acvHeaderAfterAddressSkip}{0mm}
\newcommand{\acvHeaderIconSep}{\hspace{0.35em}}
\newcommand{\acvHeaderSocialSep}{\hspace{0.85em}\textbar\hspace{0.85em}}
\newcommand{\acvHeaderAfterSocialSkip}{2.00mm}
\newcommand{\acvHeaderAfterQuoteSkip}{1.20mm}

% Others: balanced 2-page academic CV spacing
\newcommand{\acvSectionTopSkip}{2.25mm}
\newcommand{\acvSectionContentTopSkip}{0.45mm}
\newcommand{\acvEntryTopSkip}{0.18mm}
\newcommand{\acvEntryBottomSkip}{0.65mm}
\newcommand{\acvEntryDescriptionTopSkip}{-3.00mm}


%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\RaggedRight\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{C}[1]{>{\Centering\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{R}[1]{>{\RaggedLeft\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}

% Use to draw horizontal line with specific thickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}[1][C]{%
  \newcommand*{\drawphoto}{%
    \ifthenelse{\isundefined{\@photo}}{}{%
      \newlength{\photodim}
      \ifthenelse{\equal{\@photoshape}{circle}}%
        {\setlength{\photodim}{1.3cm}}%
        {\setlength{\photodim}{1.8cm}}%
      \ifthenelse{\equal{\@photoedge}{edge}}%
        {\def\@photoborder{darkgray}}%
        {\def\@photoborder{none}}%
      \begin{tikzpicture}%
        \node[\@photoshape, draw=\@photoborder, line width=0.3mm, inner sep=\photodim, fill overzoom image=\@photo] () {};
      \end{tikzpicture}
    }%
  }
  \newlength{\headertextwidth}
  \newlength{\headerphotowidth}
  \ifthenelse{\isundefined{\@photo}}{
    \setlength{\headertextwidth}{\textwidth}
    \setlength{\headerphotowidth}{0cm}
  }{%
    \setlength{\headertextwidth}{0.76\textwidth}
    \setlength{\headerphotowidth}{0.24\textwidth}
  }%
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{left}}{\raggedright\drawphoto}{}
  \end{minipage}
  \begin{minipage}[c]{\headertextwidth}
    \ifthenelse{\equal{#1}{L}}{\raggedright}{\ifthenelse{\equal{#1}{R}}{\raggedleft}{\centering}}
    \headerfirstnamestyle{\@firstname}\headerlastnamestyle{{}\acvHeaderNameDelim\@lastname}%
    \\[\acvHeaderAfterNameSkip]%
    \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}%
    \headersocialstyle{%
      \newbool{isstart}%
      \setbool{isstart}{true}%
      \ifthenelse{\isundefined{\@address}}%
        {}%
        {%
          \mbox{\faMapMarker*\acvHeaderIconSep\@address}%
          \setbool{isstart}{false}%
        }%
      \ifthenelse{\isundefined{\@mobile}}%
        {}%
        {%
          \href{tel:\@mobile}{\faMobile\acvHeaderIconSep\@mobile}%
          \setbool{isstart}{false}%
        }%
      \ifthenelse{\isundefined{\@email}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{mailto:\@email}{\faEnvelope\acvHeaderIconSep\@email}%
        }%
      \ifthenelse{\isundefined{\@dateofbirth}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          % \mbox prevents wrapping of elements%
          \mbox{\faBirthdayCake\acvHeaderIconSep\@dateofbirth}%
        }%
      \ifthenelse{\isundefined{\@homepage}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{http://\@homepage}{\faHome\acvHeaderIconSep\@homepage}%
        }%
      \ifthenelse{\isundefined{\@github}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://github.com/\@github}{\faGithubSquare\acvHeaderIconSep\@github}%
        }%
      \ifthenelse{\isundefined{\@gitlab}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://gitlab.com/\@gitlab}{\faGitlab\acvHeaderIconSep\@gitlab}%
        }%
      \ifthenelse{\isundefined{\@bitbucket}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://bitbucket.com/\@bitbucket}{\faBitbucket\acvHeaderIconSep\@bitbucket}%
        }%
      \ifthenelse{\isundefined{\@stackoverflowid}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://stackoverflow.com/users/\@stackoverflowid}{\faStackOverflow\acvHeaderIconSep\@stackoverflowname}%
        }%
      \ifthenelse{\isundefined{\@linkedin}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.linkedin.com/in/\@linkedin}{\faLinkedin\acvHeaderIconSep\@linkedin}%
        }%
      \ifthenelse{\isundefined{\@orcid}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://orcid.org/\@orcid}{\faOrcid\acvHeaderIconSep\@orcid}%
        }%
      \ifthenelse{\isundefined{\@twitter}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://twitter.com/\@twitter}{\faTwitter\acvHeaderIconSep\@twitter}%
        }%
      \ifthenelse{\isundefined{\@mastodonname}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://\@mastodoninstance/@\@mastodonname}{\faMastodon\acvHeaderIconSep\@mastodonname}%
        }%
      \ifthenelse{\isundefined{\@skype}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \faSkype\acvHeaderIconSep\@skype%
        }%
      \ifthenelse{\isundefined{\@reddit}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.reddit.com/user/\@reddit}{\faReddit\acvHeaderIconSep\@reddit}%
        }%
      \ifthenelse{\isundefined{\@researchgate}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.researchgate.net/profile/\@researchgate}{\faResearchgate\acvHeaderIconSep\@researchgate}%
        }%
      \ifthenelse{\isundefined{\@xing}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.xing.com/profile/\@xing}{\faXingSquare\acvHeaderIconSep\@xing}
        }%
      \ifthenelse{\isundefined{\@medium}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://medium.com/@\@medium}{\faMedium\acvHeaderIconSep\@medium}%
        }%
      \ifthenelse{\isundefined{\@kaggle}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://kaggle.com/\@kaggle}{\faKaggle\acvHeaderIconSep\@kaggle}%
        }%
      \ifthenelse{\isundefined{\@googlescholarid}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://scholar.google.com/citations?user=\@googlescholarid}{\faGraduationCap\acvHeaderIconSep\@googlescholarname}%
        }%
      \ifthenelse{\isundefined{\@extrainfo}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \@extrainfo%
        }%
    } \\[\acvHeaderAfterSocialSkip]%
    \ifthenelse{\isundefined{\@quote}}%
      {}%
      {\headerquotestyle{\@quote\\}\vspace{\acvHeaderAfterQuoteSkip}}%
  \end{minipage}%
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{right}}{\raggedleft\drawphoto}{}
  \end{minipage}
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}}
}

% Define a section for CV
% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{%
  \Needspace{4\baselineskip}%
  \par\addvspace{\acvSectionTopSkip}%
  \sectionstyle{#1}%
  \phantomsection%
  \color{sectiondivider}\vhrulefill{0.42pt}%
  \par\vspace{0.12mm}%
}

% Define a subsection for CV
% Usage: \cvsubsection{<subsection-title>}
\newcommand{\cvsubsection}[1]{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \subsectionstyle{#1}
  \phantomsection
}

% Define a paragraph for CV
\newenvironment{cvparagraph}{%
  \vspace{\acvSectionContentTopSkip}%
  \paragraphstyle%
  \RaggedRight%
}{%
  \par\vspace{0.15mm}%
}

% Define an environment for cventry
\newenvironment{cventries}{%
  \vspace{\acvSectionContentTopSkip}%
}{%
  \par\vspace{-0.05mm}%
}
% Define an entry of cv information
% Usage: \cventry{<position>}{<title>}{<location>}{<date>}{<description>}
\newcommand*{\cventry}[5]{%
  \par\addvspace{\acvEntryTopSkip}%
  \noindent%
  \setlength\tabcolsep{0pt}%
  \setlength{\extrarowheight}{0pt}%
  \begin{tabular*}{\textwidth}{@{}L{\dimexpr\textwidth-4.5cm\relax}@{\extracolsep{\fill}}R{4.5cm}@{}}
    \ifempty{#2#3}
      {\entrypositionstyle{#1} & \entrydatestyle{#4} \\[-0.75mm]}
      {\entrytitlestyle{#2} & \entrylocationstyle{#3} \\
       \entrypositionstyle{#1} & \entrydatestyle{#4} \\[-0.75mm]}
    \multicolumn{2}{@{}L{\textwidth}@{}}{\descriptionstyle{#5}} \\
  \end{tabular*}%
  \par\addvspace{\acvEntryBottomSkip}%
}

% Define an environment for cvsubentry
\newenvironment{cvsubentries}{%
  \vspace{0mm}%
}{%
  \par\vspace{0mm}%
}
% Define a subentry of cv information
% Usage: \cvsubentry{<position>}{<title>}{<date>}{<description>}
\newcommand*{\cvsubentry}[4]{%
  \setlength\tabcolsep{0pt}%
  \setlength{\extrarowheight}{0pt}%
  \begin{tabular*}{\textwidth}{@{}L{\dimexpr\textwidth-3.55cm\relax}@{\extracolsep{\fill}}R{3.55cm}@{}}
    \setlength\leftskip{0.15cm}%
    \subentrytitlestyle{#2} & \ifthenelse{\equal{#1}{}}{\subentrydatestyle{#3}}{}%
    \ifthenelse{\equal{#1}{}}{}{\subentrypositionstyle{#1} & \subentrydatestyle{#3} \\[-0.1mm]}%
    \ifthenelse{\equal{#4}{}}{}{\multicolumn{2}{@{}L{\textwidth}@{}}{\subdescriptionstyle{#4}} \\}%
  \end{tabular*}%
}

% Define an environment for cvhonor
% Modified layout: honor/award description on the left, year on the right.
% The location/country argument in \cvhonor is kept for backward compatibility but not printed.
\newenvironment{cvhonors}{%
  \vspace{\acvSectionContentTopSkip}%
  \noindent%
  \setlength\tabcolsep{0pt}%
  \setlength{\extrarowheight}{0pt}%
  \begin{tabular*}{\textwidth}{@{}L{\dimexpr\textwidth-1.5cm\relax}@{\extracolsep{\fill}}R{1.5cm}@{}}
}{%
  \end{tabular*}%
  \par\vspace{0mm}%
}

% Define a line of cv information(honor, award or something else)
% Usage: \cvhonor{<position>}{<title>}{<location>}{<date>}
% Note: <location> is intentionally ignored in the modified 2-column honors layout.
\newcommand*{\cvhonor}[4]{%
  \honorpositionstyle{#1}\ifempty{#2}{}{, \honortitlestyle{#2}} &%
  \honordatestyle{#4} \\[0.12mm]%
}

\newcommand*{\cvhonorworanking}[3]{%
  \honordatestyle{#3} & \honortitlestyle{#1} & \honorlocationstyle{#2} \\[0.12mm]%
}


% Define an environment for cvskill
\newenvironment{cvskills}{%
  \vspace{\acvSectionContentTopSkip}%
  \noindent%
  \setlength\tabcolsep{0pt}%
  \setlength{\extrarowheight}{0pt}%
  \begin{tabular*}{\textwidth}{@{}L{3.5cm}@{\hspace{0.35cm}}L{\dimexpr\textwidth-3.00cm\relax}@{}}
}{%
  \end{tabular*}%
  \par\vspace{0mm}%
}
% Define a line of cv information(skill)
% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[2]{%
  \skilltypestyle{#1} & \skillsetstyle{#2} \\[0.12mm]%
}

% Define an environment for cvitems(for cventry)
\newenvironment{cvitems}{%
  \vspace{\acvEntryDescriptionTopSkip}%
  \begin{itemize}[
    leftmargin=1.35em,
    labelsep=0.38em,
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0.08mm
  ]%
    \RaggedRight%
    \setlength{\parskip}{0pt}%
    \renewcommand{\labelitemi}{\raisebox{0.24ex}{\fontsize{2.9pt}{2.9pt}\selectfont\textbullet}}%
}{%
  \end{itemize}%
  \vspace{-0.15mm}%
}


%-------------------------------------------------------------------------------
%                Commands for elements of Cover Letter
%-------------------------------------------------------------------------------
% Define an environment for cvletter
\newenvironment{cvletter}{%
  \lettertextstyle
}{%
}

% Define a section for the cover letter
% Usage: \lettersection{<section-title>}
\newcommand{\lettersection}[1]{%
  \setcounter{subsection}{0}
  \par\addvspace{2.5ex}
  \phantomsection{}
  \lettersectionstyle{#1}
  \color{sectiondivider}\vhrulefill{0.9pt}
  \par\nobreak\addvspace{0.4ex}
  \lettertextstyle
}

\newcommand{\ssection}{%
  \@ifstar\@ssectionstar\@ssectionnostar
}

\newcommand{\@ssectionnostar}[1]{%
  \refstepcounter{section}
  \setcounter{subsection}{0}
  \par\addvspace{2.5ex}
  \phantomsection{}
  \lettersectionstyle{\thesection\quad #1}
  \color{sectiondivider}\vhrulefill{0.9pt}
  \par\nobreak\addvspace{0.4ex}
  \lettertextstyle
}

\newcommand{\@ssectionstar}[1]{%
  \setcounter{subsection}{0}
  \par\addvspace{2.5ex}
  \phantomsection{}
  \lettersectionstyle{#1}
  \color{sectiondivider}\vhrulefill{0.9pt}
  \par\nobreak\addvspace{0.4ex}
  \lettertextstyle
}

% Define centered section command
\newcommand{\ssectionwithcenter}{%
  \@ifstar\@ssectionwithcenterstar\@ssectionwithcenternostar
}

\newcommand{\@ssectionwithcenternostar}[1]{%
  \refstepcounter{section}
  \setcounter{subsection}{0}
  \par\addvspace{2.5ex}
  \phantomsection{}
  \begin{center}
  \lettersectionstyle{\thesection\quad #1}
  \end{center}
  \par\nobreak\addvspace{0.4ex}
  \lettertextstyle
}

\newcommand{\@ssectionwithcenterstar}[1]{%
  \setcounter{subsection}{0}
  \par\addvspace{2.5ex}
  \phantomsection{}
  \begin{center}
  \lettersectionstyle{#1}
  \end{center}
  \par\nobreak\addvspace{0.4ex}
  \lettertextstyle
}

% Define a title of the cover letter
% Usage: \makelettertitle
\newcommand*{\makelettertitle}{%
  \vspace{8.4mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \recipienttitlestyle{\@recipientname} & \letterdatestyle{\@letterdate}
  \end{tabular*}
  \begin{singlespace}
    \recipientaddressstyle{\@recipientaddress} \\\\
  \end{singlespace}
  \ifthenelse{\isundefined{\@lettertitle}}
    {}
    {\lettertitlestyle{\@lettertitle} \\}
  \lettertextstyle{\@letteropening}
}

% Define a closing of the cover letter
% Usage: \makeletterclosing
\newcommand*{\makeletterclosing}{%
  \vspace{3.4mm}
  \lettertextstyle{\@letterclosing} \\\\
  \letternamestyle{\@firstname\ \@lastname}
  \ifthenelse{\isundefined{\@letterenclosure}}
    {\\}
    {%
      \\\\\\
      \letterenclosurestyle{\@letterenclname: \@letterenclosure} \\
    }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               Modified by Hyungtae
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{pubSubsectionNum}{
  \smallskip
  \begin{enumerate}
   \itemsep -0.3em % Compress items in list together for aesthetics
  }{
  \end{enumerate}
  \vspace{0.5em} % Some space after the list of bullet points
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{journalSubsectionNumCounter}
\newcounter{confSubsectionNumCounter}

\newenvironment{journalSubsectionNum}{%
  \setcounter{journalSubsectionNumCounter}{0}%
  \begin{enumerate}[label={[j\thejournalSubsectionNumCounter]}, itemsep=-0.3em]%
  }{%
  \end{enumerate}%
  \vspace{0.5em}%
}

\newcommand{\journalSubsectionNumReverse}{%
  \begin{itemize}[label={[j\thejournalSubsectionNumCounter]}, itemsep=-0.3em, resume]%
}

\newcommand{\subsectionNumEnd}{%
\end{itemize}%
\stepcounter{journalSubsectionNumCounter}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\hyungtaelim}{\textbf{Hyungtae Lim}}
\newcommand{\underreview}{Under review.}
\newcommand{\accepted}{Accepted. To appear.}
\newcommand{\submitted}{Submitted.}

\definecolor{justblue}{HTML}{0000F1}
% Not to use xcolor, define colors manually using RGB values
\definecolor{Violet}{rgb}{0.56, 0.0, 0.85}        
\definecolor{BurntOrange}{rgb}{0.9, 0.45, 0.0}    
\definecolor{Cerulean}{rgb}{0.0, 0.48, 0.90}      

\usepackage[font=footnotesize]{subcaption}
\usepackage{enumitem}
\usepackage{indentfirst}
\usepackage{hyperref}
\usepackage{cleveref}
\usepackage{cite}
%\usepackage[dvipsnames]{xcolor}
\usepackage{wrapfig}
\usepackage{xspace}
\usepackage{booktabs} % toprule, midrule, and bottomrule
\usepackage{wasysym}
% \usepackage{fontawesome5}
\captionsetup[figure]{labelformat={default},labelsep=period,name={Fig.}}

\Crefname{section}{Sec.}{Secs.} 
\Crefname{figure}{Fig.}{Figs.} 
\Crefname{table}{Table}{Tables} 
% To simplify Equation (#) to (#)
\crefname{equation}{}{}
\Crefname{equation}{}{}



