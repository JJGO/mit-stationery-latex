\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mitletter1}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions
\LoadClass{letter}
\usepackage[dvips]{graphics}
\usepackage[businessenvelope]{envlab}

\usepackage{color}
\usepackage[usenames,dvipsnames,svgnames,table]{xcolor}
\definecolor{mitred}{RGB}{128,0,0}


\raggedright
\setlength{\topmargin}{-1in}
\setlength{\oddsidemargin}{.25in}
\setlength{\evensidemargin}{.25in}
\setlength{\textwidth}{6.5in}
\setlength{\textheight}{8in}
\setlength{\headsep}{1in}
\setlength{\footskip}{1.625in}

\DeclareFixedFont{\boldfont}{OT1}{cmss}{bx}{n}{8}
\DeclareFixedFont{\regularfont}{OT1}{cmss}{m}{n}{8}
\DeclareFixedFont{\boldfontb}{OT1}{cmss}{bx}{n}{9}
\DeclareFixedFont{\regularfontb}{OT1}{cmss}{m}{n}{9}
\DeclareFixedFont{\italicfont}{OT1}{cmr}{m}{it}{10}


\renewcommand{\ps@headings}{% 
  \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@oddhead{\slshape\headtoname{} \ignorespaces\toname
                    \@date
                    \hfil \pagename{} \thepage}%
      \let\@evenhead\@oddhead}
\renewcommand*{\opening}[1]{\ifx\@empty\fromaddress
  \thispagestyle{firstpage}%
    \@date\\%
  \else  % home address
    \thispagestyle{empty}%
    {\raggedleft\begin{tabular}{l@{}}\ignorespaces
      \fromaddress \\*[2\parskip]%
      \@date \end{tabular}\par}%
  \fi
  \vspace{2\parskip}%
  {\raggedright \toname \\ \toaddress \par}%
  \vspace{2\parskip}%
  #1\par\nobreak\reversemarginpar\marginpar{\hspace*{.35in}\raisebox{.2in}{\scalebox{.33}{\includegraphics*{mitlogo-clr.eps}}}\normalmarginpar}}
\renewcommand*{\signature}[1]{\def\fromsig{\italicfont #1}}
\newcommand{\officename}{Office Name}
\newcommand{\associateofficename}{Associate Office Name}
\newcommand{\roomnumber}{X00-000}
\newcommand{\phonenum}{617.000.0000}
\newcommand{\faxnum}{617.000.0000}
\newcommand{\website}{web.mit.edu/abcdefghijk}
\newcommand{\email}{user@mit.edu}
\newcommand{\person}{Your name}
\newcommand{\ID}{Your title}

\newsavebox{\headone}
\sbox{\headone}{\parbox[t]{2.5in}{\boldfont{\color{mitred} Massachusetts Institute of Technology}}}
\newsavebox{\headtwo}
\sbox{\headtwo}
     {\parbox[t]{2in}{\setlength{\baselineskip}{9.2pt}\boldfontb{\person}\\\regularfontb{\ID}}}
\newsavebox{\headthree}
\sbox{\headthree}
     {\parbox[t]{2in}{\setlength{\baselineskip}{9.2pt}\boldfont{\color{mitred} \officename}\\
       \regularfont{Building \roomnumber}}}
\newsavebox{\headfour}
\sbox{\headfour}
     {\parbox[t]{2in}{\setlength{\baselineskip}{9.2pt}\regularfont{77 Massachusetts Avenue}\\
       \regularfont{Cambridge, Massachusetts}\\
       \regularfont{02139-4307}}}
\newsavebox{\headfive}
\sbox{\headfive}
     {\parbox[t]{2in}{\setlength{\baselineskip}{9.2pt}\regularfont{Phone \hspace{.13cm}\phonenum}\\
       \regularfont{Fax \hspace{.47cm}\faxnum}\\
       \regularfont{Email \hspace{.22cm}\email}\\
       \regularfont{\website}}}
\newsavebox{\header}
\sbox{\header}
     {\begin{tabular*}{\textwidth}{lll@{\extracolsep{\fill}}}
	 \usebox{\headone} & \usebox{\headtwo} & \usebox{\headfour} \\
	 & \usebox{\headthree} & \raisebox{-.1in}{\usebox{\headfive}}
     \end{tabular*}}

\newsavebox{\envelope}
\sbox{\envelope}
     {\parbox[t]{7cm}{\setlength{\baselineskip}{9.2pt}\boldfont{\officename\\\associateofficename\\\\Massachusetts Institute of Technology}\\\regularfont{77 Massachusetts Avenue, Building \roomnumber} \\\regularfont{Cambridge, MA 02139-4307} \\\\\\\\\\\\\\\\ \scalebox{.30}{\includegraphics*{mitlogo-clr.eps}}}}

\renewcommand{\returnaddress}{\protect\usebox{\envelope}}


\renewcommand{\ps@firstpage}
	     {\setlength{\headheight}{70pt}\setlength{\headsep}{25pt}%
	       \renewcommand{\@oddhead}{\usebox{\header}}%
	       \renewcommand{\@evenhead}{}\renewcommand{\@evenfoot}{}}

\providecommand{\@evenhead}{}\providecommand{\@oddhead}{}
\providecommand{\@evenfoot}{}\providecommand{\@oddfoot}{}

\pagestyle{headings}
