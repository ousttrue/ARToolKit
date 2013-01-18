======================
ARToolKit(reorganized) 
======================
ARToolKit-2.7.1.2とDSVL-0.0.8bをWindowsでビルドしやすいように再編成した。

license
=======
ARToolKitとDSVLに基づいてGPL。

history
=======
* 20130118: 新規。DSVLのiterの修正。DSVL, ARToolKitのdllを作らないようにした。

require
=======
Windows SDK
-----------
Samples/Multimedia/DirectShow/BaseClassesに含まれるstreams.hとビルド結果のstrmbase.libが必要。

Windows SDK(v6.0A/v6.1A)
------------------------
Include/qedit.hが必要。

Windows DDK
-----------
* http://www.microsoft.com/en-us/download/details.aspx?displaylang=en&amp;id=11800
DSVLがatlを使っている。

build
=====
vcのsolutionを生成
::

    > premake4 vs2010
    
vcで普通にビルドする

directory
=========
ar
--
ARToolKit-2.7.1.2のincludeとlib

data
----
ARToolKit-2.7.1.2のbin/Data
DSVL-0.0.8bのmedia

debug
-----
glut32.dll

doc
---
オリジナルのREADMEなど。

dsvl
----
DSVL-0.0.8bのsrc

dsvlsample
----------
DSVL-0.0.8bのsrc/glutSample.cpp

examples
--------
ARToolKit-2.7.1.2のexamples

glut
----
glutのimportライブラリとヘッダ

release
-------
glut32.dll

streams
-------
Samples/Multimedia/DirectShow/BaseClassesのcppとhとqedit.hをここにコピーするべし

tinyxml
-------
DSVL-0.0.8bのextlib/tinyxml

