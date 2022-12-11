# `Graduate_Paper_JCU`

## 1、这是一个景德镇陶瓷大学本科毕业论文$$\LaTeX$$模板 

## 2、编辑器配置

### 		1、首先需要前往`https://tug.org/texlive/`下载安装`texlive`环境并添加环境变量

### 		2、使用`VSCode`编辑器编辑，编译配置：

```json
 "latex-workshop.latex.recipes": [
     {
        "name": "xelatex -> bibtex -> xelatex*2",
        "tools": [
            "xelatex",
            "bibtex",
            "xelatex",
            "xelatex"
        ]
      },
      {
        "name": "xelatex",
        "tools": [
            "xelatex"
        ]
      }, 
      {
        "name": "latexmk",
        "tools": [
            "latexmk"
        ]
      }
      ],
      "latex-workshop.latex.tools": [{
      "name": "latexmk",
      "command": "latexmk",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-pdf",
        "%DOC%"
      ]
      }, {
      "name": "xelatex",
      "command": "xelatex",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "%DOC%"
      ]
      }, {
      "name": "pdflatex",
      "command": "pdflatex",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "%DOC%"
      ]
      }, {
      "name": "bibtex",
      "command": "bibtex",
      "args": [
        "%DOCFILE%"
      ]
      }],
      "latex-workshop.view.pdf.viewer": "tab",
      "latex-workshop.latex.clean.fileTypes": [
      "*.aux",
      "*.bbl",
      "*.blg",
      "*.idx",
      "*.ind",
      "*.lof",
      "*.lot",
      "*.out",
      "*.toc",
      "*.acn",
      "*.acr",
      "*.alg",
      "*.glg",
      "*.glo",
      "*.gls",
      "*.ist",
      "*.fls",
      "*.log",
      "*.fdb_latexmk"
      ],
```

## 3、模板导航

### 		0、模板不需要改动

### 		1、 图片、表格、脚注导入在第三章	

### 		2、文献引用在第四章

### 		3、公式在第六章

### 		4、目录、页码自动生成

### 		5、要引用的文献放在`.bib`文件内，内容格式可在知网或者`zotero`导出

### 	

