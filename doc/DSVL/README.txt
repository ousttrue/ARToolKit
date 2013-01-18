DSVL for VC2008 Express Edition(Non ATL version)
(c)2008 nyatla
Version 0.1.0.20050525
http://nyatla.jp/
airmail(at)ebony.plala.or.jp
----------------------------------------------------------------------

このファイルは、DirectShow Video Processing Library(DSVL)Version: 0.0.8
からATL関連のAPIを削除して、VC2008でコンパイルし直したものです。

コンパイル手順が結構面倒なので、特に問題なければbinディレクトリの下の
.dllファイルと、libディレクトリの.libファイルを使ってください。


○使用上の注意

このライブラリは、ARToolKitをVC2008でもコンパイルすることだけを目的に
しており、十分な動作チェックを行っていません。

オリジナルと比較して、メモリリークが発生したり、異常系耐性が低下したり
しているかもしれませんので、十分注意して使用して下さい。




○コンパイル方法について


*****注意***********************************************
難易度が高いので、初心者の方は試さないで下さい。
うっかりすると開発環境を破壊しかねません。
自信の無い方は、知識の有る方と一緒に試してください。
********************************************************


ライブラリのコンパイルには、Windows SDKとDirectX SDKが必要です。
SDKのファイルを書き換えますので、書き換え前には必ずバックアップを
取ってください。


Windows SDK for Windows Server 2008 and .NET Framework 3.5
http://www.microsoft.com/downloads/details.aspx?FamilyID=e6e1c3df-a74f-4207-8586-711ebe331cdc&DisplayLang=en

DirectX SDK - March 2008
http://www.microsoft.com/japan/msdn/directx/downloads.aspx


ダウンロードしたら、Windows SDKを少し修正します。

 Samples\Multimedia\DirectShow\BaseClasses\schedule.h
  dsschedule.hに改名します。
  RefClock.hから参照されているので、ここのincludeも書き換えます。
  (SDK本体に同じ名前の.hが有って、改名しないとコンパイルできないらしい)

 Include\Qedit.h
  下記の例を参考に、IDXEffectクラスの継承を切断します。何箇所かありますので、
  全て修正してください。
  例:IDxtAlphaSetter // : public IDXEffect
  (クラスがなくなったらしいので、継承を切断する必要があるとか…。)


次にSamples\Multimedia\DirectShow\BaseClassesにあるbaseclasses.sln
を実行して、strmbase.libとstrmbasd.libを作り、SDKのLibディレクトリに
コピーして置いてください。


後はDSVLのプロジェクトを開いて、SDKの設定とコンパイルオプション
を設定すれば、dllをコンパイルすることが出来ます。
（環境により異なりますので、自身の環境に合わせて設定してください。）

○ライセンス等

このモジュールのライセンスは、オリジナルのDSVLと同じく、GPLとなります。
