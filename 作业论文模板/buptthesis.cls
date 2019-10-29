%%
%% This is file `buptthesis.cls',
%% generated with the docstrip utility.
%%
%% buptthesis.dtx  (with options: `class')
%% This file has the LPPL maintenance status "maintained".
%% 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{buptthesis}
  [2019/10/08 1.0.0rc Beijing University of Posts and Telecommunications Thesis Template]
\hyphenation{BUPT-Thesis}
\def\buptthesis{BUPT\textsc{Thesis}}
\def\version{1.0.0rc}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=bupt,
  prefix=bupt@,
  setkeys=\kvsetkeys}
\DeclareStringOption[doctor]{degree}[doctor]
\DeclareStringOption[chinese]{language}[chinese]
\DeclareStringOption[5]{zihao}[5]
\DeclareStringOption[all]{setlatinfont}[all]
\DeclareStringOption[GB]{mathstyle}[GB]
\DeclareStringOption[gb7714-2015]{bibstyle}[gb7714-2015]
\DeclareBoolOption{review}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\newcommand{\bupt@validate@key}[1]{%
  \@ifundefined{bupt@#1@\csname bupt@#1\endcsname true}{%
    \ClassError{buptthesis}{Invalid value '\csname bupt@#1\endcsname'}{}%
  }{%
    \csname bupt@#1@\csname bupt@#1\endcsname true\endcsname
  }%
}
\newif\ifbupt@degree@course
\newif\ifbupt@degree@bachelor
\newif\ifbupt@degree@master
\newif\ifbupt@degree@doctor
\bupt@validate@key{degree}
\ifbupt@degree@course\bupt@degree@bachelortrue\fi
\ifbupt@degree@doctor\bupt@degree@mastertrue\fi
\newif\ifbupt@language@chinese
\newif\ifbupt@language@english
\bupt@validate@key{language}
\newif\ifbupt@setlatinfont@none
\newif\ifbupt@setlatinfont@main
\newif\ifbupt@setlatinfont@math
\newif\ifbupt@setlatinfont@all
\bupt@validate@key{setlatinfont}
\ifbupt@setlatinfont@all
  \bupt@setlatinfont@maintrue
  \bupt@setlatinfont@mathtrue
\fi
\newif\ifbupt@mathstyle@GB
\@ifundefined{bupt@mathstyle@\csname bupt@mathstyle\endcsname true}{}{%
  \bupt@mathstyle@GBtrue
  \def\bupt@mathstyle{ISO}
}
\ifbupt@language@english
  \PassOptionsToClass{scheme=plain}{ctexbook}
\fi
\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{math-style=\bupt@mathstyle}{unicode-math}
\LoadClass[a4paper,zihao=\bupt@zihao,linespread=1.3,UTF8]{ctexbook}
\ifbupt@degree@bachelor
  \AtEndOfClass{\input{buptthesis-bachelor.ltx}}
\else
  \ifbupt@degree@master
    \AtEndOfClass{\input{buptthesis-graduate.ltx}}
  \fi
\fi
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{environ}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{pageslts}
\RequirePackage{amsmath}
\ifbupt@setlatinfont@math
  \RequirePackage{unicode-math}
\fi
\RequirePackage{anyfontsize}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{caption}
\RequirePackage[list=off]{bicaption}
\RequirePackage{subcaption}
\RequirePackage[backend=biber,style=\bupt@bibstyle]{biblatex}
\RequirePackage[titles]{tocloft}
\RequirePackage[inline]{enumitem}
\RequirePackage[perpage, bottom]{footmisc}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage{hyperref}
\newcommand{\bupt@def@term}[1]{%
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname bupt@value@#1\endcsname{##1}}
  \csname #1\endcsname{}
  \define@key{buptvalue}{#1}{\csname #1\endcsname{##1}}}
\bupt@def@term{title}
\bupt@def@term{entitle}
\bupt@def@term{keywords}
\bupt@def@term{enkeywords}
\bupt@def@term{author}
\bupt@def@term{supervisor}
\bupt@def@term{assisupervisor}
\bupt@def@term{enauthor}
\bupt@def@term{ensupervisor}
\bupt@def@term{enassisupervisor}
\bupt@def@term{studentid}
\bupt@def@term{degree}
\bupt@def@term{endegree}
\bupt@def@term{department}
\bupt@def@term{endepartment}
\bupt@def@term{major}
\bupt@def@term{enmajor}
\bupt@def@term{coursename}
\bupt@def@term{encoursename}
\bupt@def@term{fund}
\bupt@def@term{enfund}
\bupt@def@term{date}
\bupt@def@term{endate}
\NewDocumentCommand\buptSetInfo{}{\setkeys{buptvalue}}
\newcommand{\bupt@def@label}[2]{%
  \expandafter\gdef\csname bupt@label@#1\endcsname{#2}
  \define@key{buptlabel}{#1}{%
    \expandafter\gdef\csname bupt@label@#1\endcsname{##1}}}
\bupt@def@label{schoolChi}{北京邮电大学}
\bupt@def@label{schoolEng}{Shanghai Jiao Tong University}
\bupt@def@label{originalityChi}{原创性声明}
\bupt@def@label{originalityEng}{Declaration of Originality}
\bupt@def@label{authorizationChi}{版权使用授权书}
\bupt@def@label{authorizationEng}{Declaration of Authorization}
\bupt@def@label{origtitle}{\bupt@label@thesistype\bupt@label@originalityChi}
\bupt@def@label{authtitle}{\bupt@label@thesistype\bupt@label@authorizationChi}
\bupt@def@label{origbody}{%
  本人郑重声明：所呈交的\bupt@label@thesistype ，是本人在导师的指导下，
  独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含
  任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献
  的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果
  由本人承担。}
\bupt@def@label{authbody}{%
  本\bupt@label@thesistype 作者
  完全了解学校有关保留、使用\bupt@label@thesistype 的规定，同意学校保留
  并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。
  本人授权\bupt@label@schoolChi 可以将本\bupt@label@thesistype 的全部或
  部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存
  和汇编本\bupt@label@thesistype 。}
\bupt@def@label{abstractChi}{摘\quad 要}
\bupt@def@label{abstractEng}{Abstract}
\bupt@def@label{keywordsChi}{关键词：}
\bupt@def@label{keywordsEng}{Key words:~}
\ifbupt@language@english
  \bupt@def@label{titlepage}{Title Page}
  \def\bupt@label@originality{\bupt@label@originalityEng}
  \def\bupt@label@authorization{\bupt@label@authorizationEng}
  \def\bupt@label@abstract{\bupt@label@abstractEng}
  \bupt@def@label{contents}{Contents}
  \bupt@def@label{figure}{Figure}
  \bupt@def@label{listfigure}{List of Figures}
  \bupt@def@label{table}{Table}
  \bupt@def@label{listtable}{List of Tables}
  \bupt@def@label{algorithm}{Algorithm}
  \bupt@def@label{listalgorithm}{List of Algorithms}
  \bupt@def@label{nomenclature}{Nomenclature}
  \bupt@def@label{summary}{Summary}
  \bupt@def@label{acknowledgements}{Acknowledgements}
  \bupt@def@label{publications}{Publications}
  \bupt@def@label{patents}{Patents}
  \bupt@def@label{projects}{Projects}
  \bupt@def@label{resume}{Resume}
\else
  \bupt@def@label{titlepage}{扉页}
  \def\bupt@label@originality{\bupt@label@originalityChi}
  \def\bupt@label@authorization{\bupt@label@authorizationChi}
  \def\bupt@label@abstract{\bupt@label@abstractChi}
  \bupt@def@label{contents}{目\quad 录}
  \bupt@def@label{figure}{图}
  \bupt@def@label{listfigure}{插图索引}
  \bupt@def@label{table}{表}
  \bupt@def@label{listtable}{表格索引}
  \bupt@def@label{algorithm}{算法}
  \bupt@def@label{listalgorithm}{算法索引}
  \bupt@def@label{nomenclature}{主要符号对照表}
  \bupt@def@label{summary}{全文总结}
  \bupt@def@label{acknowledgements}{致\quad 谢}
  \bupt@def@label{publications}%
                 {攻读\bupt@label@degreetypeChi 学位期间已发表或录用的论文}
  \bupt@def@label{patents}%
                 {攻读\bupt@label@degreetypeChi 学位期间申请的专利}
  \bupt@def@label{projects}%
                 {攻读\bupt@label@degreetypeChi 学位期间参与的项目}
  \bupt@def@label{resume}{简\quad 历}
\fi
\NewDocumentCommand\buptSetLabel{}{\setkeys{buptlabel}}
\ctexset{%
  contentsname   = \bupt@label@contents,
  listfigurename = \bupt@label@listfigure,
  listtablename  = \bupt@label@listtable}
\newif\ifbupt@xitsnew
\@ifpackagelater{fontspec}{2017/01/20}{
  \IfFontExistsTF{XITSMath-Regular.otf}{
    \bupt@xitsnewtrue
  }{}
}{}
\ifbupt@setlatinfont@main
  \ifbupt@xitsnew
    \setmainfont{XITS}[
      Extension          = .otf,
      UprightFont        = *-Regular,
      BoldFont           = *-Bold,
      ItalicFont         = *-Italic,
      BoldItalicFont     = *-BoldItalic,
      UprightFeatures    = { SmallCapsFont = texgyretermes-regular },
      BoldFeatures       = { SmallCapsFont = texgyretermes-bold },
      ItalicFeatures     = { SmallCapsFont = texgyretermes-italic },
      BoldItalicFeatures = { SmallCapsFont = texgyretermes-bolditalic },
      SmallCapsFeatures  = { Letters = SmallCaps }
    ]
  \else
    \setmainfont{xits}[
      Extension          = .otf,
      UprightFont        = *-regular,
      BoldFont           = *-bold,
      ItalicFont         = *-italic,
      BoldItalicFont     = *-bolditalic,
      UprightFeatures    = { SmallCapsFont = texgyretermes-regular },
      BoldFeatures       = { SmallCapsFont = texgyretermes-bold },
      ItalicFeatures     = { SmallCapsFont = texgyretermes-italic },
      BoldItalicFeatures = { SmallCapsFont = texgyretermes-bolditalic },
      SmallCapsFeatures  = { Letters = SmallCaps }
    ]
  \fi
  \RequirePackage[opentype,scaled=.9]{sourcesanspro}
  \RequirePackage[opentype,scaled=.9]{sourcecodepro}
\fi
\ifbupt@setlatinfont@math
  \ifbupt@xitsnew
    \setmathfont{XITSMath-Regular}[
      Extension    = .otf,
      BoldFont     = XITSMath-Bold,
      StylisticSet = 8
    ]
    \setmathfont{XITSMath-Regular.otf}[range={cal,bfcal},StylisticSet=1]
    \else
    \setmathfont{xits-math}[
      Extension    = .otf,
      BoldFont     = *bold,
      StylisticSet = 8
    ]
    \setmathfont{xits-math.otf}[range={cal,bfcal},StylisticSet=1]
  \fi
\fi
\patchcmd\cleardoublepage%
  {\newpage}{\thispagestyle{empty}\newpage}
  {}{}
\patchcmd\chapter%
  {\thispagestyle{\CTEX@chapter@pagestyle}}{}
  {}{}
\AtBeginDocument{%
  \pagenumbering{Alph}
  \pagestyle{empty}}
\ctexset{%
  chapter={%
    format       = \zihao{3}\bfseries\heiti\centering,
    nameformat   = {},
    titleformat  = {},
    aftername    = \quad,
    afterindent  = true,
    beforeskip   = 1ex,
    afterskip    = 2ex
  },
  section={%
    format       = \zihao{4}\bfseries\heiti,
    afterindent  = true,
    afterskip    = 1ex \@plus .2ex
  },
  subsection={%
    format       = \zihao{-4}\bfseries\heiti,
    afterindent  = true,
    afterskip    = 1ex \@plus .2ex
  },
  subsubsection={%
    format       = \zihao{-4}\normalfont,
    afterindent  = true,
    afterskip    = 1ex \@plus .2ex
  },
  paragraph/afterindent    = true,
  subparagraph/afterindent = true}
\ctexset{%
  punct          = quanjiao,
  space          = auto,
  autoindent     = true}
\AtEndOfClass{\sloppy}
\setlist{nosep}
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\renewcommand{\tableofcontents}{%
  \cleardoublepage%
  \pdfbookmark[0]{\contentsname}{toc}%
  \chapter*{\contentsname}%
  \@mkboth{\contentsname}{\contentsname}%
  \@starttoc{toc}
}
\renewcommand{\listoffigures}{%
  \cleardoublepage%
  \pdfbookmark[0]{\listfigurename}{lof}%
  \chapter*{\listfigurename}%
  \@mkboth{\listfigurename}{\listfigurename}%
  \@starttoc{lof}
}
\renewcommand{\listoftables}{%
  \cleardoublepage%
  \pdfbookmark[0]{\listtablename}{lot}%
  \chapter*{\listtablename}%
  \@mkboth{\listtablename}{\listtablename}%
  \@starttoc{lot}
}
\renewcommand{\cftfigpresnum}{\bupt@label@figure~}
\renewcommand{\cfttabpresnum}{\bupt@label@table~}
\AtEndPreamble{%
  \newlength{\bupt@cftfignumwidth@tmp}
    \settowidth{\bupt@cftfignumwidth@tmp}{\cftfigpresnum}
  \addtolength{\cftfignumwidth}{\bupt@cftfignumwidth@tmp}
  \newlength{\bupt@cfttabnumwidth@tmp}
    \settowidth{\bupt@cfttabnumwidth@tmp}{\cfttabpresnum}
  \addtolength{\cfttabnumwidth}{\bupt@cfttabnumwidth@tmp}
}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\AtBeginDocument{%
  \renewcommand{\theequation}{\thechapter--\arabic{equation}}
  \renewcommand{\thefigure}{\thechapter--\arabic{figure}}
  \renewcommand{\p@subfigure}{\thefigure}
  \renewcommand{\thetable}{\thechapter--\arabic{table}}
}
\newif\ifbupt@setfloatfont
\renewcommand{\@floatboxreset}{%
  \reset@font
  \ifbupt@setfloatfont
    \zihao{5}
  \else
    \normalsize
  \fi
  \@setminipage
}
\BeforeBeginEnvironment{longtable}
  {\begingroup\ifbupt@setfloatfont\zihao{5}\fi}
\AfterEndEnvironment{longtable}
  {\endgroup}
\NewDocumentCommand{\buptSetFloatFontOn}{}{\bupt@setfloatfonttrue}
\NewDocumentCommand{\buptSetFloatFontOff}{}{\bupt@setfloatfontfalse}
\DeclareCaptionFont{buptcaptionfont}{\zihao{5}\kaishu}
\DeclareCaptionFont{buptsubcaptionfont}{\zihao{5}\normalfont}
\captionsetup{%
  format        = plain,
  labelformat   = simple,
  labelsep      = space,
  justification = centering,
  font          = buptcaptionfont
}
\captionsetup[sub]{%
  format        = hang,
  labelformat   = brace,
  justification = justified,
  font          = buptsubcaptionfont
}
\DeclareCaptionOption{bi-first}[]{%
  \def\tablename{\bupt@label@table}
  \def\figurename{\bupt@label@figure}}
\DeclareCaptionOption{bi-second}[]{%
  \def\tablename{Table}
  \def\figurename{Figure}}
\captionsetup[bi-first]{bi-first}
\captionsetup[bi-second]{bi-second}
\ifbupt@mathstyle@GB
  \let\mathellipsis\cdots
  \AtBeginDocument{%
    \renewcommand{\Re}{\operatorname{Re}}%
    \renewcommand{\Im}{\operatorname{Im}}%
  }
\fi
\newcommand\upe{\mathrm{e}}
\newcommand\upi{\mathrm{i}}
\newcommand\upj{\mathrm{j}}
\newcommand\dif{\mathop{}\!\mathrm{d}}
\newcommand{\bupt@square}{%
  \begingroup\CJKfamily+{zhsong}\symbol{"25A1}\endgroup
}
\newcommand{\bupt@authconf}{%
  \par\hspace{7em}%
  {\heiti 保\quad 密}~\bupt@square，在 \uline{\hspace{3em}}
  年解密后适用本授权书。\par
  本\bupt@label@thesiscat 属于
  \par\hspace{7em}%
  {\heiti 不保密}~\bupt@square。
  \vskip 1ex
  （请在以上方框内打“$\checkmark$”）
}
\newcommand{\bupt@signbox}[1]{%
  \parbox{.45\textwidth}{%
    #1 签名： \vskip 4em%
    日期： \hspace{\stretch{3}} 年%
    \hspace{\stretch{2}} 月 \hspace{\stretch{2}} 日%
  }
}
\NewDocumentCommand{\makeDeclareOriginality}{o}{%
  \ifbupt@review\relax\else
    \cleardoublepage
    \pdfbookmark[0]{\bupt@label@originality}{origtitle}
    \IfNoValueTF{#1}{%
      \thispagestyle{empty}
      \chapter*{\zihao{-2}\bupt@label@schoolChi \\%
                \bupt@label@origtitle}
      \begingroup
        \zihao{4}
        \bupt@label@origbody
        \vskip 16ex
        \noindent
        \begin{minipage}{\textwidth}
          \hfill
          \bupt@signbox{\bupt@label@thesiscat 作者}
        \end{minipage}
      \endgroup
    }
    {\includepdf[pagecommand={\thispagestyle{empty}}]{#1}}
    \cleardoublepage
  \fi
}
\NewDocumentCommand{\makeDeclareAuthorization}{o}{%
  \ifbupt@review\relax\else
    \cleardoublepage
    \pdfbookmark[0]{\bupt@label@authorization}{authtitle}
    \IfNoValueTF{#1}{%
      \thispagestyle{empty}
      \chapter*{\zihao{-2}\bupt@label@schoolChi \\%
                \bupt@label@authtitle}
      \begingroup
        \zihao{4}
        \bupt@label@authbody
        \vskip 1ex
        \bupt@authconf
        \vskip 16ex
        \noindent
        \begin{minipage}{\textwidth}
          \bupt@signbox{\bupt@label@thesiscat 作者}
          \hfill
          \bupt@signbox{指导教师}
        \end{minipage}
      \endgroup
    }
    {\includepdf[pagecommand={\thispagestyle{empty}}]{#1}}
    \cleardoublepage
  \fi
}
\NewDocumentEnvironment{nomenclature}{m}{%
  \cleardoublepage
  \pdfbookmark[0]{\bupt@label@nomenclature}{nomenclature}
  \chapter*{\bupt@label@nomenclature}
  \@mkboth{\bupt@label@nomenclature}%
          {\bupt@label@nomenclature}%
  \begin{longtable}{#1}
}{\end{longtable}}
\NewDocumentEnvironment{summary}{}{%
  \cleardoublepage
  \chapter*{\bupt@label@summary}
  \@mkboth{\bupt@label@summary}%
          {\bupt@label@summary}%
  \addcontentsline{toc}{chapter}{\bupt@label@summary}%
}{}
\newcommand{\bupt@acknowledgements}[1]{\long\gdef\bupt@acknowledgements@body{#1}}
\NewDocumentEnvironment{acknowledgements}{}{%
  \Collect@Body\bupt@acknowledgements
}{%
  \ifbupt@review\relax\else
    \cleardoublepage
    \chapter*{\bupt@label@acknowledgements}
    \@mkboth{\bupt@label@acknowledgements}%
            {\bupt@label@acknowledgements}%
    \addcontentsline{toc}{chapter}{\bupt@label@acknowledgements}%
    \bupt@acknowledgements@body
  \fi
}
\newenvironment{bupt@bibliolist}[2]{%
  \cleardoublepage
  \chapter{#2}
  \@mkboth{#2}{#2}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
       {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m
}{%
  \def\@noitemerr
    {\@latex@warning{Empty `bibliolist' environment}}%
  \endlist
}
\newcommand{\bupt@publications}[1]{\long\gdef\bupt@publications@body{#1}}
\NewDocumentEnvironment{publications}{O{99}}{%
  \Collect@Body\bupt@publications
}{%
  \ifbupt@review\relax\else
    \begin{bupt@bibliolist}{#1}{\bupt@label@publications}
      \bupt@publications@body
    \end{bupt@bibliolist}
  \fi
}
\newcommand{\bupt@@publications}[1]{\long\gdef\bupt@@publications@body{#1}}
\NewDocumentEnvironment{publications*}{O{99}}{%
  \Collect@Body\bupt@@publications
}{%
  \ifbupt@review
    \begin{bupt@bibliolist}{#1}{\bupt@label@publications}
      \bupt@@publications@body
    \end{bupt@bibliolist}
  \fi
}
\newcommand{\bupt@projects}[1]{\long\gdef\bupt@projects@body{#1}}
\NewDocumentEnvironment{projects}{O{99}}{%
  \Collect@Body\bupt@projects
}{%
  \ifbupt@review\relax\else
    \begin{bupt@bibliolist}{#1}{\bupt@label@projects}
      \bupt@projects@body
    \end{bupt@bibliolist}
  \fi
}
\newcommand{\bupt@@projects}[1]{\long\gdef\bupt@@projects@body{#1}}
\NewDocumentEnvironment{projects*}{O{99}}{%
  \Collect@Body\bupt@@projects
}{%
  \ifbupt@review
    \begin{bupt@bibliolist}{#1}{\bupt@label@projects}
      \bupt@@projects@body
    \end{bupt@bibliolist}
  \fi
}
\newcommand{\bupt@patents}[1]{\long\gdef\bupt@patents@body{#1}}
\NewDocumentEnvironment{patents}{O{99}}{%
  \Collect@Body\bupt@patents
}{%
  \ifbupt@review\relax\else
    \begin{bupt@bibliolist}{#1}{\bupt@label@patents}
      \bupt@patents@body
    \end{bupt@bibliolist}
  \fi
}
\newcommand{\bupt@@patents}[1]{\long\gdef\bupt@@patents@body{#1}}
\NewDocumentEnvironment{patents*}{O{99}}{%
  \Collect@Body\bupt@@patents
}{%
  \ifbupt@review
    \begin{bupt@bibliolist}{#1}{\bupt@label@patents}
      \bupt@@patents@body
    \end{bupt@bibliolist}
  \fi
}
\newcommand{\bupt@resume}[1]{\long\gdef\bupt@resume@body{#1}}
\NewDocumentEnvironment{resume}{}{%
  \Collect@Body\bupt@resume
}{%
  \ifbupt@review\relax\else
    \cleardoublepage
    \chapter{\bupt@label@resume}
    \@mkboth{\bupt@label@resume}%
            {\bupt@label@resume}%
    \bupt@resume@body
  \fi
}
\AtBeginDocument{
  \ifbupt@review%
    \buptSetInfo{%
      author={},
      supervisor={},
      assisupervisor={},
      enauthor={},
      ensupervisor={},
      enassisupervisor={},
      studentid={},
      date={},
      endate={}
    }
  \fi
  \hypersetup{%
    pdftitle    = \bupt@value@title,
    pdfauthor   = \bupt@value@author,
    pdfsubject  = \bupt@label@subjectChi,
    pdfkeywords = \bupt@value@keywords,
    pdfcreator  = {LaTeX with BUPTThesis \version}
  }%
}
\NewDocumentCommand{\encrypt}{m O{***}}{%
  \ifbupt@review
    {#2}
  \else
    {#1}
  \fi
}
\newcommand{\bupt@uline}[1]{%
  \begingroup
    \setbox0=\vbox{\strut #1\strut}%
    \dimen0=0pt
    \loop\ifdim\ht0>0pt
      \dimen1=\dimexpr\ht0 - \baselineskip\relax
      \setbox1=\vsplit0 to \ht\strutbox
      \advance\dimen1 by -\ht0
      \noindent\raisebox{-\dimen0}[\ht\strutbox][\dp\strutbox]{\box1}%
      \advance\dimen0 by \dimen1
      \vspace{-0.2ex}\hrule\vskip 0.2ex
    \repeat
  \endgroup
}
\hypersetup{
  linktoc            = all,
  bookmarksnumbered  = true,
  bookmarksopen      = true,
  bookmarksopenlevel = 1,
  unicode            = true,
  psdextra           = true,
  breaklinks         = true,
  plainpages         = false,
  hidelinks,
}
\pdfstringdefDisableCommands{%
  \let\\\@empty
  \let\quad\@empty
  \let\hspace\@gobble
}
\urlstyle{same}
\def\UrlBreaks{%
  \do\/%
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l%
     \do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z%
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L%
     \do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z%
  \do0\do1\do2\do3\do4\do5\do6\do7\do8\do9\do=\do/\do.\do:%
  \do\*\do\-\do\~\do\'\do\"\do\-}
\Urlmuskip=0mu plus 0.1mu
\newcommand{\bupt@atendpackage}{\csname ctex_at_end_package:nn\endcsname}
\bupt@atendpackage{unicode-math}{
  \newcommand{\bm}{\symbf}
  \renewcommand{\boldsymbol}{\symbf}
  \newcommand{\square}{\mdlgwhtsquare}
  \@ifpackagelater{hyperref}{2019/04/27}{}{%
    \g@addto@macro\psdmapshortnames{\let\mu\textmugreek}%
  }
}
\bupt@atendpackage{threeparttable}{
  \appto\TPTnoteSettings{\footnotesize}
}
\bupt@atendpackage{siunitx}{
  \sisetup{
    detect-all,
    group-minimum-digits = 4,
    separate-uncertainty = true,
    inter-unit-product   = \ensuremath{{}\cdot{}},
  }
  \ifbupt@language@chinese
    \sisetup{
      list-final-separator = { 和 },
      list-pair-separator  = { 和 },
      range-phrase         = {～},
    }
  \fi
}
\PassOptionsToPackage{amsmath,thmmarks,hyperref}{ntheorem}
\bupt@atendpackage{ntheorem}{
  \ifbupt@language@chinese
    \def\bupt@label@assertion{断言}
    \def\bupt@label@assumption{假设}
    \def\bupt@label@axiom{公理}
    \def\bupt@label@corollary{推论}
    \def\bupt@label@definition{定义}
    \def\bupt@label@example{例}
    \def\bupt@label@lemma{引理}
    \def\bupt@label@proof{证明}
    \def\bupt@label@proposition{命题}
    \def\bupt@label@remark{注}
    \def\bupt@label@theorem{定理}
  \else
    \def\bupt@label@assertion{Assertion}
    \def\bupt@label@assumption{Assumption}
    \def\bupt@label@axiom{Axiom}
    \def\bupt@label@corollary{Corollary}
    \def\bupt@label@definition{Definition}
    \def\bupt@label@example{Example}
    \def\bupt@label@lemma{Lemma}
    \def\bupt@label@proof{Proof}
    \def\bupt@label@proposition{Proposition}
    \def\bupt@label@remark{Remark}
    \def\bupt@label@theorem{Theorem}
  \fi
  \theoremheaderfont{\bfseries\heiti}
  \theorembodyfont{\normalfont}
  \theoremseparator{}
  \theoremsymbol{\ensuremath{\square}}
  \newtheorem*{proof}{\bupt@label@proof}
  \theoremstyle{plain}
  \theoremsymbol{}
  \newtheorem{theorem}             {\bupt@label@theorem}    [chapter]
  \newtheorem{assertion}  [theorem]{\bupt@label@assertion}
  \newtheorem{axiom}      [theorem]{\bupt@label@axiom}
  \newtheorem{corollary}  [theorem]{\bupt@label@corollary}
  \newtheorem{lemma}      [theorem]{\bupt@label@lemma}
  \newtheorem{proposition}[theorem]{\bupt@label@proposition}
  \newtheorem{assumption}          {\bupt@label@assumption} [chapter]
  \newtheorem{definition}          {\bupt@label@definition} [chapter]
  \newtheorem{example}             {\bupt@label@example}    [chapter]
  \newtheorem*{remark}             {\bupt@label@remark}
}
\PassOptionsToPackage{algochapter}{algorithm2e}
\bupt@atendpackage{algorithm2e}{
  \SetAlgorithmName{\bupt@label@algorithm}%
                   {\bupt@label@algorithm}%
                   {\bupt@label@listalgorithm}
  \SetAlgoCaptionSeparator{~}
  \newcommand{\cftalgpresnum}{\bupt@label@algorithm~}
  \AtEndPreamble{%
    \newlength{\cftalgindent}
      \setlength{\cftalgindent}{1.5em}
    \newlength{\cftalgnumwidth}
      \setlength{\cftalgnumwidth}{2.3em}
    \newlength{\bupt@cftalgnumwidth@tmp}
      \settowidth{\bupt@cftalgnumwidth@tmp}{\cftalgpresnum}
    \addtolength{\cftalgnumwidth}{\bupt@cftalgnumwidth@tmp}
  }
  \renewcommand*{\l@algocf}{%
    \let\@cftbsnum \cftalgpresnum
    \@dottedtocline{1}{\cftalgindent}{\cftalgnumwidth}
  }
  \renewcommand{\listofalgorithms}{%
    \cleardoublepage%
    \pdfbookmark[0]{\listalgorithmcfname}{loa}%
    \chapter*{\listalgorithmcfname}%
    \@mkboth{\listalgorithmcfname}{\listalgorithmcfname}%
    \@starttoc{loa}
  }
  \AtBeginDocument{%
   \renewcommand{\thealgocf}{\thechapter--\@arabic\c@algocf}
  }
}
\bupt@atendpackage{algorithm}{
  \RequirePackage{algorithmicx, algpseudocode}
  \floatname{algorithm}{\bupt@label@algorithm}
  \@addtoreset{algorithm}{chapter}
  \patchcmd\@chapter%
    {\if@twocolumn}
    {\addtocontents{loa}{\protect\addvspace{10\p@}}%
      \if@twocolumn}
    {}{}
  \renewcommand{\listalgorithmname}{\bupt@label@listalgorithm}
  \newcommand{\cftalgpresnum}{\bupt@label@algorithm~}
  \AtEndPreamble{%
    \newlength{\cftalgindent}
      \setlength{\cftalgindent}{1.5em}
    \newlength{\cftalgnumwidth}
      \setlength{\cftalgnumwidth}{2.3em}
    \newlength{\bupt@cftalgnumwidth@tmp}
      \settowidth{\bupt@cftalgnumwidth@tmp}{\cftalgpresnum}
    \addtolength{\cftalgnumwidth}{\bupt@cftalgnumwidth@tmp}
  }
  \newcommand*{\l@algorithm}{%
    \let\@cftbsnum \cftalgpresnum
    \@dottedtocline{1}{\cftalgindent}{\cftalgnumwidth}
  }
  \renewcommand{\listofalgorithms}{%
    \cleardoublepage%
    \pdfbookmark[0]{\listalgorithmname}{loa}%
    \chapter*{\listalgorithmname}%
    \@mkboth{\listalgorithmname}{\listalgorithmname}%
    \@starttoc{loa}
  }
  \AtBeginDocument{%
    \renewcommand{\thealgorithm}{\thechapter--\arabic{algorithm}}
  }
}
\bupt@atendpackage{listings}{
  \lstdefinestyle{lstStyleCode}{
    aboveskip=\medskipamount,
    belowskip=\medskipamount,
    basicstyle=\footnotesize\ttfamily,
    commentstyle=\slshape\color{black!60},
    stringstyle=\color{green!40!black!100},
    keywordstyle=\bfseries\color{blue!50!black},
    extendedchars=false,
    upquote=true,
    tabsize=2,
    showstringspaces=false,
    xleftmargin=1em,
    xrightmargin=1em,
    breaklines=true,
    breakindent=2em,
    framexleftmargin=1em,
    framexrightmargin=1em,
    backgroundcolor=\color{gray!10},
    columns=flexible,
    keepspaces=true,
    texcl=true,
    mathescape=true
  }
  \lstnewenvironment{codeblock}[1][]
    {\lstset{style=lstStyleCode,#1}}{}
}
\bupt@atendpackage{tikz}{
  \usetikzlibrary{shapes.geometric, arrows}
  \tikzstyle{startstop} = [
    rectangle,
    rounded corners,
    minimum width=2cm,
    minimum height=1cm,
    text centered,
    draw=black
  ]
  \tikzstyle{io} = [
    trapezium,
    trapezium left angle=75,
    trapezium right angle=105,
    minimum width=1cm,
    minimum height=1cm,
    text centered,
    draw=black
  ]
  \tikzstyle{process} = [
    rectangle,
    minimum width=2cm,
    minimum height=1cm,
    text centered,
    draw=black
  ]
  \tikzstyle{decision} = [
    diamond,
    minimum width=2cm,
    minimum height=1cm,
    text centered,
    draw=black]
  \tikzstyle{arrow} = [thick, ->, >=stealth]
}
\endinput
%%
%% End of file `buptthesis.cls'.
