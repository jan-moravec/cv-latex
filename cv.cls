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

%%%% Define timeitem command
\newcommand{\timeitem}[3]{
	\noindent
	\begin{tabular}{@{}p{0.8\textwidth}@{}p{0.2\textwidth}@{}}
		\raggedright {\bfseries  #2}\\ #1  & \raggedleft #3 
	\end{tabular}\\[1ex]
}

\def\english#1{
	\iflanguage{english}{#1}{}
}
\def\czech#1{
	\iflanguage{czech}{#1}{}
}

%%%% DefineSection command

%%%% Define Sections
%\DefineSection{education}

%%%% Define icons
\def\authorIcon{\faMale}
\def\phoneIcon{\faPhone}
\def\dateofbirthIcon{\faCalendar}
\def\placeofbirthIcon{\faMapO}
\def\statusIcon{\faHeart}
\def\emailIcon{\faEnvelopeO}
\def\addressIcon{\faHome}
\def\wwwIcon{\faGlobe}
%
\def\personalDataIcon{\faInfoCircle}
\def\educationIcon{\faGraduationCap}
\def\publicationsIcon{\faFileTextO}
\def\conferencesIcon{\faGroup}
\def\scholarshipsIcon{\faTrophy}
\def\skillsIcon{\faKeyboardO}
\def\hobbiesIcon{\faThumbsOUp}
\def\experienceIcon{\faBriefcase}
\def\certificatesIcon{\faWpforms}
\def\projectsIcon{\faLightbulbO}
\def\internshipsIcon{\faWrench}

%%%% Define English 
\def\authorName{Name}
\def\phoneName{Phone}
\def\dateofbirthName{Date of birth}
\def\placeofbirthName{Place of birth}
\def\statusName{Status}
\def\emailName{E-mail}
\def\addressName{Address}
\def\wwwName{WWW}
%
\def\personalDataName{Personal data}
\def\educationName{Education}
\def\publicationsName{Publications}
\def\conferencesName{Conferences}
\def\scholarshipsName{Scholarships, grants}
\def\skillsName{Skills}
\def\hobbiesName{Hobbies}
\def\experienceName{Experience}
\def\certificatesName{Certificates}
\def\projectsName{Projects}
\def\internshipsName{Internships}

\endinput
