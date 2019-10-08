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
\RequirePackage[a4paper, bindingoffset=0.2in, left=1in, right=1in, top=1in, bottom=1in, footskip=.25in]{geometry}
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


\def\Vhrulefill{\leavevmode\leaders\hrule height .7ex depth \dimexpr 0.4pt-0.7ex \hfill \kern0pt}
%%%% Titles
\titleformat{\section}         % Customise the \section command 
{\Large\scshape\raggedright} % Make the \section headers large (\Large), small capitals (\scshape) and left aligned (\raggedright)
{\faGraduationCap}
{2em}                        % Can be used to give a prefix to all sections, like 'Section ...'
{}                           % Can be used to insert code before the heading
[\titlerule]                 % Inserts a horizontal line after the heading
% \Vhrulefill  \titlerule

\titlespacing{\section}{2em}{2em}{2em}

\titleformat{\subsection}
{\large\scshape\raggedright}
{}{0em}
{}

%%%% Define timeitem command
\newcommand{\timeitem}[3]{
	\noindent
	\begin{tabular}{@{}p{0.8\textwidth}@{}p{0.2\textwidth}@{}}
		\raggedright {\bfseries  #2}\\ #1  & \raggedleft #3 
	\end{tabular}\\[1ex]
}

\newcommand{\datedsection}[2]{%
	\section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
	\subsection[#1]{#1 \hfill #2}%
}

%%%%% Define Section command
%\makeatletter
%
%\def\@Sect#1#2#3#4#5#6[#7]#8{\ifnum #2>\c@secnumdepth \let \@svsec \@empty \else \refstepcounter {#1}\protected@edef \@svsec {\@seccntformat {#1}\relax }\fi \@tempskipa #5\relax \ifdim \@tempskipa >\z@ \begingroup #6{\@hangfrom {\hskip #3\relax \@svsec }\interlinepenalty \@M #8 \Vhrulefill\@@par }\endgroup \csname #1mark\endcsname {#7}
%	\addcontentsline {toc}{#1}{\ifnum #2>\c@secnumdepth \else \protect \numberline 
%		{\csname the#1\endcsname }\fi #7}\else \def \@svsechd {#6{\hskip #3\relax \@svsec #8}\csname #1mark\endcsname {#7}\addcontentsline {toc}{#1}{\ifnum #2>\c@secnumdepth \else \protect \numberline {\csname the#1\endcsname }\fi #7}}\fi \@xsect {#5}}
%
%\def\@startSection#1#2#3#4#5#6{\if@noskipsec \leavevmode \fi \par \@tempskipa #4\relax \@afterindenttrue \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse \fi \if@nobreak \everypar {}\else \addpenalty \@secpenalty \addvspace \@tempskipa
%	\fi \@ifstar {\@ssect {#3}{#4}{#5}{#6}}{\@dblarg {\@Sect {#1}{#2}{#3}{#4}{#5}{#6}}}}
%
%\def\Section{\@startSection {section}{1}{\z@ }%
%	{2ex}%
%	{2.3ex \@plus .2ex}%
%	{\normalfont \Large \sffamily}%
%}
%
%\def\Vhrulefill{\leavevmode\leaders\hrule height .7ex depth \dimexpr 0.4pt-0.7ex \hfill \kern0pt}
%
%%\def\secbox#1{\makebox[0pt][r]{\fcolorbox{blue!60!black}{blue!60!black}{\color{white} #1}}}
%%\def\Icon#1{\def\@seccntformat##1{\secbox{#1}\,}}
%%\def\Icon#1{\def\@seccntformat##1{\llap{\colorbox{black}{\makebox[1.3em][c]{\textcolor{white}{#1}}}\hspace{0.5em}}}}
%\def\Icon#1{\def\@seccntformat##1{\llap{{\makebox[1.5em][c]{{#1}}\hspace{0.5em}}}}}
%
%
%\def\section{\@startsection{section}{1}{\z@}%
%	{2ex}%-3.5ex \@plus -1ex \@minus -.2ex}%
%	{2.3ex \@plus.2ex}%
%	{\normalfont \Large \sffamily}}
%
%\def\subsection{\@startsection{subsection}{2}{\z@}%
%	{1ex}%-3.5ex \@plus -1ex \@minus -.2ex}%
%	{-2.3ex \@plus.2ex}%
%	{\normalfont \normalsize \sffamily}}
%
%\makeatother              

\endinput
