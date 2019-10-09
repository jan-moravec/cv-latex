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
\RequirePackage[a4paper, margin=1.0in]{geometry}
\RequirePackage{changepage}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{enumitem}
\RequirePackage{amsmath}
\RequirePackage{titlesec}
\RequirePackage{ifthen}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\pagestyle{empty}

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
\newcommand{\cveng}[1]{
	\iflanguage{english}{#1}{}
}
\newcommand{\cvcze}[1]{
	\iflanguage{czech}{#1}{}
}

%%%% Titles customization
\usepackage{xhfill}
\definecolor{cvblue}{RGB}{54, 74, 120}
\newcommand{\ruleafter}[1]{#1~\xrfill[.7ex]{0.25pt}[cvblue]}

\newcommand{\cvsection}[1]{
	\titleformat{\section}
	[hang]
	{\Large\scshape\raggedright\color{cvblue}}
	{}
	{0em}
	{\ruleafter}
	[]
	
	\begin{adjustwidth}{-0.5in}{-0.5in}
	\section{#1}
	\end{adjustwidth}
}

\titleformat{\section}
[hang]										% is sectioning paragraph shape; possible values are: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
{\Large\scshape\raggedright\color{cvblue}}	% is the format to be applied to the title, label, and text; for example \normalfont\Large\bfseries
{}											% specify sectioning label. \faGraduationCap
{0em}                        				% is the horizontal separation between label and title body and it must be a length and not be empty. 
{}                           				% is code preceding the title body. 
[\titlerule]                 				% is code following the title body. \titlerule

\titlespacing{\section}
{0em}					% increases the left margin. 
{1em}					% is the vertical space before the title. 
{0em}					% is the separation between title and non-sectioning text. 

\titleformat{\subsection}
[hang]
{\large\scshape\raggedright\bfseries\color{cvblue}}
{}
{0em}
{}

\titlespacing{\subsection}
{0em}
{1em}
{0.2em}

%%%% Define timeitem command
\newcommand{\datedsection}[2]{%
	\section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
	\subsection[#1]{#1 \hfill #2}%
}  

%%%% No paragraphs, itemize settings
\setlength{\parindent}{0cm}     
\setlist[itemize,1]{leftmargin=*}
\setlist{nolistsep}

\pagestyle{fancy}
\fancyhf{}
\rhead{Overleaf}
\lhead{Guides and tutorials}
\rfoot{\thepage \hspace{1pt} / \pageref{LastPage}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\endinput
