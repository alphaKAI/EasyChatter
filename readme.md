EasyChatter
===========


概要
----------
Ruby製　RSA暗号化対応簡易チャットソフト  
適当な作りのため内部処理がOSのエンコードに依存したままなので  
異なるプラットフォームだと2バイト文字(日本語とか)が使えません  
例:WindowsとLinux間でのチャット等
  
  
機能
----------
*RSA暗号化によるセキュアな通信  
  
  
使い方
----------
初回起動する前に数千桁のランダムな半角英数字の羅列を作ってください  
んなもん面倒なんじゃふざけんなな人はこれをどうぞ  
っhttps://github.com/alphaKAI/easy_pass_gen  
α改が昔作ったツールです()  
適当にコンパイルして実行すれば桁数が求められるので31730とかそんな感じに打ち込むと  
Windowsならクリップボードにコピーするか聞かれるのでコピーしてファイル作って貼り付けてください  
それから一回chat_client.rbをエディタで開いてください  
ちなみに先ほどのファイルはrsa_pass.txtという名前で本体と同じディレクトリに設置してください  
RsaTools.new::rsa_first  
exit  
というのを  
require_relative "chat_rsa"  
の下に追記して下さいそうしてからCMDでEasyChatterのディレクトリに移動して  
ruby 
chat_client.rbとするとすぐ終了すると思うので終了したらもう一度エディタを開き  
先ほど追記した二行を消して保存すれば完了です  
public.datとprivate.datができていると思うので、それができていれば準備は完了です  
チャット相手にそのファイルを渡してください(暗号化用のファイルなので取り扱いにはご注意ください)  
そして双方でchat_clientとchat_serverを起動してそれからお互いのグローバルIPを打ち込んでください  
ちなみに事前に4912ポートを開放しておく必要があります  
UPnPあたりが楽でしょう  
  
  
LICENCE
--------
GPLv3 LICENCE  
Copyright (C) α改 @alpha_kai_NET 2012-2013 http://alpha-kai-net.info  
  
  
動作環境及び開発環境
--------------------
Windows/Linux/UNIX/OSX/BSDなどのRubyインタプリタが動く環境であれば動きます  
Windows8Pro 64bit  
ArchLinux x86_64  
UbuntuServer12.10 64bit  
ruby 1.9.3p327 (2012-11-10) [i386-mingw32]  
ruby 1.9.3p429 (2013-05-15 revision 40747) [x86_64-linux]  
で確認しています  
  
  
作者 WEB SITE
-------------------
個人ブログ <http://blog.alpha-kai-net.info>   
HP <http://alpha-kai-net.info>  
Twitter <http://twitter.com/alpha_kai_NET>  
Github <https://github.com/alphaKAI>  
Mail to <alpha.kai.net@alpha-kai-net.info>  
  
  
Copyright (C) α改 @alpha_kai_NET 2012-2013 http://alpha-kai-net.info

