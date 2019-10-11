% LaTeX CV template class
%
% Author: Jan Moravec (moravecjan@email.cz)
% GitHub: https://github.com/jan-moravec/cv-latex

%%%% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2019/10/08 LaTeX CV template class]

%%%% Custom package options
% Select one of following languages
\DeclareOption{english}{
	\PassOptionsToPackage{\CurrentOption}{babel}
}
\DeclareOption{czech}{
	\PassOptionsToPackage{\CurrentOption}{babel}
}

% Fallback
\DeclareOption*{
	\ClassError{cv}{Unknown option '\CurrentOption'}{}
}

% Process given options
\ProcessOptions\relax

%%%% Load base
\LoadClass[a4paper]{article}

%%%% Load additional packages and commands.
\RequirePackage{babel}
\RequirePackage[babel]{csquotes}
\RequirePackage[utf8]{inputenc}
\RequirePackage[a4paper, margin=0.6in, includeheadfoot]{geometry}
\RequirePackage{changepage}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{enumitem}
\RequirePackage{amsmath}
\RequirePackage{titlesec}
\RequirePackage[fixed]{fontawesome5}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{hyperref}
\RequirePackage{xhfill}
\RequirePackage{ifthen}

%%%% Packages setting
\pagestyle{empty}
\hypersetup{
	colorlinks=true,
	linkcolor=black,
	filecolor=black,      
	urlcolor=black,
}
%\urlstyle{same}

%%%% Check if language was set
\newboolean{language_set}   
\setboolean{language_set}{false}

\iflanguage{english}{
	\setboolean{language_set}{true}
}{}

\iflanguage{czech}{
	\setboolean{language_set}{true}

}{}

\ifthenelse{\boolean{language_set}}{
	% OK, language was set
}{
	\ClassError{cv}{Language was not set!}{}
}

%%%% Define language filter command
\newcommand{\cveng}[1]{%
	\iflanguage{english}{#1}{}
}
\newcommand{\cvcze}[1]{%
	\iflanguage{czech}{#1}{}
}

%%%% Global defines
\definecolor{cvblue}{RGB}{54, 74, 120}
\def\cvheaderoffset{0.25in}
\newcommand{\ruleafter}[1]{#1~\xrfill[.7ex]{0.25pt}[cvblue]} 

%%%% Contact information
\newcommand{\cvname}[1]{%
	\def\cvnamevalue{#1} 
}
\newcommand{\cvimage}[1]{%
	\def\cvimagevalue{#1} 
}
\newcommand{\cvphone}[1]{%
	\def\cvphonevalue{#1} 
}
\newcommand{\cvemail}[1]{%
	\def\cvemailvalue{#1} 
}
\newcommand{\cvaddress}[1]{%
	\def\cvaddressvalue{#1} 
}
\newcommand{\cvdateofbirth}[1]{%
	\def\cvdateofbirthvalue{#1} 
}
\newcommand{\cvwebpage}[1]{%
	\def\cvwebpagevalue{#1} 
}
\newcommand{\cvgithub}[1]{%
	\def\cvgithubvalue{#1} 
}

%%%% Generate contact information
\newcommand{\cvgeneratecontact} {%
	\begin{minipage}{0.65\textwidth}
		\ifthenelse{\isundefined{\cvnamevalue}}{
			\ClassError{cv}{Set name!}{}
		}{	
			\textcolor{cvblue}{\Huge{\cvnamevalue}}
			\bigskip
		}
	
		%\cvsection{Personal Data}
		
		\begin{adjustwidth}{\cvheaderoffset}{\cvheaderoffset}
			\begin{tabular}[t]{@{} p{1em} p{8em} l}
				%\ifthenelse{\isundefined{\cvnamevalue}}{
				%	\ClassError{cv}{Set name!}{}
				%}{
				%	\faAddressCard 	& \textbf{Name:} 	& \normalsize{\textbf{\cvnamevalue}} \\
				%}
				\ifthenelse{\isundefined{\cvphonevalue}}{}{%
					\faPhone* 		& Phone: 			& \cvphonevalue \\
				}%
				\ifthenelse{\isundefined{\cvemailvalue}}{}{%
					\faEnvelope 	& Email: 			& \href{mailto:\cvemailvalue}{\nolinkurl{\cvemailvalue}} \\
				}%
				\ifthenelse{\isundefined{\cvaddressvalue}}{}{%
					\faHome 		& Address: 			& \cvaddressvalue \\
				}%
				\ifthenelse{\isundefined{\cvdateofbirthvalue}}{}{%
					\faCalendar 	& Date of birth: 	& \cvdateofbirthvalue \\
				}%
				\ifthenelse{\isundefined{\cvwebpagevalue}}{}{%
					\faGlobe 		& Web page: 		& \url{\cvwebpagevalue} \\
				}%
				\ifthenelse{\isundefined{\cvgithubvalue}}{}{%
					\faGithub 		& GitHub: 			& \url{\cvgithubvalue} \\
				}%
				%\\
			\end{tabular}
		\end{adjustwidth}
	\end{minipage}
	\begin{minipage}{0.35\textwidth}
		% Image
		\ifthenelse{\isundefined{\cvnamevalue}}{}{
			%\begin{adjustwidth}{-\cvheaderoffset}{-\cvheaderoffset}
				\includegraphics[valign=T, width=0.6\textwidth, right]{\cvimagevalue}
			%\end{adjustwidth}
		}
	\end{minipage}
}

%%%% Titles customization
\newenvironment{cvsection}[1]{%
	\titleformat{\section}
	[hang]
	{\Large\scshape\color{cvblue}}
	{}
	{0em}
	{\ruleafter}
	[]
	
	\section{#1}
	\begin{adjustwidth}{\cvheaderoffset}{\cvheaderoffset}
}{
	\end{adjustwidth}
}

\titleformat{\section}
[hang]										% is sectioning paragraph shape; possible values are: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
{\Large\scshape\raggedright\bfseries\color{cvblue}}	% is the format to be applied to the title, label, and text; for example \normalfont\Large\bfseries
{}											% specify sectioning label. \faGraduationCap
{0em}                        				% is the horizontal separation between label and title body and it must be a length and not be empty. 
{}                           				% is code preceding the title body. 
[\titlerule]                 				% is code following the title body. \titlerule

\titlespacing{\section}
{0em}					% increases the left margin. 
{1.5em}					% is the vertical space before the title. 
{0em}					% is the separation between title and non-sectioning text. 

\titleformat{\subsection}
[hang]
{\bfseries}
{}
{0em}
{}

\titlespacing{\subsection}
{0em}
{1em}
{0.2em}

%%%% Define dated subsection command
\newcommand{\cvdatedsubsection}[2]{%
	\subsection[#1]{#1 \hfill #2}
}

\newcommand{\cvsubsection}[1]{%
	\subsection[#1]{#1}
}

%%%% No paragraphs, itemize settings
\setlength{\parindent}{0em}     
\setlength{\parskip}{0em}
\renewcommand{\baselinestretch}{1.2}
\setlist[itemize,1]{leftmargin=*}
\setlist{nolistsep}

%%%% Header and footer
\pagestyle{fancy}
\fancyhf{}
\rhead{\textcolor{gray}{\today}}
\lhead{\textcolor{gray}{\cvnamevalue}}
\rfoot{\thepage \hspace{1pt} / \pageref{LastPage}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\endinput
