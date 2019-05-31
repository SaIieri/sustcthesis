%
% South University of Science and Technology of China 
% or Southern University of Science and Technology(SUSTech) Thesis Template
%
% For Bachelor, Master and Doctor
%
% Modified from the ustcthesis.
%
%   Version
%       Beta
%   Created 
%       2014.03.26 by ywg@USTC
%   Last Modified
%       2014.08.29 by whzecomjm@SUSTC
%       2019.03.10 by Spacebody@SUSTech
%       2019.04.02 by liziwl@SUSTech

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{sustcthesis}[2014/08/26 SUSTCthesis document class. Created: 2014.03.26 by ywg@USTC, Last Modified: 2014.08.29 by whzecomjm@SUSTC, 2019.03.10 by Spacebody@SUSTech]

%Dew class options
\newif\ifsustc@basic\sustc@basicfalse
\newif\ifsustc@oldfontcfg\sustc@oldfontcfgfalse
\newif\ifsustc@master\sustc@masterfalse
\newif\ifsustc@doctor\sustc@doctorfalse
\newif\ifsustc@bachelor\sustc@bachelorfalse
\newif\ifsustc@adobefont\sustc@adobefontfalse
\newif\ifsustc@euler\sustc@eulerfalse
\newif\ifsustc@english\sustc@englishfalse

%Define new commands
\def\sustc@define@term#1{
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname sustc@#1\endcsname{##1}}
  \csname #1\endcsname{}}

\DeclareOption{basic}{\sustc@basictrue}

\DeclareOption{oldfontcfg}{\sustc@oldfontcfgtrue}
%Dissertation categories - use only one option at a time, never try to use more than one options.
\DeclareOption{master}{\sustc@mastertrue}
\DeclareOption{doctor}{\sustc@doctortrue}
\DeclareOption{bachelor}{\sustc@bachelortrue}
%For English and/or other language users
\DeclareOption{english}{\sustc@englishtrue}
%Use Euler math font
\DeclareOption{euler}{\sustc@eulertrue}


%Enhance compatibility
\DeclareOption{adobefonts}{\sustc@adobefonttrue\PassOptionsToClass{adobefonts}{ctexbook}}
\DeclareOption{adobefont}{\sustc@adobefonttrue\PassOptionsToClass{adobefonts}{ctexbook}}

%Pass all unprocessed/unknown options to ctexbook. If a wrong option is specified, perhaps ctexbook will throw an error.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions

%Minimum xeCJK version:3.2.10, date:2014/03/01
\PassOptionsToPackage{CJKchecksingle}{xeCJK}
%不再鼓励使用$$...$$的方式输入公式，可能会引起奇怪的问题
%如果一定要用$$...$$输入公式。请在更新到上述版本后加入PlainEquation选项。

\LoadClass[cs4size,a4paper,fancyhdr,fntef]{ctexbook}
      
%Check if extra pack should be used.
\ifsustc@basic\relax\else\input{sustcxtra.cls}\relax\fi

% Alter some LaTeX defaults for better treatment of figures:
% See p.105 of "TeX Unbound" for suggested values.
% See pp. 199-200 of Lamport's "LaTeX" book for details.
%   General parameters, for ALL pages:
\renewcommand{\topfraction}{0.9}	% max fraction of floats at top
\renewcommand{\bottomfraction}{0.8}	% max fraction of floats at bottom
%   Parameters for TEXT pages (not float pages):
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}     % 2 may work better
\setcounter{dbltopnumber}{2}    % for 2-column pages
\renewcommand{\dbltopfraction}{0.9}	% fit big float above 2-col. text
\renewcommand{\textfraction}{0.07}	% allow minimal text w. figs
%   Parameters for FLOAT pages (not text pages):
\renewcommand{\floatpagefraction}{0.7}	% require fuller float pages
% N.B.: floatpagefraction MUST be less than topfraction !!
\renewcommand{\dblfloatpagefraction}{0.7}	% require fuller float pages
%remember to use [htp] or [htpb] for placement

%Check if user has specified one dissertation option.
\ifsustc@master\relax\else
	\ifsustc@doctor\relax\else
		\ifsustc@bachelor\relax\else
			\ClassError{sustcthesis}{You have to specify one of thesis options: bachelor, master or doctor.}{}
		\fi
	\fi
\fi

%Ensure only one dissertation option is specified.
\newcommand\sustc@error{\ClassError{sustcthesis}{You can ONLY specify ONE KEY option: bachelor, master or doctor!}{}}
\ifsustc@doctor
	\ifsustc@master
		\sustc@error
	\else
		\ifsustc@bachelor
			\sustc@error
		\fi
	\fi
\else
	\ifsustc@master
		\ifsustc@bachelor
			\sustc@error
		\fi
	\fi
\fi
	
%load basic packages
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
\RequirePackage{titletoc}
\RequirePackage{titlesec}
\RequirePackage[
	left=3.0cm,
	right=2.5cm,
	top=2.50cm,
	bottom=2.00cm,
	headsep=0.25cm,
	headheight=1.5cm,
	footskip=0.79cm,
%	showframe%uncomment this if you want to check the page setup.
	]{geometry}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{hyperref}
\pdfstringdefDisableCommands{\def\and{and }}
\hypersetup{
	CJKbookmarks=true,%
	bookmarksnumbered=true,%
	bookmarksopen=true,
	breaklinks=true,
	colorlinks=true,%
	linkcolor=black,%
	citecolor=black,%
	plainpages=false,%
	pdfstartview=FitH,}
\AtBeginDocument{\hypersetup{%
	pdftitle={\sustc@entitle},%
	pdfauthor={\sustc@enauthor},%
	pdfkeywords={},%Either put keywords here or not, as you wish.
	pdfcreator={LaTeX using SUSTC LaTeX Thesis Template for Bachelor, created by whzecomjm}}}
\RequirePackage[numbers,sort&compress,square]{natbib}
\def\bibfont{\wuhao}
\setlength{\bibsep}{0pt plus1pt minus1pt}
\setlength{\bibhang}{2\ccwd}%Applied only to author-year style
\RequirePackage{caption}
%\RequirePackage[format=hang,labelsep=quad]{caption}
\DeclareCaptionFont{c5size}{\wuhao}
\captionsetup{labelfont={c5size,bf}}
\captionsetup{textfont=c5size}

%Chinese font size
\newcommand{\chuhao}    {\fontsize{42pt}   {\baselineskip}\selectfont}
\newcommand{\xiaochu}   {\fontsize{36pt}   {\baselineskip}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36pt}   {\baselineskip}\selectfont}
\newcommand{\yihao}     {\fontsize{28pt}   {\baselineskip}\selectfont}
\newcommand{\erhao}     {\fontsize{21pt}   {\baselineskip}\selectfont}
\newcommand{\xiaoer}    {\fontsize{18pt}   {\baselineskip}\selectfont}
\newcommand{\xiaoerhao} {\fontsize{18pt}   {\baselineskip}\selectfont}
\newcommand{\sanhao}    {\fontsize{15.75pt}{\baselineskip}\selectfont}
\newcommand{\xiaosan}   {\fontsize{15pt}   {\baselineskip}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15pt}   {\baselineskip}\selectfont}
\newcommand{\sihao}     {\fontsize{14pt}   {\baselineskip}\selectfont}
\newcommand{\xiaosi}    {\fontsize{12pt}   {\baselineskip}\selectfont}
\newcommand{\xiaosihao} {\fontsize{12pt}   {\baselineskip}\selectfont}
\newcommand{\wuhao}     {\fontsize{10.5pt} {\baselineskip}\selectfont}
\newcommand{\xiaowu}    {\fontsize{9pt}    {\baselineskip}\selectfont}
\newcommand{\xiaowuhao} {\fontsize{9pt}    {\baselineskip}\selectfont}
\newcommand{\liuhao}    {\fontsize{7.875pt}{\baselineskip}\selectfont}
\newcommand{\qihao}     {\fontsize{5.25pt} {\baselineskip}\selectfont}

%Define font for vertical typesetting.
\ifsustc@adobefont
	\setCJKfamilyfont{verthei}[RawFeature={vertical:}]{Adobe Heiti Std}\relax
\else%
	\setCJKfamilyfont{verthei}[RawFeature={vertical:}]{SimHei}\relax
\fi
\newcommand{\sustc@verthei}{\CJKfamily{verthei}}

%Set section numbering to subsubsection
\setcounter{secnumdepth}{3}
%Set numbering style to X.X
\numberwithin{equation}{chapter}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}

%Title setup
\CTEXsetup[format={\centering}]{chapter}%规定16pt，三号为15.75pt
\CTEXsetup[nameformat={\bfseries\sanhao}]{chapter}
\CTEXsetup[titleformat={\bfseries\sanhao}]{chapter}
\CTEXsetup[beforeskip={0pt}]{chapter}
\CTEXsetup[afterskip={18pt}]{chapter}
\CTEXsetup[format={\flushleft\bfseries\sihao}]{section}%规定14pt，即四号
\CTEXsetup[format={\flushleft\bfseries\fontsize{13pt}\baselineskip}]{subsection}%规定13pt
\CTEXsetup[format={\flushleft\bfseries\xiaosihao}]{subsubsection}%规定12pt，即小四号
\ifsustc@english
	\CTEXsetup[name={Part\space,}]{part}
	\CTEXsetup[name={Chapter\space,}]{chapter}
	\CTEXsetup[number={\Roman{part}}]{part}
	\CTEXsetup[number={\arabic{chapter}}]{chapter}
	\CTEXsetup[name={Appendix\space}]{appendix}
	\CTEXoptions[contentsname={Table of Contents}]
	\CTEXoptions[listfigurename={List of Figures}]
	\CTEXoptions[listtablename={List of Tables}]
	\CTEXoptions[figurename={Figure}]
	\CTEXoptions[tablename={Table}]
	\CTEXoptions[indexname={Indexes}]
	\CTEXoptions[bibname={References}]
\else
	\relax
\fi

%Define new commands for List of Figures/Tables
\sustc@define@term{sustclofname}
\sustc@define@term{sustclotname}
\ifsustc@english
	\sustclofname{List of Figures}
	\sustclotname{List of Tables}
\else
	\sustclofname{插图索引}
	\sustclotname{表格索引}
\fi
\CTEXoptions[listfigurename={\sustc@sustclofname}]
\CTEXoptions[listtablename={\sustc@sustclotname}]
\newcommand\sustclot{\cleardoublepage\addcontentsline{toc}{chapter}{\sustc@sustclotname}\listoftables}
\newcommand\sustclof{\cleardoublepage\addcontentsline{toc}{chapter}{\sustc@sustclofname}\listoffigures}

%New mathematical environments
\ifsustc@english
	\newtheorem{theorem}{\textbf{Theorem}}[section]
	\newtheorem{lemma}{\textbf{Lemma}}[section]
	\newtheorem{example}{\textbf{Example}}[section]
	\newtheorem{definition}{\textbf{Definition}}[section]
	\newtheorem{axiom}{\textbf{Axiom}}[section]
	\newtheorem{property}{\textbf{Property}}[section]
	\newtheorem{proposition}{\textbf{Proposition}}[section]
	\newtheorem{corollary}{\textbf{Corollary}}[section]
	\newtheorem{remark}{\textbf{Remark}}[section]
	\newtheorem{condition}{\textbf{Condition}}[section]
	\newtheorem{conclusion}{\textbf{Conclusion}}[section]
	\newtheorem{assumption}{\textbf{Assumption}}[section]
	\newtheorem{prove}{\textbf{Prove}}[section]
	\renewcommand{\proofname}{Proof}
	\renewcommand\appendixname{Appendix}
	%New autorefname
	\def\equationautorefname{Equation}
	\def\footnoteautorefname{Footnote}
	\def\itemautorefname{Item}
	\def\figureautorefname{Figure}
	\def\subfigureautorefname{Figure}
	\def\tableautorefname{Table}
	\def\partautorefname{Part}
	\def\appendixautorefname{Appendix}
	\def\chapterautorefname{Chapter}
	\def\sectionautorefname{Section}
	\def\subsectionautorefname{Subsection}
	\def\theoremautorefname{Theorem}
	\def\assumptionautorefname{Assumption}
	\def\propertyautorefname{Property}
\else
	\newtheorem{theorem}{\textbf{\hspace{0.7cm}定理}}[section]
	\newtheorem{lemma}{\textbf{\hspace{0.7cm}引理}}[section]
	\newtheorem{example}{\textbf{\hspace{0.7cm}例}}[section]
	\newtheorem{definition}{\textbf{\hspace{0.7cm}定义}}[section]
	\newtheorem{axiom}{\textbf{\hspace{0.7cm}公理}}[section]
	\newtheorem{property}{\textbf{\hspace{0.7cm}性质}}[section]
	\newtheorem{proposition}{\textbf{\hspace{0.7cm}命题}}[section]
	\newtheorem{corollary}{\textbf{\hspace{0.7cm}推论}}[section]
	\newtheorem{remark}{\textbf{\hspace{0.7cm}注解}}[section]
	\newtheorem{condition}{\textbf{\hspace{0.7cm}条件}}[section]
	\newtheorem{conclusion}{\textbf{\hspace{0.7cm}结论}}[section]
	\newtheorem{assumption}{\textbf{\hspace{0.7cm}假设}}[section]
	\newtheorem{prove}{\textbf{\hspace{0.7cm}证明}}[section]
	\renewcommand{\proofname}{证明}
	\renewcommand\appendixname{附录}
	%New autorefname
	\def\equationautorefname{式}
	\def\footnoteautorefname{脚注}
	\def\itemautorefname{项}
	\def\figureautorefname{图}
	\def\subfigureautorefname{图}
	\def\tableautorefname{表}
	\def\partautorefname{篇}
	\def\appendixautorefname{附录}
	\def\chapterautorefname{章}
	\def\sectionautorefname{节}
	\def\subsectionautorefname{小节}
	\def\theoremautorefname{定理}
	\def\assumptionautorefname{假设}
	\def\propertyautorefname{性质}
\fi

%Line and par setup
%It seems unnecessary since CTeX has already set the \baselinestretch etc.
%\renewcommand\baselinestretch{1.4}
\newcommand\sustc@underline[2][6em]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}
\setlength{\parskip}{0pt plus3pt minus0pt}%{1ex plus1.5ex minus0.5ex}%{0.5\baselineskip}%{1.5pt plus1pt minus1pt}
\setlength{\parindent}{2\ccwd}
%\setlength{\parskip}{3pt plus1pt minus2pt}
%\setlength{\baselineskip}{22pt plus1pt minus1pt}
%\setlength{\textheight}{21true cm}
%\setlength{\headsep}{1 cm}
%\setlength{\textwidth}{14.5true cm} 
%\setlength{\belowcaptionskip}{5pt}

%Title page setup
\newcommand\SUSTCHUGE{\fontsize{56}{67.2}\selectfont}%中文扉页第二行
\newcommand\SUSTCHuge{\fontsize{30}{40}\selectfont}%中文扉页第二行
\newcommand\SUSTCLARGE{\fontsize{26}{30}\selectfont}%英文扉页第二行
\newcommand\SUSTCLarge{\fontsize{20}{30}\selectfont}%英文扉页第一行
\newcommand\SUSTCTspace{\protect\CTEX@spaceChar}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

% !! Never try to set this value greater than 0.7.
% !! This value has already set previously. So, leave it here as a reminder.
%\renewcommand{\floatpagefraction}{0.80}

%Information used for title page and book spine
\renewcommand\title[1]{\def\sustc@title{#1}}
\renewcommand\author[1]{\def\sustc@author{#1}}
\sustc@define@term{advisor}
\sustc@define@term{coadvisor}
\sustc@define@term{major}%硕士博士论文适用专业全称，不可用缩写。本科论文不需要此项 Not used in bachelor thesis. For master and doctor thesis, use full name -- NEVER use abbr. 
\sustc@define@term{submitdate}
\sustc@define@term{depart}%硕士博士论文用院系代号，仅用于书脊。本科论文用院系全称，仅用于扉页 For bachelor use full name(only used in title page). Currently unused for master and doctor

%English
\sustc@define@term{entitle}
\sustc@define@term{enauthor}
\sustc@define@term{enadvisor}
\sustc@define@term{encoadvisor}
\sustc@define@term{encoadvisorsec}
\sustc@define@term{ensubmitdate}
\sustc@define@term{enmajor}
\sustc@define@term{endepart}%本科论文用院系全称，仅用于扉页。硕博暂时没有用 For bachelor use full name(only used in title page). Currently unused for master and doctor

%Other language strings
\sustc@define@term{othersustcstr}%A translation of `University of Science and Technology of China' in your language
\sustc@define@term{otherthesisstr}%A translation of `A dissertation for doctor's degree' in your language
\sustc@define@term{otherauthorstr}%A translation of `Author' in your language
\sustc@define@term{otherdepartmentstr}%A translation of `Department' in your language
\sustc@define@term{otherstudentidstr}%A translation of `Student ID' in your language
\sustc@define@term{othersupervisorstr}%A translation of `Supervisor' in your language
\sustc@define@term{otherfinishedtimestr}%A translation of `Finished Time' in your language
\sustc@define@term{otherspecialitystr}%A translation of `Speciality' in your language
\sustc@define@term{othertitle}
\sustc@define@term{otherauthor}
\sustc@define@term{otheradvisor}
\sustc@define@term{othercoadvisor}
\sustc@define@term{othersubmitdate}
\sustc@define@term{othermajor}
\sustc@define@term{otherdepart}%本科论文用院系全称，仅用于扉页。硕博暂时没有用 For bachelor use full name(only used in title page). Currently unused for master and doctor
\sustc@define@term{studentid}%学号，仅本科论文 Student ID, only for bachelor
\sustc@define@term{spinetitle}%书脊使用的标题，当title里含有控制字符时使用此命令输入文本标题 Use this command to generate spine when there are some control commands in \title{}
\sustc@define@term{covertitle}%封皮使用的标题，当title里存在强制换行导致标题超过了三行时，或者存在其他特殊情况时，请使用此命令输入封皮的标题。根据制本厂的规定，封皮标题最多两行。
\sustc@define@term{encovertitle}%本科专用。封皮使用的英文标题，当entitle里存在强制换行导致标题超过了四行时，或者存在其他特殊情况时，请使用此命令输入封皮的英文标题。根据制本厂的规定，封皮英文标题最多三行。



\RequirePackage{subfiles}
\RequirePackage{xparse}
\DeclareDocumentCommand{\makecover}{ O{17pt} O{17pt} }{\make@bookspine{#1}{#2}}

\renewcommand\maketitle{
\make@entitle
\make@cntitle %   If you need a chinese title, please remove this "%" sign!
	\ifsustc@english
		\ifx\sustc@othertitle\@empty
			\relax
		\else
			\make@othertitle
		\fi
	\fi
	\ifsustc@bachelor
		\relax
	\else
		\make@authorization
	\fi}

%Chinese title page
\newcommand\make@cntitle{%
  \newgeometry{%
  top=2.5cm,
  bottom=2.0cm,
  left=3.0cm,
  right=2.5cm
  }
  \pdfbookmark[-1]{\sustc@title}{title}
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}

  \setlength\tabcolsep{0pt}
  \begin{tabular}{llcr}
  分类号&\underline{\hspace{2cm}}&\qquad\qquad\qquad\qquad\qquad\qquad\qquad\qquad\qquad\qquad\qquad&编\ 号\underline{\hspace{2cm}}\\
  U\ D\ C &\underline{\hspace{2cm}}&\qquad\qquad\qquad\qquad\qquad\qquad\qquad\qquad\qquad\qquad\qquad&密\ 级\quad$\Box$ Yes\quad$\Box$ No
  \end{tabular}
   \vskip 0.5cm
      \includegraphics[scale=0.9]{SUSTech_Logo.pdf}
  \vskip -2.0cm
    \bfseries\SUSTCHUGE\ifsustc@doctor
      {博士学位论文}
    \else\ifsustc@master
      {硕士学位论文}  
    \else
      \xiaochu{本科生毕业设计（论文）}
    \fi\fi\\
    \vskip 1.0cm
    \renewcommand{\baselinestretch}{0.7}
     \bfseries\erhao\textbf{题\ 目}: \sustc@title
  \end{center}
 \vskip 1.0cm%0.6cm 0.7cm 2.3cm
  \begin{center}
  {\sanhao
  \ifsustc@bachelor
  \begin{tabular}{rc}%
    \specialrule{0em}{0pt}{0pt}
	  \bfseries{姓\hspace{2\ccwd}名：} & \sustc@underline[6cm]{\sustc@author}\\
     \\[-1em]
    \bfseries{学\hspace{2\ccwd}号：} & \sustc@underline[6cm]{\sustc@studentid}\\
     \\[-1em]
    \bfseries{系\hspace{2\ccwd}别：} & \sustc@underline[6cm]{\sustc@depart}\\
     \\[-1em]
    \bfseries{专\hspace{2\ccwd}业：} & \sustc@underline[6cm]{\sustc@major}\\
     \\[-1em]
	  \bfseries{指导老师：} & \sustc@underline[6cm]{\sustc@advisor}
  \end{tabular}
    \vskip 2.8cm
      \sustc@submitdate
  \else	\begin{tabular}{lc}%
	  \bfseries{作者姓名：} & \sustc@underline[6cm]{\sustc@author}\\
	  \bfseries{学科专业：} & \sustc@underline[6cm]{\sustc@major}\\
	  \bfseries{导师姓名：} & \sustc@underline[6cm]{\sustc@advisor}\\
	  \ifx\sustc@coadvisor\@empty\else
	                        & \sustc@underline[6cm]{\sustc@coadvisor}\\\fi
	  \bfseries{完成时间：} & \sustc@underline[6cm]{\sustc@submitdate}
	\end{tabular}
  \fi}
  \end{center}
  \clearpage
  \restoregeometry
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

%English title page
\newcommand\make@entitle{%
  \newgeometry{%
  top=2.5cm,
  bottom=2.0cm,
  left=3.0cm,
  right=2.5cm
  }
  \pdfbookmark{Cover Page}{etitle}
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}

  \begin{tabular}{lr}CLC\underline{\hspace{2cm}}\qquad\qquad\qquad\qquad\qquad\qquad\qquad\qquad &Number\underline{\hspace{2cm}}\\ 
  UDC\underline{\hspace{2cm}}&Available for reference\quad$\Box$ Yes\quad$\Box$ No
  \end{tabular}\vspace*{0.8cm}

    \vskip 1.0cm %1.25cm
      \includegraphics[scale=0.7]{SUSTech_Logo_en.pdf}
    \vskip 0.5cm %2.4cm
    \SUSTCHuge{\ttfamily\ifsustc@doctor
      {A Dissertation for Doctor's Degree}
    \else\ifsustc@master
      {A Dissertation for Master's Degree}
    \else
      \xiaochu{Undergraduate Thesis}
    \fi\fi}\\
    \renewcommand{\baselinestretch}{1}
    \vskip 2.0cm  
    \bfseries\erhao\textbf{Thesis Title}: \sustc@entitle
  \end{center}
  \vskip 1.0cm %1.8cm 2cm 3.1cm
  \begin{center}
  {\sanhao
  \ifsustc@bachelor
	  \begin{tabular}{rc}
    \specialrule{0em}{0pt}{0pt}
	  	\textbf{Student Name}:& \sustc@underline[8cm]{\sustc@enauthor}\\
      \\[-1em]
	  	\textbf{Student ID}:& \sustc@underline[8cm]{\sustc@studentid}\\
      \\[-1em]	 
	  	\textbf{Department}:& \sustc@underline[8cm]{\sustc@endepart}\\
      \\[-1em]
	  	\textbf{Program}:& \sustc@underline[8cm]{\sustc@enmajor}\\
      \\[-1em]
		  \textbf{Thesis Advisor}:& \sustc@underline[8cm]{\sustc@enadvisor}
	  \end{tabular}
    \vskip 2.8cm
      Date: \sustc@ensubmitdate
  \else
	  \begin{tabular}{lc}
	  	Author :& \sustc@underline[6cm]{\sustc@enauthor}\\
	  	Speciality :& \sustc@underline[6cm]{\sustc@enmajor}\\
	  	Supervisor :& \sustc@underline[6cm]{\sustc@enadvisor}\\
		\ifx\sustc@encoadvisor\@empty\else
	                     & \sustc@underline[6cm]{\sustc@encoadvisor}\\
	    \fi
	  	Finished Time :& \sustc@underline[6cm]{\sustc@ensubmitdate}
	  \end{tabular}
  \fi}
  \end{center}
  \clearpage
  \restoregeometry
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

%Other language title page
\newcommand\make@othertitle{%
  \newgeometry{%
  top=2.5cm,
  bottom=2.5cm,
  left=3.0cm,
  right=2.5cm
  }
  %\pdfbookmark{英文标题}{etitle}
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{0cm}
      \SUSTCLarge{\ttfamily{\sustc@othersustcstr}}
    \vskip -0.2cm %-0.6cm
    \SUSTCLARGE{\ttfamily\sustc@otherthesisstr}
    \vskip 1.5cm %1.25cm
      \includegraphics[width=4.7cm]{sustc_logo_fig.png}
    \vskip 1.5cm %2.4cm
      \renewcommand{\baselinestretch}{1}
      \bfseries\yihao\sustc@othertitle
  \end{center}
  \vskip 1.0cm %1.8cm 2cm 3.1cm
  \begin{center}
  {\sanhao
  \ifsustc@bachelor
	  \begin{tabular}{lc}
	  	\sustc@otherauthorstr :& \sustc@underline[6cm]{\sustc@otherauthor}\\
	  	\sustc@otherdepartmentstr :& \sustc@underline[6cm]{\sustc@otherdepart}\\
	  	\sustc@otherstudentidstr :& \sustc@underline[6cm]{\sustc@studentid}\\
		\sustc@othersupervisorstr :& \sustc@underline[6cm]{\sustc@otheradvisor}\\
		\ifx\sustc@encoadvisor\@empty\else
	                     & \sustc@underline[6cm]{\sustc@othercoadvisor}\\
	    \fi
	  	\sustc@otherfinishedtimestr :& \sustc@underline[6cm]{\sustc@othersubmitdate}
	  \end{tabular}
  \else
	  \begin{tabular}{lc}
	  	\sustc@otherauthorstr :& \sustc@underline[6cm]{\sustc@otherauthor}\\
	  	\sustc@otherspecialitystr :& \sustc@underline[6cm]{\sustc@othermajor}\\
	  	\sustc@othersupervisorstr :& \sustc@underline[6cm]{\sustc@otheradvisor}\\
		\ifx\sustc@othercoadvisor\@empty\else
	                     & \sustc@underline[6cm]{\sustc@othercoadvisor}\\
	    \fi
	  	\sustc@otherfinishedtimestr :& \sustc@underline[6cm]{\sustc@othersubmitdate}
	  \end{tabular}
  \fi}
  \end{center}
  \clearpage
  \restoregeometry
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

%Cover page and book spine for bachelor, master and doctor
\newcommand{\cover@cnfontsize}{\relax}
\newcommand{\cover@enfontsize}{\relax}
\newcommand{\cover@defaultfontsize}{\fontsize{17pt}{\baselineskip}\selectfont}
\newlength{\cover@cnvoffset}
\newlength{\cover@cnhoffset}
\newlength{\cover@envoffset}
\newlength{\cover@enhoffset}
\newlength{\cover@cntitleh}
\newlength{\cover@entitleh}
\newcommand{\c@scn}[4]{
  \def\c@s@default{17pt}
  \def\c@s@var{#1}
  \ifx\c@s@var\c@s@default\renewcommand{\cover@cnfontsize}{\cover@defaultfontsize}\else\renewcommand{\cover@cnfontsize}{\zihao{#1}}\fi
  \setlength{\cover@cnvoffset}{#2}
  \setlength{\cover@cnhoffset}{#3}
  \setlength{\cover@cntitleh}{#4}}
\newcommand{\c@sen}[4]{
  \def\c@s@default{17pt}
  \def\c@s@var{#1}
  \ifx\c@s@var\c@s@default\renewcommand{\cover@enfontsize}{\cover@defaultfontsize}\else\renewcommand{\cover@enfontsize}{\zihao{#1}}\fi
  \setlength{\cover@envoffset}{#2}
  \setlength{\cover@enhoffset}{#3}
  \setlength{\cover@entitleh}{#4}}

\newcommand\make@bookspine[2]{
  \def\cover@varcn{#1}
  \def\cover@varen{#2}
  \def\cover@san{3}
  \def\cover@ssan{-3}
  \def\cover@si{4}
  \def\cover@ssi{-4}
  \def\cover@wu{5}
  \def\cover@swu{-5}

  \ifsustc@bachelor%cover page for bachelor
    \ifx\cover@varcn\cover@san\c@scn{#1}{0mm}{-8.5mm}{1.6cm}\else
      \ifx\cover@varcn\cover@ssan\c@scn{#1}{0.5mm}{-8.5mm}{1.55cm}\else
        \ifx\cover@varcn\cover@si\c@scn{#1}{1mm}{-8.5mm}{1.5cm}\else
          \ifx\cover@varcn\cover@ssi\c@scn{#1}{1.5mm}{-8.5mm}{1.45cm}\else
            \ifx\cover@varcn\cover@wu\c@scn{#1}{2mm}{-8.5mm}{1.4cm}\else
              \ifx\cover@varcn\cover@swu\c@scn{#1}{2.5mm}{-8.5mm}{1.35cm}\else
                \c@scn{17pt}{0mm}{-0.85cm}{1.6cm}
              \fi
            \fi
          \fi
        \fi
      \fi       
    \fi
    \ifx\cover@varen\cover@san\c@sen{#2}{5mm}{0mm}{2.55cm}\else
      \ifx\cover@varen\cover@ssan\c@sen{#2}{5.5mm}{0mm}{2.5cm}\else
        \ifx\cover@varen\cover@si\c@sen{#2}{6mm}{0mm}{2.45cm}\else
          \ifx\cover@varen\cover@ssi\c@sen{#2}{6.5mm}{0mm}{2.4cm}\else
            \ifx\cover@varen\cover@wu\c@sen{#2}{7mm}{0mm}{2.35cm}\else
              \ifx\cover@varen\cover@swu\c@sen{#2}{7.5mm}{0mm}{2.3cm}\else
                \c@sen{17pt}{4.5mm}{0mm}{2.6cm}
              \fi
            \fi
          \fi
        \fi
      \fi       
    \fi
    % \newgeometry{top=17.4cm,bottom=1.1cm,left=6cm,right=5.5cm}
    \newgeometry{top=2.5cm,bottom=2.0cm,left=3.0cm,right=2.5cm}
    \clearpage
    \thispagestyle{empty}
    \rule{0mm}{0mm}\vskip\cover@cnvoffset\hspace{\cover@cnhoffset}
    \begin{minipage}[c]{9.7cm}
      \begin{minipage}[c][\cover@cntitleh][s]{9.5cm}
	    \centering\bfseries\cover@cnfontsize\baselineskip=1\baselineskip plus 1fill\lineskip=0pt plus 1fill
        \ifx\sustc@covertitle\@empty\sustc@title\else\sustc@covertitle\fi
      \end{minipage}\vskip\cover@envoffset\hskip\cover@enhoffset
      \begin{minipage}[c][\cover@entitleh][s]{9.5cm}
	    \centering\bfseries\cover@enfontsize\baselineskip=1\baselineskip plus 1fill\lineskip=0pt plus 1fill
        \ifx\sustc@encovertitle\@empty\sustc@entitle\else\sustc@encovertitle\fi
      \end{minipage}\vskip 0.5cm\hskip 0cm
      \begin{minipage}[c][1.5cm][s]{9.5cm}
	    \centering\bfseries\cover@defaultfontsize\sustc@depart
      \end{minipage}\vskip -0.5cm\hskip 0cm
      \begin{minipage}[c][1.5cm][s]{9.5cm}
        \centering\bfseries\cover@defaultfontsize\sustc@author\hfil\sustc@studentid
      \end{minipage}\vskip -0.5cm\hskip 0cm
      \begin{minipage}[c][1.5cm][s]{9.5cm}
        \centering\bfseries\cover@defaultfontsize\sustc@advisor\ifx\sustc@coadvisor\@empty\else\quad\sustc@coadvisor\fi
      \end{minipage}\vskip -0.5cm\hskip 0cm
      \begin{minipage}[c][1.5cm][s]{9.5cm}
        \centering\bfseries\cover@defaultfontsize\sustc@submitdate
      \end{minipage}
    \end{minipage}
  \else
    \ifx\cover@varcn\cover@san\c@scn{#1}{-7.3cm}{6.2cm}{1.5cm}\else
      \ifx\cover@varcn\cover@ssan\c@scn{#1}{-7.3cm}{6.2cm}{1.5cm}\else
        \ifx\cover@varcn\cover@si\c@scn{#1}{-7.2cm}{6.2cm}{1.4cm}\else
          \ifx\cover@varcn\cover@ssi\c@scn{#1}{-7.2cm}{6.2cm}{1.4cm}\else
            \ifx\cover@varcn\cover@wu\c@scn{#1}{-7.1cm}{6.2cm}{1.3cm}\else
              \ifx\cover@varcn\cover@swu\c@scn{#1}{-7.1cm}{6.2cm}{1.3cm}\else
                \c@scn{17pt}{-7.4cm}{6.2cm}{1.5cm}
              \fi
            \fi
          \fi
        \fi
      \fi       
    \fi
    \c@sen{17pt}{0cm}{0cm}{10cm}
    % \newgeometry{top=2cm,bottom=2cm,left=1.2cm,right=19.5cm}
    \newgeometry{top=2.5cm,bottom=2.0cm,left=3.0cm,right=2.5cm}
    \clearpage
    \thispagestyle{empty}
    \begin{flushleft}
      \rotatebox{-90}{\makebox[23.7cm][c]{\ziju{0.17}\sustc@verthei\zihao{-4}{\ifx\sustc@spinetitle\@empty\sustc@title\else\sustc@spinetitle\fi\hfil\hfil\sustc@depart\hfil\hfil\sustc@author\hfil\hfil{}南方科技大学}}}
    \end{flushleft}
    \vspace{\cover@cnvoffset}\hspace{\cover@cnhoffset}
    \begin{minipage}[c]{12.2cm}
      \begin{minipage}[c][\cover@cntitleh][s]{12cm}
	    \centering\bfseries\cover@cnfontsize\baselineskip=1\baselineskip plus 1fill\lineskip=0pt plus 1fill
        \ifx\sustc@covertitle\@empty\sustc@title\else\sustc@covertitle\fi
      \end{minipage}\vskip 0.6cm\hskip 0cm
      \begin{minipage}[c][1.5cm][s]{12cm}
	    \centering\bfseries\cover@defaultfontsize\sustc@author
      \end{minipage}\vskip -0.6cm\hskip 0cm
      \begin{minipage}[c][1.5cm][s]{12cm}
        \centering\bfseries\cover@defaultfontsize\sustc@major
      \end{minipage}\vskip -0.6cm\hskip 0cm
      \begin{minipage}[c][1.5cm][s]{12cm}
        \centering\bfseries\cover@defaultfontsize\sustc@advisor\ifx\sustc@coadvisor\@empty\else\quad\sustc@coadvisor\fi
      \end{minipage}\vskip -0.6cm\hskip 0cm
      \begin{minipage}[c][1.5cm][s]{12cm}
        \centering\bfseries\cover@defaultfontsize\sustc@submitdate
      \end{minipage}
    \end{minipage}
  \fi
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \else
    \clearpage  
  \fi
  \restoregeometry
}

%Define head rule
\newcommand{\makeheadrule}{%
    \rule[.7\baselineskip]{\headwidth}{1.2pt}\vskip-0.97\baselineskip%
    \rule[.6\baselineskip]{\headwidth}{0.4pt}}%
\renewcommand{\headrule}{%
    {\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi}%
     \makeheadrule}



%Define page style
\fancypagestyle{plain}{}
\pagestyle{fancy}
  \fancyhf{}
  \ifsustc@bachelor\fancyhead[C]{\xiaowuhao{SUSTech's Dissertation for Bachelor's Degree}}\relax\else\fancyhead[C]{\small \nouppercase\leftmark}\fi
  \renewcommand{\headrulewidth}{0.7pt}

\renewcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}
  \fancyfoot{}
  \fancyfoot[C]{\small \thepage}}

  \renewcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}
  \fancyfoot{}
  \fancyfoot[C]{\small \thepage}}


%Abstracts and thanks
\newcommand{\sustc@enabstractname}{[ABSTRACT]}
\newcommand{\sustc@cnabstractname}{[摘\rule{\ccwd}{0pt}要]}


\ifsustc@english
	\newcommand{\sustc@thanksname}{Acknowledgements}
\else
	\newcommand{\sustc@thanksname}{致\rule{\ccwd}{0pt}谢}
\fi

\newcommand\keywords[1]{%
  \vspace{3.5ex}\noindent{\bfseries [关键词]：~} #1}
\newcommand\enkeywords[1]{%
  \vspace{3.5ex}\noindent{\bf [Keywords]:~} #1}
\newenvironment{cnabstract}
  {\ifsustc@bachelor\chapter{\texorpdfstring{\sustc@cnabstractname}{摘要}}\else\chapter[\texorpdfstring{\sustc@cnabstractname}{摘要}]{\protect\vskip-10pt\sustc@cnabstractname}\fi}
  {}
\newenvironment{enabstract}
  {\ifsustc@bachelor\chapter{\texorpdfstring{\sustc@enabstractname}{ABSTRACT}}\else\chapter[\texorpdfstring{\sustc@enabstractname}{ABSTRACT}]{\protect\vskip-10pt\sustc@cnabstractname}\fi}
  {}
\renewenvironment{thanks}
  {\ifsustc@bachelor\chapter[\texorpdfstring{\sustc@thanksname}{\ifsustc@english{}Acknowledgements\else{}致谢\fi}]{\protect\vskip-10pt\sustc@thanksname}\else\chapter{\texorpdfstring{\sustc@thanksname}{\ifsustc@english{}Acknowledgements\else{}致谢\fi}}\fi}
  {}



%tableofcontents
\ifsustc@english
	\renewcommand{\contentsname}{Contents}
\else
	\renewcommand{\contentsname}{\texorpdfstring{目\rule{\ccwd}{0pt}录}{目录}}
\fi
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter[\contentsname]{\protect\vskip-10pt\contentsname}%
    \renewcommand{\baselinestretch}{1}
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
%% tableofcontent
\titlecontents{chapter}[0em]
  {\vspace{6bp}\sihao}%14pt，如果希望美观一些，可以无视章节标题用宋体的规定，自行添加\bfseries
  {\thecontentslabel\hspace*{0.5em}}
  {}
  {\titlerule*[0.5pc]{$\cdot$}\contentspage}
\titlecontents{section}[1.1\ccwd]
  {\vspace{1bp} \xiaosi}
  {\thecontentslabel\hspace*{0.5em}}
  {}
  {\titlerule*[0.5pc]{$\cdot$}\contentspage}
\titlecontents{subsection}[2.5\ccwd]%原来是2.3
  {\vspace{1bp} \wuhao}%规定三级标题是10.5pt
  {\thecontentslabel\hspace*{0.5em}}
  {}
 {\titlerule*[0.5pc]{$\cdot$}\contentspage}



\renewcommand{\bibsection}{
  \chapter{\bibname}
\renewcommand{\baselinestretch}{0.8}
  %\setlength{\linestretch}{1.0}
  \xiaowu%%\small
  %\linespread{1.36}
  \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}}
%\setlength{\bibsep}{0ex}
\let\OLDappendix\appendix
\newif\if@appendixinbackmatter
\renewenvironment{appendix}
{
  \if@mainmatter
     \@appendixinbackmatterfalse\OLDappendix
  \else
      \@appendixinbackmattertrue\@mainmattertrue\OLDappendix
  \fi
	\renewcommand\chaptername{\appendixname~\thechapter}}
  {\if@appendixinbackmatter\@mainmatterfalse\fi
}



\endinput
%%
%% End of file `SUSTCthesis.cls'.
