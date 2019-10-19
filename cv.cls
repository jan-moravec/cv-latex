% LaTeX CV template class
%
% Author: Jan Moravec (moravecjan@email.cz)
% GitHub: https://github.com/jan-moravec/cv-latex

%%%% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2019/10/08 LaTeX CV template class]

%%%% Load base
\LoadClass[a4paper]{article}

%%%% Load additional packages and commands.
\RequirePackage[a4paper, margin=0.75in, includeheadfoot]{geometry}
\RequirePackage{babel}
\RequirePackage[babel]{csquotes}
\RequirePackage[utf8]{inputenc}
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
\urlstyle{same}

%%%% Languages definition file
\input{cvlanguages}

%%%% Global defines
\definecolor{cvblue}{RGB}{54, 74, 120}
\def\cvheaderoffset{0.25in}
\def\cvvaluekeyoffset{10em}
\newcommand{\ruleafter}[1]{#1~\xrfill[.7ex]{0.25pt}[cvblue]} 

%%%% Contact information
\newcommand{\cvname}[2][Name]{%
	\def\cvnamelegend{#1}
	\def\cvnamevalue{#2} 
}
\newcommand{\cvphone}[2][Phone]{%
	\def\cvphonelegend{#1}
	\def\cvphonevalue{#2} 
}
\newcommand{\cvemail}[2][Email]{%
	\def\cvemaillegend{#1}
	\def\cvemailvalue{#2} 
}
\newcommand{\cvaddress}[2][Address]{%
	\def\cvaddresslegend{#1}
	\def\cvaddressvalue{#2} 
}
\newcommand{\cvdateofbirth}[2][Date of birth]{%
	\def\cvdateofbirthlegend{#1}
	\def\cvdateofbirthvalue{#2} 
}
\newcommand{\cvwebpage}[2][Web page]{%
	\def\cvwebpagelegend{#1}
	\def\cvwebpagevalue{#2} 
}
\newcommand{\cvgithub}[2][GitHub]{%
	\def\cvgithublegend{#1}
	\def\cvgithubvalue{#2} 
}
% Image
\newcommand{\cvimage}[1]{%
	\def\cvimagevalue{#1} 
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
			\begin{tabular}[t]{@{} p{3mm} p{\cvvaluekeyoffset-7mm} l}
				%\ifthenelse{\isundefined{\cvnamevalue}}{
				%	\ClassError{cv}{Set name!}{}
				%}{
				%	\faAddressCard 	& \textbf{Name:} 	& \normalsize{\textbf{\cvnamevalue}} \\
				%}
				\ifthenelse{\isundefined{\cvphonevalue}}{}{%
					\faPhone* 		& \cvphonelegend: 		& \cvphonevalue \\
				}%
				\ifthenelse{\isundefined{\cvemailvalue}}{}{%
					\faEnvelope 	& \cvemaillegend:		& \href{mailto:\cvemailvalue}{\nolinkurl{\cvemailvalue}} \\
				}%
				\ifthenelse{\isundefined{\cvaddressvalue}}{}{%
					\faHome 		& \cvaddresslegend:		& \cvaddressvalue \\
				}%
				\ifthenelse{\isundefined{\cvdateofbirthvalue}}{}{%
					\faCalendar 	& \cvdateofbirthlegend: & \cvdateofbirthvalue \\
				}%
				\ifthenelse{\isundefined{\cvwebpagevalue}}{}{%
					\faGlobe 		& \cvwebpagelegend: 	& \url{\cvwebpagevalue} \\
				}%
				\ifthenelse{\isundefined{\cvgithubvalue}}{}{%
					\faGithub 		& \cvgithublegend: 		& \url{\cvgithubvalue} \\
				}%
				%\\
			\end{tabular}
		%\begin{tabular}[t]{@{} p{\cvvaluekeyoffset} l}
		%	test: 		& test \\
		%\end{tabular}
		\end{adjustwidth}
	\end{minipage}
	\begin{minipage}{0.35\textwidth}
		% Image
		\ifthenelse{\isundefined{\cvnamevalue}}{}{
			%\begin{adjustwidth}{\cvheaderoffset}{\cvheaderoffset}
			\begin{flushright}
				\includegraphics[height=4cm]{\cvimagevalue} %[valign=T, width=3cm, right]
			\end{flushright}	
			%\end{adjustwidth}
		}
	\end{minipage}
}

\newcommand{\cvresume}[1]{%
	\begin{adjustwidth}{\cvheaderoffset}{\cvheaderoffset}
		\bigskip
		\textit{#1}
	\end{adjustwidth}
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
{0.5em}					% is the separation between title and non-sectioning text. 

\titleformat{\subsection}
[hang]
{\bfseries}
{}
{0em}
{}

\titlespacing{\subsection}
{0em}
{0.6em}
{0.0em}

%%%% Define dated subsection command
\newcommand{\cvdatedsubsection}[2]{%
	\subsection[#1]{#1 \hfill #2}
}

\newcommand{\cvsubsection}[1]{%
	\subsection[#1]{#1}
}

%%%% Item - value table
\newenvironment{cvitemvaluetable}[1][\cvvaluekeyoffset]{%
	\begin{tabular}[t]{@{} p{#1} l}
	}{
	\end{tabular}
}

\newcommand{\cvitemvalue}[2]{%
	%\textbullet \enskip #1: & #2 \\
	#1: & #2 \\
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
