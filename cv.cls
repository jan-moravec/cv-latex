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
\RequirePackage[a4paper, bindingoffset=0.2in, left=0.5in, right=0.5in, top=0.5in, bottom=0.5in, footskip=.25in]{geometry}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{enumitem}
\RequirePackage{fontawesome}
\RequirePackage{amsmath}
\RequirePackage{titlesec}
\RequirePackage{ifthen}

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
\newcommand{\english}[1]{
	\iflanguage{english}{#1}{}
}
\newcommand{\czech}[1]{
	\iflanguage{czech}{#1}{}
}

\definecolor{myblue}{RGB}{104, 126, 154}

%%%% Titles customization
\titleformat{\section}
[hang]										% is sectioning paragraph shape; possible values are: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
{\Large\scshape\raggedright\color{myblue}}	% is the format to be applied to the title, label, and text; for example \normalfont\Large\bfseries
{}											% specify sectioning label. \faGraduationCap
{0em}                        				% is the horizontal separation between label and title body and it must be a length and not be empty. 
{}                           				% is code preceding the title body. 
[\titlerule]                 				% is code following the title body. 

\titlespacing{\section}
{0em}					% increases the left margin. 
{1em}					% is the vertical space before the title. 
{2em}					% is the separation between title and non-sectioning text. 

\titleformat{\subsection}
[hang]
{\large\scshape\raggedright\bfseries\color{myblue}}
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

\endinput
