%% Dies ist fpprotokoll.cls
%% ---------------------------------------------------------

%% Diese Klasse dient als Wrapper um tudapub.cls, 
%% um einige quality-of -life Verbesserungen zu liefern.
%%
%% fpprotokoll.cls basiert auf dem FP-Template von Dennis Schorn
%%
%% ------------------------------------------------------------
%% 
%% Bei Fragen könnt Ihr euch an Kevin Reining wenden


% --- identification ---
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fpprotokoll}[2022/04/10 v0.1 Protokoll für FP-Versuche]

% --- preliminary code ---

%Autoren
\newcommand{\DefAutorA}{}
\newcommand{\DefAutorB}{}
\newcommand{\AutorA}[1]{\renewcommand{\DefAutorA}{#1}}
\newcommand{\AutorB}[1]{\renewcommand{\DefAutorB}{#1}}

%Matrikelnummern
%Autoren
\newcommand*{\DefMnrAutorA}{}
\newcommand*{\DefMnrAutorB}{}
\newcommand*{\MnrAutorA}[1]{\renewcommand*{\DefMnrAutorA}{#1}}
\newcommand*{\MnrAutorB}[1]{\renewcommand*{\DefMnrAutorB}{#1}}

% Versuchsname
\newcommand*{\DefVersuchsbezeichnung}{}
\newcommand*{\Versuchsbezeichnung}[1]{\renewcommand*{\DefVersuchsbezeichnung}{#1}}

% Betreuer
\newcommand*{\DefBetreuung}{}
\newcommand*{\Betreuung}[1]{\renewcommand*{\DefBetreuung}{#1}}

% Datum
\newcommand*{\DefDatum}{}
\newcommand*{\Datum}[1]{\renewcommand*{\DefDatum}{#1}}

% Abteilung
\newcommand*{\DefAbteilung}{}
\newcommand*{\Abteilung}[1]{\renewcommand*{\DefAbteilung}{#1}}

% Institut
\newcommand*{\DefInstitut}{}
\newcommand*{\Institut}[1]{\renewcommand*{\DefInstitut}{#1}}

% Institutsfarbe
\newcommand*{\DefInstColor}{}
\newcommand*{\InstColor}[1]{\renewcommand*{\DefInstColor}{#1}}

\newif\ifiap \iapfalse
\newif\ifipkm \ipkmfalse
\newif\ifikp \ikpfalse


% --- handle options ---

\DeclareOption{iap}{\iaptrue \ipkmfalse \ikpfalse}
\DeclareOption{ipkm}{\iapfalse \ipkmtrue \ikpfalse}
\DeclareOption{ikp}{\iapfalse \ipkmfalse \ikptrue}

\ProcessOptions*\relax


\ifiap
	\Abteilung{Abteilung A}
	\InstColor{2b}
	\Institut{Institut für Angewandte Physik}
\else
	\ifipkm
		\Abteilung{Abteilung B}
		\InstColor{9c}
		\Institut{Institut für Physik Kondensierter Materie}
	\else
		\Abteilung{Abteilung C}
		\InstColor{8b}
		\Institut{Institut für Kernphysik}
	\fi
\fi
\PassOptionsToClass{color=\DefInstColor}{tudapub}
\LoadClass[ngerman, marginpar = false, colorback = body, IMRAD = false, pdfa = false]{tudapub}

% --- main ---

\AtBeginDocument{

\title{\DefVersuchsbezeichnung}

\subtitle{\DefAutorA~(\DefMnrAutorA) \\ \DefAutorB~(\DefMnrAutorB) \vspace{1.5pt}}

\author{\texorpdfstring{Betreuung: \DefBetreuung{} \hfill Versuchsdatum: \DefDatum}{Betreuung: \DefBetreuung Versuchsdatum: \DefDatum}}

\date{\empty}

\titleimage{
	\color{TUDa-\DefInstColor}\rule{\width}{\height}
}

\addTitleBox{
Physikalisches Praktikum für Fortgeschrittene \\[5pt]
\DefAbteilung \\[5pt] 
\DefInstitut
}

\maketitle

}