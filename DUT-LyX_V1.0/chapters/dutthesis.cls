%==================================================
%% dutthesis.cls for DUT Graduate Thesis(Modified form DUT-thesis-grd.cls)
%% version: 1.0
%% last update: Oct 25th, 2023
%%==================================================

%% math packages -- conflict with xunicode
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs}
% 直立希腊字母字体
\RequirePackage{upgreek}

\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{dutthesis}
  [2023/10/25 v1.0 DUT-thesis-grd document class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\ifDUT@master\DUT@masterfalse
\newif\ifDUT@doctor\DUT@doctorfalse
\newif\ifDUT@istwoside\DUT@istwosidefalse


\DeclareOption{twoside}{\DUT@istwosidetrue}
\DeclareOption{master}{\DUT@mastertrue}
\DeclareOption{doctor}{\DUT@doctortrue}





% 为模板类添加hide选项，当选项为nohide（默认）时，不隐藏信息，当选项为hide时，隐藏指定信息
\newif{\ifHidden}
\DeclareOption{hide}{\Hiddentrue}
\DeclareOption{nohide}{\Hiddenfalse}



\ProcessOptions\relax
\ifDUT@istwoside
\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}
\else
\LoadClass[zihao=-4,a4paper,oneside,openany,UTF8,space=auto]{ctexbook}
\fi

% 匿名处理：替代敏感信息为“*”
\RequirePackage{xstring}
\RequirePackage{forloop}
\newcounter{Num}
\newcommand{\Anon}[1]{
	\ifHidden
	\StrLen{#1}[\StringLen]
	\forloop{Num}{0}{\theNum<\StringLen}{*}
	\else
	#1
	\fi
}
% 隐藏处理：不输出敏感信息
\newcommand{\Hide}[1]{
	\ifHidden
	\else
	#1
	\fi
}


%%
%% the setup of ctex package
%%
%


%%
%% 封面标题
%%
\def\DUT@label@major{学科、~~专业:}
\def\DUT@label@title{论文题目}
\def\DUT@label@author{作~~者~~姓~~名:}
\def\DUT@label@classification{中图分类号：}
\def\DUT@label@confidential{密级}
\def\DUT@label@UDC{UDC\!分类号：}
\def\DUT@label@serialnumber{编号}
\def\DUT@label@thesis{学位论文}
\def\DUT@label@advisor{指~~导~~教~~师:}
\def\DUT@label@advisors{~~~~~~~~~~~~~~~~~~~~~~~}
\def\DUT@label@degree{申~~~~请~~~~学~~~~位}
\def\DUT@label@submitdate{论文提交日期}
\def\DUT@label@defenddate{答~~辩~~日~~期:}
\def\DUT@label@studentnumber{学~~~~~~~~~~~~~~号:}
\def\DUT@label@institute{学~~~~院~~~~名~~~~称}
\def\DUT@label@school{学~位~授~予~单~位}
\def\DUT@label@chairman{答辩委员会主席}

%%
%% 封面内容
%%

\def\DUT@value@classification{}
\def\DUT@value@confidential{}
\def\DUT@value@UDC{}
\def\DUT@value@serialnumber{}
\def\DUT@value@school{}
\def\DUT@value@degree{}
\def\DUT@value@title{~~~~~（论~文~题~目）~~~~~}
\def\DUT@value@vtitle{竖排论文题目}
\def\DUT@value@titlemark{\DUT@value@title}
\def\DUT@value@author{（作~者~姓~名）}
\def\DUT@value@advisor{（姓名、专业技术职务、学位）}
\def\DUT@value@advisors{}
\def\DUT@value@advisorinstitute{（单位）}
\def\DUT@value@major{}
\def\DUT@value@studentnumber{} 
\def\DUT@value@submitdate{}
\def\DUT@value@defenddate{}
\def\DUT@value@institute{}
\def\DUT@value@chairman{}
\def\DUT@label@statement{}


\RequirePackage{ulem}

%% 设置圆圈的格式 或使用\textcircled
\usepackage{tikz}
\usepackage{etoolbox}
\usepackage{pifont}
\newcommand{\circled}[2][]{\tikz[baseline=(char.base)]
    {\node[shape = circle, draw, inner sep = 1pt]
    (char) {\phantom{\ifblank{#1}{#2}{#1}}};
    \node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}

%% 论文原创性声明
\def\DUT@label@original{学位论文原创性申明}
\def\DUT@label@authorization{大连理工大学学位论文版权使用授权书}
\def\DUT@label@authorsign{作~~者~~签~~名~~：}
\def\DUT@label@Supervisorsign{导~~师~~签~~名~~：}
\def\DUT@label@originalDate{日期：}
\def\DUT@label@originaltitle{学位论文题目：}
\def\DUT@label@originalchairman{答辩委员会主席：}
\def\DUT@label@originalcontent{ 除文中已经指明引用的内容外，学位论文不含任何其他个人、法人或者非法人组织已经发表或尚未发表的作品，且学位论文中已经指明作者姓名或者名称、作品名称的内容，不影响该作品的正常使用，也不存在不合理地损害相关权利人的合法权益的任何情形。对学位论文研究做出重要贡献的个人和法人或者非法人组织，均已在论文中以明确方式标明，且不存在任何著作权纠纷。\par 若因声明不实，本人愿意为此承当相应的法律责任。}
\def\DUT@label@authorizationcontent{\DUTspace\DUTspace 本人完全了解大连理工大学有关学位论文知识产权的规定，在校攻读学位期间论文工作的知识产权属于大连理工大学，允许论文被查阅和借阅。学校有权保留论文并向国家有关部门或机构送交论文的复印件和电子版，可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印、或扫描等复制手段保存和汇编本学位论文。}


%%
%% 英语封面标题
%%
\def\DUT@label@englishadvisor{Supervisor:}
\def\DUT@label@englishstatement{Submitted in total fulfilment
  of the requirements for the degree of \DUT@value@englishdegree \\
  in \DUT@value@englishmajor}
\def\DUT@label@englishauthor{Candidate Name:}
\def\DUT@label@englishadvisor{Faculty Mentor:}
\def\DUT@label@englishchairman{Chair, Thesis Committee:}
\def\DUT@label@englishinstitute{School or Department:}
\def\DUT@label@englishdegree{Degree Applied:}
\def\DUT@label@englishmajor{Major:}
\def\DUT@label@englishschool{Degree by:}
\def\DUT@label@englishdate{The Date of Defence:}


%%
%% 英语封面内容
%%
\def\DUT@value@englishtitle{(English Title of Thesis)}
\def\DUT@value@englishauthor{(Author Name)}
\def\DUT@value@englishadvisor{(Supervisor Name)}
\def\DUT@value@englishinstitute{(Institute Name)}
\def\DUT@value@englishscholl{(DUT)}
\def\DUT@value@englishchair{(someone)}
\def\DUT@value@englishdate{}
\def\DUT@value@englishdegree{}
\def\DUT@value@englishmajor{}



\def\DUT@label@abstract{摘~~~~~~要}
\def\DUT@label@keywords{关键词：}
\def\DUT@label@englishkeywords{Key Words:~}
\def\DUT@label@tableofcontents{目~~~~录}
\def\DUT@label@conclusion{结论}
\def\DUT@label@appendix{附录}
\def\DUT@label@publications{攻读{\DUT@value@degree}学位期间科研项目及科研成果}
\def\DUT@label@projects{攻读学位期间参与的项目}
\def\DUT@label@resume{作者简介}
\def\DUT@label@reference{参考文献!!!!}
\def\DUT@label@thanks{致谢}
\def\DUT@value@templateversion{v1.2}
%%
%% label in the head 页眉页脚
%%
\def\DUT@label@headschoolname{大连理工大学{\DUT@value@degree}学位论文}

%% 当前模板的版本
\newcommand{\version}{\DUT@value@templateversion}

%%==============引用geometry 宏包设置纸张和页面========================
%设置版面:上3.5cm，下2.5cm，左2.7cm，右2.7cm，页眉2.5cm，页脚1.8cm，装订线0cm
\usepackage[%
paper=a4paper,%
top=3.5cm,% 上 3.5cm %
bottom=2.5cm,% 下 2.5cm %
left=2.7cm,% 左 2.7cm %
right=2.7cm,% 右 2.7cm %
headheight=0.50cm,% 页眉 0.5cm %
footskip=1.47cm% 页脚 1.47cm %
]{geometry} % 页面设置 %
%% =========================================================

%\parskip 0.5ex plus 0.25ex minus 0.25ex
%% Command -- Clear Double Page
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
%设置行距，大概为22榜
\RequirePackage{setspace}
\setstretch{1.35}
%\setlength{\baselineskip}{19.5bp}

%页眉线宽度
%\usepackage{fancyhdr}
%\renewcommand\headrulewidth{1pt}

%\setCJKmainfont[Path="fonts/",BoldFont={STZhongsong}]{STSong}

%% 设置章节格式
\ctexset{chapter={
      name = {},
      number = {\arabic{chapter}},
      format = { \CTEXifname{\raggedright\heiti\zihao{3}}{\centering\heiti\zihao{-3}}},,
      pagestyle = {DUT@headings},
      beforeskip =12bp,
      afterskip = 28bp,
      fixskip = true,
  }
}
%% 设置一级章节格式

\ctexset{section={
  format={  \heiti \zihao{4}},
  beforeskip = 12bp ,
  afterskip = 8bp ,
  fixskip = true,
  }
}

% 设置二级标题格式

\ctexset{subsection={
   format = { \raggedright \heiti\zihao{-4}},
   beforeskip =8bp,
   afterskip = 6bp,
   fixskip = true,
   }
}


\usepackage{titlesec}
\ctexset{subsubsection={
		name = {(,)},
		number = {\arabic{subsubsection}},
		format = {\raggedright\heiti\zihao{-4}},
		beforeskip =8bp,
		afterskip = 6bp,
		fixskip = true,
	}
}

%% 设定目录格式。目录颜色更改黑色
\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{toe}{\protect\hypersetup{hidelinks}}
\addtocontents{lot}{\protect\hypersetup{hidelinks}}
\addtocontents{lof}{\protect\hypersetup{hidelinks}}

\RequirePackage{titletoc}
%章节中文目录显示格式
\titlecontents{chapter}[0pt]{\songti \zihao{-4}}
    {\thecontentslabel\hspace{0.1\ccwd}}{}
    {\hspace{0em}\titlerule*{.}\contentspage}
\titlecontents{section}[2\ccwd]{\songti \zihao{-4}}
    {\thecontentslabel\hspace{0.4\ccwd}}{}
    {\hspace{0em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[4\ccwd]{\songti \zihao{-4}}
    {\thecontentslabel\hspace{0.5\ccwd}}{}
    {\hspace{0em}\titlerule*{.}\contentspage}
%图表中文目录显示格式
\titlecontents{figure}[0pt]{\songti\zihao{-4}}
    {图\thecontentslabel~~}{\hspace*{-1.5cm}}
    {\hspace{0em}\titlerule*{.}\hspace{-0.5em}\contentspage}

\titlecontents{table}[0pt]{\songti\zihao{-4}}
    {表\thecontentslabel~~}{\hspace*{-1.5cm}}
    {\hspace{0em}\titlerule*{.}\hspace{-0.5em}\contentspage}


%% 选择编译
\RequirePackage{ifthen}

%% check pdfTeX mode
\RequirePackage{ifpdf}

%% fancyhdr 页眉页脚控制
\RequirePackage{fancyhdr}

% 空 页眉页脚
\fancypagestyle{DUT@empty}{%
  \fancyhf{}}

%======正文页眉页脚=================
\fancypagestyle{DUT@headings}{%
  \fancyhf{}
  \fancyfoot[C]{\songti\zihao{5} \thepage}
  \fancyhead[CO]{\zihao{5}{\songti 大连理工大学{\DUT@value@degree}学位论文}}
  \fancyhead[CE]{\zihao{5}{\songti \DUT@value@title}}
  }

%==================================对于openright 选项，必须保证章页右开，且如果前章末页内容须清空其页眉页脚。===================
\let\DUT@cleardoublepage\cleardoublepage
\newcommand{\DUT@clearemptydoublepage}{%
	\clearpage{\pagestyle{DUT@empty}\DUT@cleardoublepage}}
\let\cleardoublepage\DUT@clearemptydoublepage

 %================修改frontmatter 的页码为大写罗马格式，并调整页面风格===============
\renewcommand{\frontmatter}{
 \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{DUT@headings}
}
%=======================修改mainmatter 的页码为阿拉伯格式，并调整页面风格========================
\renewcommand{\mainmatter}{
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{DUT@headings}
}


%% 复杂表格
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}


%% 定义几个常用的数学常量符号
\newcommand{\me}{\mathrm{e}} %定义 对数常数e，虚数符号i,j以及微分算子d为直立体。
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\,\mathrm{d}} 

\theoremstyle{definition}
  \newtheorem{algo}{算法~}[chapter]
  \newtheorem{thm}{定理~}[chapter]
  \newtheorem{lem}[thm]{引理~}
  \newtheorem{prop}[thm]{命题~}
  \newtheorem{cor}[thm]{推论~}
\theoremstyle{definition}
  \newtheorem{defn}{定义~}[chapter]
  \newtheorem{conj}{猜想~}[chapter]
  \newtheorem{exmp}{例~}[chapter]
  \newtheorem{rem}{注~}
  \newtheorem{case}{情形~}
\renewcommand{\proofname}{\bf 证明}

%% 英文字体使用 Times New Roman
\RequirePackage{xltxtra} % \XeTeX Logo
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}

\usepackage{setspace}

%% graphics packages
\RequirePackage{graphicx}
%% 并列子图
\RequirePackage{subfig}
\RequirePackage{makecell}
\RequirePackage{wrapfig}
%%===========================设置图表标题选项==========================
\RequirePackage{amsmath}
\RequirePackage{caption}


\usepackage[justification=centering]{caption}

\usepackage[lang=english,list=off]{bicaption}

\captionsetup[figure][bi-first]{name=图}
\captionsetup[figure][bi-second]{name=Fig.}
\captionsetup[table][bi-first]{name=表}
\captionsetup[table][bi-second]{name=Tab.}



% 定公式、图、表编号为"3.1"的形式
\renewcommand\theequation{\arabic{chapter}.\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}


%% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}


\usepackage{booktabs}
\RequirePackage{tabularx}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{1\ccwd}}
\DeclareCaptionFont{fontsize}{\songti\zihao{5}}
\captionsetup{
  font = {fontsize},
  labelsep = zhspace,
}

\captionsetup[table]{
  position = top,
  aboveskip = 6bp,
  belowskip = 6bp,
}
\numberwithin{table}{chapter}
\captionsetup[figure]{
  position = bottom,
  aboveskip = 6bp,
  belowskip = 6bp,
}


%% sort and compress citations
\RequirePackage[numbers,square,comma,super,sort&compress]{natbib}
% 上标引用
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}


% 将浮动参数设为较宽松的值
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}




% 颜色宏包
\RequirePackage{xcolor}
\usepackage{float}

% 中文破折号
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

% listings 源代码显示宏包
\RequirePackage{listings}
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle=\footnotesize, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em
}
\renewcommand{\lstlistingname}{代码} %% 重命名Listings标题头

\usepackage{algorithm}
\usepackage{algorithmicx}
\usepackage{algpseudocode}
\renewcommand{\algorithmicrequire}{\textbf{Input:}}  % Use Input in the format of Algorithm
\renewcommand{\algorithmicensure}{\textbf{Output:}} % Use Output in the format of Algorithm
\renewcommand\thealgorithm{\thechapter.\arabic{algorithm}}

%% hyperref package

%\RequirePackage{hyperref}
%%\definecolor{navyblue}{RGB}{0,0,128}   %增加海军蓝颜色
%\hypersetup{
%  bookmarksnumbered,%
%  linktoc=all,
%  colorlinks=true,
%  citecolor=black,
%  filecolor=cyan,
%  linkcolor=black,
%  linkbordercolor=black,
%  urlcolor=black,
%  plainpages=false,%
%  pdfstartview=FitH
%}

%% enumerate 列表环境间距调节
\usepackage{enumitem}
\usepackage{supertabular} \setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
% \setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
% \setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}

%_  参考文献风格 
%\bibliographystyle{GBT7714-2005NLang}
\usepackage[numbers,sort&compress]{natbib}

%_ DUTspace
%\newcommand\DUTspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\newcommand{\DUTspace}[1][1]{\hspace{#1\ccwd}}

\def\DUT@getfileinfo#1 #2 #3\relax#4\relax{%
  \def\DUTfiledate{#1}%
  \def\DUTfileversion{#2}%
  \def\DUTfileinfo{#3}}%
\expandafter\ifx\csname ver@dutmaster-xetex.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_dutmaster-xetex.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@dutmaster-xetex.cls\endcsname}
\fi
\expandafter\DUT@getfileinfo\reserved@a\relax? ? \relax\relax
\def\DUT@underline[#1]#2{%
  \underline{\hbox to #1{\hfill#2\hfill}}}
\def\DUTunderline{\@ifnextchar[\DUT@underline\underline}

%%%%中文标题页的可用命令
\newcommand\classification[1]{\def\DUT@value@classification{#1}}
\newcommand\studentnumber[1]{\def\DUT@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\DUT@value@confidential{#1}}
\newcommand\UDC[1]{\def\DUT@value@UDC{#1}}
\newcommand\serialnumber[1]{\def\DUT@value@serialnumber{#1}}
\newcommand\school[1]{\def\DUT@value@school{#1}}
\newcommand\degree[1]{\def\DUT@value@degree{#1}}
\renewcommand\title[1]{\def\DUT@value@title{#1}}

\newcommand\vtitle[1]{\def\DUT@value@vtitle{#1}}
\renewcommand\author[1]{\def\DUT@value@author{#1}}
\newcommand\advisor[1]{\def\DUT@value@advisor{#1}}
\newcommand\advisors[1]{\def\DUT@value@advisors{#1}}
\newcommand\advisorinstitute[1]{\def\DUT@value@advisorinstitute{#1}}
\newcommand\major[1]{\def\DUT@value@major{#1}}
\newcommand\submitdate[1]{\def\DUT@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\DUT@value@defenddate{#1}}
\newcommand\institute[1]{\def\DUT@value@institute{#1}}
\newcommand\chairman[1]{\def\DUT@value@chairman{#1}}



% English Title Page
% 英文标题页可用命令
\newcommand\englishtitle[1]{\def\DUT@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\DUT@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\DUT@value@englishadvisor{#1}}
\newcommand\englishschool[1]{\def\DUT@value@englishschool{#1}}
\newcommand\englishinstitute[1]{\def\DUT@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\DUT@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\DUT@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\DUT@value@englishmajor{#1}}
\newcommand\englishchairman[1]{\def\DUT@value@englishchairman{#1}}


%% 第一页和第二页
%_ “绘制”DUT中文标题页

\setCJKfamilyfont{xkai}{STXingkai}
\newcommand{\xkai}{\CJKfamily{xkai}}


\setCJKmainfont[BoldFont=STZhongsong, ItalicFont=STKaiti]{STSong}
%\setCJKsansfont[BoldFont=STHeiti]{STXihei}
%\setCJKmonofont{STFangsong}


%\newCJKfontfamily[stsong]\songti[BoldFont=STZhongsong, ItalicFont=STKaiti]{STSong}
%\newCJKfontfamily[sthei]\heiti[BoldFont=STHeiti]{STXihei}
%\newCJKfontfamily[stkai]\kaishu{STKaiti}
%\newCJKfontfamily[stfang]\fangsong{STFangsong}
%\newCJKfontfamily[stli]\lishu{STLiti}




\renewcommand\maketitle[1]%
 {
  \cleardoublepage
  \thispagestyle{empty}



   \begin{center}
   \vskip \stretch{1}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}



    \parbox[t][4.40cm][c]{\textwidth}
    {
    	\begin{center}
    		{\songti\zihao{-1}\bfseries{\DUT@value@degree}\bfseries{学位论文}\\}
    		\vspace{1.34cm}
    		{\heiti\zihao{2}\bfseries{\DUT@value@title}\\}
    		\vspace{0.13cm}
    		{\zihao{3}\textbf{\DUT@value@englishtitle}\\}
    	\end{center}
    }
      \vspace{50.2mm}

{\songti\zihao{-3}\DUT@label@author}\DUTunderline[170pt]{\songti\zihao{-3}{\Anon{\DUT@value@author}}}
\vskip 10pt
{\songti\zihao{-3}\DUT@label@studentnumber}\DUTunderline[170pt]{\songti\zihao{-3}{\Anon{\DUT@value@studentnumber}}}
\vskip 10pt 
{\songti\zihao{-3}\DUT@label@advisor}\DUTunderline[170pt]{\songti\zihao{-3}{\Anon{\DUT@value@advisor}}}
\vskip 10pt 
{\songti\zihao{-3}\DUT@label@advisors}\DUTunderline[170pt]{\songti\zihao{-3}{\Anon{\DUT@value@advisors}}}
\vskip 10pt 
{\songti\zihao{-3}\DUT@label@major}\DUTunderline[170pt]{\songti\zihao{-3}{\DUT@value@major}}
\vskip 10pt 
{\songti\zihao{-3}\DUT@label@defenddate}\DUTunderline[170pt]{\songti\zihao{-3}{\DUT@value@defenddate}}
     \\ \vspace{31.4mm}
      {\Large\xkai 大连理工大学\\}
      \vspace{2.3mm}
      {\zihao{-4} Dalian University of Technology}
  \end{center}

  \vskip \stretch{0.5}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}






% 原创性声明
\newcommand\makeDeclareOriginal[2]{%
  \cleardoublepage
  \pdfbookmark[0]{声明}{statement}
  \thispagestyle{empty}
  %\fancyhf{}
  \begin{center}
  	\parbox[t][1.52cm][c]{\textwidth}
  {\heiti\zihao{-2}\centerline \DUT@label@original}
  \end{center}
  \vskip 10pt
  {\songti\zihao{-4}#1\DUT@label@originalcontent}
  \vskip 10pt
  {\songti\zihao{-4}\DUT@label@originaltitle}\DUTunderline[303pt]{\DUT@value@title}
  \vskip 3pt
  \indent{\songti\zihao{-4}\DUT@label@authorsign} \DUTunderline[10.65em]{\Anon{\includegraphics[height=0.8cm]{figures/figure2}}}  {\songti\zihao{-4}\DUT@label@originalDate}\DUTunderline[10.9em]{\DUT@value@defenddate}

  \vskip 20mm

  \begin{center}
  {\heiti\zihao{-2} \DUT@label@authorization}
  \end{center}
  \vskip 10pt
  {\songti\zihao{-4} \DUT@label@authorizationcontent}
  \vskip 25pt

 {\songti\zihao{-4}\DUT@label@originaltitle}\DUTunderline[303pt]{\DUT@value@title}
 \vskip 3pt
 \indent{\songti\zihao{-4}\DUT@label@authorsign} \DUTunderline[10.65em]{\Anon{\includegraphics[height=0.8cm]{figures/figure2}}}  {\songti\zihao{-4}\DUT@label@originalDate}\DUTunderline[10.9em]{\DUT@value@defenddate}
 \vskip 3pt
 \indent{\songti\zihao{-4}\DUT@label@Supervisorsign} \DUTunderline[10.65em]{\Anon{\includegraphics[height=0.8cm]{figures/figure1}}}  {\songti\zihao{-4}\DUT@label@originalDate}\DUTunderline[10.9em]{\DUT@value@defenddate}
 \vskip 3pt
 %\indent{\songti\zihao{-4}\DUT@label@originalchairman} \DUTunderline[10.65em]{\includegraphics[height=0.8cm]{figures/figure1}}  {\songti\zihao{-4}\DUT@label@originalDate}\DUTunderline[10.9em]{\DUT@value@defenddate}

  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}


% 页眉页脚
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\songti \zihao{5} \DUT@label@headschoolname}  % 奇数页左页眉
\fancyfoot[C]{\songti \zihao{5} {\thepage}}      % 页脚


\fancypagestyle{plain}{% 设置开章页页眉页脚风格(只有页码作为页脚)
  \fancyhf{}%
  \fancyfoot[C]{\songti \zihao{5} \DUT@label@headschoolname}
  \fancyfoot[C]{\songti \zihao{5} ~---~{\thepage}~---~} %%首页页脚格式
}


 % 中文摘要
 \newenvironment{abstract}
 {
  \cleardoublepage
  \chapter{\DUT@label@abstract}
  \addcontentsline{toe}{chapter}{Abstract}     %加入英文目录
 }
 {}
%下一页从偶数页开始
 \newcommand\beginatevenpage{
 \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
 }
 % 中文关键词
 \newcommand\keywords[1]{%
   \vspace{2ex}\indent{\heiti\zihao{-4} \DUT@label@keywords} #1}

 % 英文摘要
 \newenvironment{englishabstract}
 {
  \clearpage
  \chapter{ABSTRACT}
 }
 {}

 % 英文关键词
 \newcommand\englishkeywords[1]{%
  \vspace{2ex}\indent{\bf\zihao{-4} \DUT@label@englishkeywords} #1}


%_ 目录
\renewcommand\tableofcontents{%
  \if@twocolumn
  \@restonecoltrue\onecolumn
  \else
  \@restonecolfalse
  \fi
  \chapter*{\contentsname}%目录里显示“目录”，否则\chapter*
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
  \pdfbookmark[0]{目录}{bittoc}
  \@starttoc{toc}%
  \if@restonecol\twocolumn\fi
}

\def\engcontentsname{TABLE OF CONTENTS}
\renewcommand\engcontentsname{\bf\zihao{-3} \hfill TABLE OF CONTENTS \hfill}
\newcommand\tableofengcontents{
	\@restonecolfalse
	\chapter*{\engcontentsname  %chapter*上移一行，避免在toc中出现。
		\@mkboth{%
			\engcontentsname}{\engcontentsname}}
	\addcontentsline{toc}{chapter}{TABLE OF CONTENTS}
	\@starttoc{toe}%
	\if@restonecol\twocolumn\fi
}
%---================ 目录汇总定义===================
\newcommand\settableofcontents[5]{
\cleardoublepage
\renewcommand\contentsname{#1}
\tableofcontents
\addcontentsline{toe}{chapter}{Table of Contents} %加入英文目录
\cleardoublepage
\renewcommand\engcontentsname{\bf\zihao{-3} \hfill #2 \hfill}
\tableofengcontents

\cleardoublepage
\renewcommand\listfigurename{#3}
\listoffigures
\addcontentsline{toc}{chapter}{图~目~录}      %加入中文目录
\addcontentsline{toe}{chapter}{List of Figures}  %加入英文目录

\cleardoublepage
\renewcommand\listtablename{#4}
\listoftables
\addcontentsline{toc}{chapter}{表~目~录}      %加入中文目录
\addcontentsline{toe}{chapter}{List of Tables}  %加入英文目录
}




\newcommand\ToCNames[5]{%

\renewcommand\contentsname{#1}

\renewcommand\engcontentsname{\bf\zihao{-3} \hfill #2 \hfill}

\renewcommand\listfigurename{#3}

\renewcommand\listtablename{#4}
}

\newcommand\DUTtableofcontents[1]{%
\renewcommand\contentsname{#1}
\tableofcontents
\addcontentsline{toe}{chapter}{Table of Contents} %加入英文目录
}

\newcommand\DUTtableofengcontents[1]{%
\renewcommand\engcontentsname{\bf\zihao{-3} \hfill #1 \hfill}
\tableofengcontents
}


\newcommand\DUTlistoffigures[1]{%
\renewcommand\listfigurename{#1}
\listoffigures
\addcontentsline{toc}{chapter}{图~目~录}      %加入中文目录
\addcontentsline{toe}{chapter}{List of Figures}  %加入英文目录
}



\newcommand\DUTlistoftables[1]{%
\renewcommand\listtablename{#1}
\listoftables
\addcontentsline{toc}{chapter}{表~目~录}      %加入中文目录
\addcontentsline{toe}{chapter}{List of Tables}  %加入英文目录
}



%_ 参考文献环境
\renewenvironment{thebibliography}[1]
     {\songti\zihao{5}
      \chapter*{参~~考~~文~~献}%参~~考~~文~~献
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \addcontentsline{toc}{chapter}{参考文献}
      \addcontentsline{toe}{chapter}{References}
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \setlength{\parsep}{1mm}
            \setlength{\labelsep}{0.5em}
            \setlength{\itemsep}{0.05pc}
            \setlength{\listparindent}{0in}
            \setlength{\itemindent}{0in}
            \setlength{\rightmargin}{0in}
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

%%%%%%===========附录环境===========

%\renewcommand\appendix[1]{\par
%    \renewcommand\thechapter{\Alph{chapter}}  %改章的编号
%    \setcounter{chapter}{0}
%    \setcounter{section}{0}
%    \renewcommand\thefigure{\Alph{chapter}.\arabic{figure}}
%    \renewcommand\thetable{\Alph{chapter}.\arabic{table}}
%    \renewcommand\appendixname{附~录}
%   % \addcontentsline{toc}{chapter}{\appendixname\protect\numberline{\csname thechapter\endcsname}#1}
%    }


\newcommand\setappendix[2]{%
	\renewcommand\appendixname{#1}
	\renewcommand\thefigure{\Alph{chapter}.\arabic{figure}}
	\renewcommand\thetable{\Alph{chapter}.\arabic{table}}
	\renewcommand\theequation{\Alph{chapter}.\arabic{equation}}
	}

\newenvironment{DUTappendix}{%
%  	\ifodd\c@page
%  	\else
%  	\clearpage
%  	\phantom{s}
%  	\thispagestyle{empty}
%  	\fi
	\renewcommand\appendixname{附录}
	\renewcommand\thefigure{\Alph{chapter}.\arabic{figure}}
	\renewcommand\thetable{\Alph{chapter}.\arabic{table}}
	\renewcommand\theequation{\Alph{chapter}.\arabic{equation}}
	}
{}

\newenvironment{DUTspecial}{%
		}
{}

  \newenvironment{publications}
  { 
  	\ifodd\c@page
  	\else
  	\clearpage
  	\phantom{s}
  	\thispagestyle{empty}
  	\fi
  	\chapter*{攻读{\DUT@value@degree}学位期间科研项目及科研成果}
  	\addcontentsline{toc}{chapter}{攻读{\DUT@value@degree}学位期间科研项目及科研成果}
  	\addcontentsline{toe}{chapter}{Achievements}}
  {}


\newenvironment{projects}[1]
     {\chapter{\DUT@label@projects}%
      \@mkboth{\MakeUppercase\DUT@label@projects}
              {\MakeUppercase\DUT@label@projects}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `projects' environment}}%
      \endlist}



    \newenvironment{resume}
  { 
  	\ifodd\c@page
  	\else
  	\clearpage
  	\phantom{s}
  	\thispagestyle{empty}
  	\fi
  	\chapter*{作者简介}
  	\addcontentsline{toc}{chapter}{作者简介}
  	\addcontentsline{toe}{chapter}{CV}}
  {}

  

\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
   {\endlist}

\newenvironment{resumeli}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
   {\endlist}

\newenvironment{conclusion}
  {\chapter*{结论}
    \@mkboth{结论}{结论}%
    \addcontentsline{toc}{chapter}{结论}}
  {}
  

\renewenvironment{thanks}
  { \ifodd\c@page
  	\else
  	\clearpage
  	\phantom{s}
  	\thispagestyle{empty}
  	\fi
  	\chapter*{致~~~~~~谢}
  	\addcontentsline{toc}{chapter}{致谢}
  	\addcontentsline{toe}{chapter}{Acknowledgements}
   }
  {}


  

\newenvironment{symbolnote}
  {\chapter{\DUT@label@symbolnote}
  \fangsong}
  {}






  %%%============================术语=====================
 \newenvironment{denotation}
{\chapter{主要符号表}}
{}
%====增加化学、国际单位宏包
     \RequirePackage[version=4]{mhchem}
     \RequirePackage{siunitx}
\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)






  %%%===================自定义段落样式（英文章节name和目录counter）=====================

\newcommand{\ChapterCenter}[1]
{
		\chapter*{#1}
		\addcontentsline{toc}{chapter}{#1}  
		\markboth{#1}{#1}
}
\newcommand{\enChapter}[1]
{
		\addcontentsline{toe}{chapter}{\protect\numberline{\csname thechapter\endcsname}#1}		
}
\newcommand{\enChapterUnum}[1]
{
		\addcontentsline{toe}{chapter}{#1}		
}
\newcommand{\enSection}[1]
{
		\addcontentsline{toe}{section}{\protect\numberline{\csname thesection\endcsname}#1}		
}
\newcommand{\enSectionUnum}[1]
{
		\addcontentsline{toe}{section}{#1}		
}
\newcommand{\enSubsection}[1]
{
		\addcontentsline{toe}{subsection}{\protect\numberline{\csname thesubsection\endcsname}#1}		
}
\newcommand{\enSubsectionUnum}[1]
{
		\addcontentsline{toe}{subsection}{#1}		
}


%%%===============其他设置==================

\sloppy  %可以减少“overfull boxes”。


\endinput
%%
%% End of file `dutmaster-xetex.cls'.
