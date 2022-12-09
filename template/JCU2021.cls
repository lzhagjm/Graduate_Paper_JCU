\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{template/JCU2021}[2021/012/26 V1.0.0]

% ---------- 载入Class ----------
\LoadClass[12pt, a4paper,openany,twoside]{book}


\newif\if@master\@mastertrue
\DeclareOption{doctor}{\@masterfalse}
\DeclareOption{master}{\@mastertrue}

\newif\if@print\@printfalse
\DeclareOption{print}{\@printtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions \relax


% ---------- 中文字体宏包 ----------
\RequirePackage[UTF8,12pt]{ctex}
\RequirePackage{newtxtext}  % for text fonts
% \RequirePackage{mathptmx}
% --------- 定义不同编译方式 ----------
\RequirePackage{ifpdf,ifxetex}
\ifxetex
  \RequirePackage{fontspec}
  \RequirePackage{graphicx}
\else
  \ifpdf
  	\usepackage[utf8]{inputenc}
  	\RequirePackage[T1]{fontenc}
    \RequirePackage{graphicx}
    \RequirePackage{epstopdf}
  \else
    \RequirePackage[dvipdfmx]{graphicx}
    \RequirePackage{bmpsize}
  \fi
\fi


% ---------- 定义页边距 ----------
\RequirePackage{geometry}
\geometry{left=2.8cm,right=2cm,top=2.54cm,bottom=2.54cm}
\addtolength{\headsep}{-0.1cm}     % 页眉位置
\addtolength{\footskip}{-1.654cm}    % 页脚位置


% \RequirePackage{fontspec}                  %引入字体设置宏包
% \setmainfont{Times New Roman}             %设置正文字体为Book Antique
% \setsansfont{Arial}                    %英文无衬线字体
% \setmonofont{Courier New}              %英文等宽字体



%（一）封面
% 1. 毕业论文（设计）题目。简明扼要，核心内容明确。中文题目一般不超过25个字，字体为宋体，三号；英文题目一般不超过150个字母，字体为Times New Roman，三号。根据论文内容，可以加副标题。
% 2.学生姓名、指导教师、学院、专业、年级字体为宋体，三号。
%
\newtoks\advisor
\newtoks\college
\newtoks\major
\newtoks\stunum
\newtoks\donetime
\newtoks\titlextra %标题多余一行时添加
%=======english title
\newtoks\entitle
\newtoks\entitletra %标题多余一行时添加
%%=======statement
%标题页
%需要添加循环函数，判定多于一行的情况
%%=======statement

\RequirePackage{array}
\def\LZU@underline[#1]#2{%
    \underline{\hbox to #1{\hfill#2\hfill}}}
\def\LZUunderline{\@ifnextchar[\LZU@underline\underline}

\RequirePackage{makecell}
%\RequirePackage{pgffor}
\RequirePackage{forloop}
\RequirePackage{xstring}

\setCJKfamilyfont{hwxk}{STXingkai}             %使用STXingkai华文行楷字体
\newcommand{\huawenxingkai}{\CJKfamily{hwxk}}

\renewcommand\maketitle{%
    \thispagestyle{empty}
    \begin{center}
        \vspace*{40pt}
        {\zihao{0}\huawenxingkai{景德镇陶瓷大学 \\}}
        \vspace*{42pt}
        {\zihao{1}\bfseries\songti{毕\hspace{0.5em}业\hspace{0.5em}设\hspace{0.5em}计\hspace{0.5em}说\hspace{0.5em}明\hspace{0.5em}书 \\}}% 封面这几个字，规范中未提及，此处按照宋体
        \vspace*{52pt}
        \begin{tabular}{l}
            \songti \zihao{2}{题目: }\LZUunderline[320pt]{ \songti \zihao{3}\@title}\\[1cm]
            \songti \zihao{2}{英文题目: }\LZUunderline[320pt]{ \songti \zihao{3}  \the \entitle }\\[1cm]
			\songti \zihao{2}{\hspace{4.65em}}\LZUunderline[320pt]{ \songti \zihao{3}  \the \entitletra }
        \end{tabular}
        \vspace*{52pt}

        \begin{tabular}{cc}
            {\heiti \bfseries \zihao{3}{学\qquad 院:}} &
            {\LZUunderline[180pt]{ \heiti \zihao{3}\the\college}}\\[18pt]
            {\heiti \bfseries \zihao{3}{专\qquad 业:}} &
            {\LZUunderline[180pt]{ \heiti \zihao{3}  \the\major}} \\[18pt]
            {\heiti \bfseries \zihao{3}{姓\qquad 名:}} &
            {\LZUunderline[180pt]{ \heiti  \zihao{3} \@author}} \\[18pt]
            {\heiti \bfseries \zihao{3} {学\qquad 号:}} &
            {\LZUunderline[180pt]{ \heiti  \zihao{3} \the\stunum}}\\[18pt]
            {\heiti \bfseries \zihao{3}{指导教师:}} &
            {\LZUunderline[180pt]{ \heiti \zihao{3}  \the\advisor}}\\[18pt]
            {\heiti \bfseries \zihao{3}{完成时间:}} &
            {\LZUunderline[180pt]{ \heiti \zihao{3}  \the\donetime}}\\[18pt]
        \end{tabular}
    \end{center}
    \clearpage
}


% ---------- 常用宏包 ----------
\RequirePackage{amsmath,amssymb,amsthm,amsfonts}  % AMS公式
\RequirePackage{bm}         % 数学公式黑斜体
\RequirePackage{mathrsfs}   % 数学英文花体
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{cite}
\RequirePackage{longtable}  % 长表格
\RequirePackage{multirow}   % 表格多行合并
\RequirePackage{enumerate}  % 改变列表标号样式
\RequirePackage{color,xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{tikz}       % 绘制图形
\RequirePackage{titlesec}   % 设置标题样式
\RequirePackage{tabularx}
\RequirePackage{makecell}
\RequirePackage{xstring}    % 使用条件语句
\RequirePackage[numbers,sort&compress]{natbib}

% -------- 设置图片的路径 ---------
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}}


% ---------- 定义章节的编号格式 ----------
% \renewcommand{\chaptername}{\arabic{chapter}}
% \renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
% \renewcommand{\thesubsection}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}
% \renewcommand{\thesubsubsection}{\arabic{subsubsection}.}

\renewcommand{\chaptername}{\arabic{chapter}}
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand{\thesubsection}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}


\newcommand{\chpzihao}{\fontsize{15pt}{15pt}\selectfont}

%---------- 定义章节标题格式 ------------

% 1 
\titleformat{\chapter}[hang]{\normalfont \heiti \bfseries \chpzihao  }
    {\chpzihao \chaptertitlename}{15pt}{}
\titlespacing{\chapter}{0pt}{-2.ex  plus .1ex minus .2ex}{1ex plus .1ex minus .2ex}

%1.1
\titleformat{\section}[hang]{\heiti \bfseries \zihao{4}}
    {\zihao{4} \thesection}{1em}{}
\titlespacing{\section}{0pt}{0pt}{.5ex plus .1ex minus .2ex}

%1.1.1
\titleformat{\subsection}[hang]{\heiti  \zihao{-4}}
    {\zihao{-4} \thesubsection}{1em}{}
\titlespacing{\subsection}%
    {0pt}{0pt}{.5ex plus .1ex minus .2ex}


\titleformat{\subsubsection}[hang]{\heiti}
    {\thesubsubsection }{1em}{}
\titlespacing{\subsubsection}%
    {0pt}{1.2ex plus .1ex minus .2ex}{\wordsep}


%---------- 设置章节目录的深度 -------------
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3} 


% ------------- 设置附录 -----------
\RequirePackage{titletoc}
\RequirePackage[title,titletoc]{appendix}
%\renewcommand{\appendixname}{附录}

%-------------- 定义页眉页脚 -------------------

% 定义页眉和页脚 使用 fancyhdr 宏包
\newcommand{\makeheadrule}{%
    \makebox[-3pt][l]{\rule[.7\baselineskip]{\headwidth}{0pt}}
     \rule[0.85\baselineskip]{\headwidth}{0.5pt}\vskip-.8\baselineskip}

\makeatletter
\renewcommand{\headrule}{%
    {\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
     \makeheadrule}}

% ------------ 画单隔线 ------------
\renewcommand{\headrulewidth}{0.5pt}    % 在页眉下画一个0.5pt宽的分隔线
\renewcommand{\footrulewidth}{0pt}      % 在页脚不画分隔线。


% ------- 重新定义 cleardoublepage --------
\def\cleardoublepage{%
  \clearpage
  \if@print
      \ifodd\c@page
      \else
        \thispagestyle{empty}%
        \hbox{}%
        \newpage
    \fi
  \fi
}


% ------------ 设置页眉样式 -----------
\newcommand{\headstyle}{
\fancyhead[C]{\color{black} \songti \bfseries \zihao{-3} 景德镇陶瓷大学本科生毕业设计说明书}
}


% ------- 设置页脚样式 ----------
\newcommand{\footstyle}{\fancyfoot[C]{ \thepage}}
\pagestyle{empty}
\pagestyle{fancy}
\fancyhf{} %清空原有样式
\headstyle
\footstyle


% --------- 定义一种新的格式叫做main ---------
\fancypagestyle{main}{%
    \pagestyle{fancyplain} 
	\fancyhf{} %清空原有样式
	\headstyle
	\footstyle
}


% --------- 定义 chaptermark ------------
\renewcommand\chaptermark[1]{%
  \markboth{%
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \@chapapp\ \ %
      \fi
    \fi
    #1}{}%
}


% ----------- 中文段落缩进和行距 ------------
\setlength{\parindent}{2em}                 % 首行两个汉字的缩进量
\setlength{\parskip}{3pt plus1pt minus1pt}  % 段落之间的竖直距离
\renewcommand{\baselinestretch}{1.5}        % 定义行距
%\topskip=15pt   % 书写区域顶部空白
%\parskip=5pt
%\parindent=0pt
%\baselineskip=5pt
%\setlength{\baselineskip}{24pt}


% ------------------- 浮动对象设置 ---------------------
% 浮动对象的缺省值稍微宽松一点，从而防止幅度对象占据过多的文本页面
% 也可以防止在很大空白的浮动页上放置很小的图形
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}


% ---------------- 设置图表格式 ---------------

\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}


% --------- 定制图形和表格标题的样式 --------------
\RequirePackage{caption}
\captionsetup{font={small,singlespacing},labelformat={default},labelsep=quad}
\captionsetup[figure]{position=bottom,skip={5pt},name={图}}
\captionsetup[table]{position=top,skip={2pt},name={表}}
\setlength{\textfloatsep}{0pt}
\setlength{\floatsep}{10pt plus 3pt minus 2pt}
\setlength{\intextsep}{10pt}
\setlength{\abovecaptionskip}{2pt plus1pt minus1pt}
\setlength{\belowcaptionskip}{0pt plus1pt minus2pt}
%\setlength{\itemsep}{3pt plus1pt minus2pt}


% -------- 重新设置图表autoref ---------
\newcommand{\figureautorefname}{图}
\newcommand{\tableautorefname}{表}


% ------ 使用tabularx库并定义新的左右中格式 ------
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedleft \arraybackslash}X}
\newcolumntype{P}[1]{>{\centering \arraybackslash}p{#1}}


% ------------ 设置三线表格式 ------
\setlength{\heavyrulewidth}{1.5pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\cmidrulewidth}{0.5pt}
\setlength{\aboverulesep}{0pt}
\setlength{\belowrulesep}{0pt}
\setlength{\abovetopsep}{0pt}
\setlength{\belowbottomsep}{0pt}


% -------- 重新定义图和表的浮动环境 ---------
\newenvironment{generalfig}[3][htbp]{
	\def \figcaption {#2}
	\def \figlabel {#3}
	\begin{figure}[#1]
		\centering
	}{
		\caption{\figcaption} \label{\figlabel}
	\end{figure}
}
\newenvironment{generaltab}[3][htbp]{
	\def \tabcaption {#2}
	\def \tablabel {#3}
	\begin{table}[#1]
		\caption{\tabcaption} \label{\tablabel}
		\zihao{5}
		\centering
	}{
	\end{table}
}


%------------- 数学定理设置 ---------------
\theoremstyle{plain} 
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{remark}{注}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{assumption}{假设}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{property}{性质}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
\renewcommand{\proofname}{证明}
%\renewcommand{\qedsymbol}{$\blacksquare$}

% -------------- 数学公式设置 ---------------
\allowdisplaybreaks[4]   % \eqnarray 如果很长，影响分栏、换行和分页

% ----- 设置公式间距为零 ------
\AtBeginDocument{
	\setlength{\abovedisplayskip}{4pt}
	\setlength{\belowdisplayskip}{4pt}
	\setlength{\abovedisplayshortskip}{2pt}
	\setlength{\belowdisplayshortskip}{2pt}
	\setlength{\arraycolsep}{2pt}   % array中列之间空白长度
}

% ------- 公式编号带章节 ----------
\numberwithin{equation}{chapter}
%\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}

% 重新设置公式autoref
\newcommand{\equationautorefname}{等式}


% --------- 定义列表项的样式 ---------
\RequirePackage{enumitem}
\setlist{nolistsep}



% --------- 脚注 ---------
% \RequirePackage[marginal]{footmisc}



% ------------------ 中文摘要环境 -------------
\newenvironment{cnabstract}[1]{
	\def \cnkeyword {#1}
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{摘要}
	\chaptermark{摘要}
	\vspace*{-1.5ex}
	\begin{center} \heiti \chpzihao \bfseries 摘要 \end{center}
}{
	\vspace{1ex}
	\paragraph{\heiti \bfseries 关键词：} \cnkeyword
	\clearpage
}


% ----------------- 英文摘要环境 ----------------
\newenvironment{enabstract}[1]{
	\def \enkeyword {#1}
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{\textbf{Abstract}}
	\chaptermark{Abstract}
	\vspace*{-1.5ex}
	\begin{center}  \chpzihao \bfseries  Abstract \end{center} 
}{
	\vspace{1ex}
	\paragraph{\bfseries Key Words: } \enkeyword 
	\clearpage
}


% ------------- 定义新的目录页面 ----------------
\RequirePackage{tocloft}
\RequirePackage{hyperref}
\hypersetup{
	colorlinks = true,
	linkcolor  = black,
	citecolor = black
} % 去掉目录红框
\renewcommand{\cfttoctitlefont}{\hfill \heiti \chpzihao}
\renewcommand{\cftchappresnum}{}
\renewcommand{\cftchapaftersnum}{}
\renewcommand{\cftchapaftersnumb}{\hspace{0pt}}
\renewcommand{\contentsname}{\bfseries 目录}
\renewcommand{\cftaftertoctitle}{\hfill}
\setlength{\cftbeforetoctitleskip}{3.5ex}
\setlength{\cftaftertoctitleskip}{1ex}
%\setlength{\cftbeforechapskip}{10pt}
\setlength{\cftbeforesecskip}{0.5ex}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{3}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand\cftchapleader{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftsecdotsep}{\cftdotsep}  % 设置Section引导点
\renewcommand{\cftchapfont}{\bfseries \heiti}    %设置chapter条目的字体
\renewcommand{\cftsecfont}{ \songti}    %设置section条目的字体
\renewcommand{\cftsubsecfont}{\songti} %设置subsection条目的字体


% 使用条件语句
\RequirePackage{xstring}

% 定义两个新语句
% 第一个语句更改fancyhdr样式
\newcommand{\plainfooterstyle}[1]{
	\IfStrEqCase{#1}{{nopagenum}{}
		{pagenum}{\footstyle}
		{pagenumtoc}{\footstyle}}
}
% 第二个语句在目录中添加目录标签
\newcommand{\addtoctotoc}[1]{
	\IfStrEqCase{#1}{{nopagenum}{}
		{pagenum}{}
		{pagenumtoc}{\phantomsection
			\addcontentsline{toc}{chapter}{目录}}}
}


% ----------- 设置新的生成目录命令 -------------
\let \oldtableofcontens \tableofcontents
\newcommand{\maketoc}[1][nopagenum]{
	% 修改hdr原plain格式
	\fancypagestyle{plain}{%
		\fancyhf{} %清空原有样式
		\headstyle
		\plainfooterstyle{#1}
	}
	% 设置目录hdr和页码选项
	\clearpage
	\pagestyle{plain}
	\addtoctotoc{#1}
	\tableofcontents
	\cleardoublepage
	\pagestyle{main}
}


% ---------- 定义主要符号表环境 -----------
\newenvironment{symbolpage}{
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{主要符号表}
	\vspace*{-1.5ex}
	\begin{center} \heiti \chpzihao \bfseries 主要符号表 \end{center}
	\chaptermark{主要符号表}
}{
	\clearpage
}


% ---------- 定义新的致谢环境 -----------
\newenvironment{thankpage}{
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{致谢}
	\vspace*{-1.5ex}
	\begin{center} \heiti \chpzihao \bfseries 致谢 \end{center}
	\chaptermark{致谢}
}{
	\clearpage
}


% ----------- 重新定义参考文献页 -----------

\newcommand{\upcite}[1]{\textsuperscript{\textsuperscript{\cite{#1}}}}

\bibliographystyle{plain}
\renewcommand{\bibname}{参考文献}

% % 设置新的附录命令
\let \oldbibliography \bibliography
\renewcommand{\bibliography}[1]{
	% 添加到目录
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{参考文献}
	\chaptermark{参考文献}
	\oldbibliography{#1}
}

\newenvironment{achievement}{
\clearpage
\chapter*{攻读学士学位期间的学术成果}
\addcontentsline{toc}{chapter}{攻读学士学位期间的学术成果}
}{\clearpage}


% 载入代码宏包
\RequirePackage{xcolor,listings}

% 设置代码的默认样式
\lstset{
	frame=single, %设置边框格式
	breaklines=true,% 允许自动断行
	% breakatwhitespace=true,% 使用此命令仅允许在空格处自动断行
	showstringspaces=false,% 不显示字符串中的空格
	basicstyle=\small\monaco,% 设置代码基本样式
	numbers=left, % 显示行号
	flexiblecolumns=true,% 改善字母间距
	keywordstyle=\color{blue},% 设置关键词样式
	stringstyle=\color[rgb]{0.75,0,0.75},% 设置字符串样式
	commentstyle=\songti\color[rgb]{0,0.5,0},% 设置注释样式
	tabsize=2,% 设置制表符缩进
}

% 设置matlab代码环境
\lstnewenvironment{matlab}[1][]{
	\lstset{
		language=Matlab,
		% deletekeywords={disp},% 可在此行去除特定关键词的语法高亮		
		keywordstyle=\color{blue},% 设置关键词样式
		stringstyle=\color[rgb]{0.75,0,0.75},% 设置字符串样式
		commentstyle=\songti\color[rgb]{0,0.5,0},% 设置注释样式
		#1
	}
}{}

% 设置python代码环境
\lstnewenvironment{python}[1][]{
	\lstset{
		language=Python,
		keywordstyle=\color[RGB]{255,119,0},% 设置Keywords样式
		morekeywords={as},% 将特定单词加入Kewords中
		deletekeywords={print},%从 keywords中去除特定单词
		keywordstyle=[2]\color[RGB]{144,0,144},% 设置Builtins样式
		morekeywords=[2]{print},% 将特定单词加入Builtins中
		stringstyle=\color[RGB]{0,170,0},% 设置字符串样式
		commentstyle=\songti\color[RGB]{221,0,0},% 设置注释样式	
		#1
	}
}{}


\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}
% 设置c代码环境
\lstnewenvironment{c++}[1][]{
	\lstset{%
	language=C,
	commentstyle=\color{mygreen},
	deletekeywords={...},
	keywordstyle=\color{blue},
	stringstyle=\color{mymauve},
	#1
 }
}{}
