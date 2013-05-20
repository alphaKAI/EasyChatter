#encoding:utf-8
#chat_client.rb
#Copyright (C) α改 @alpha_kai_NET 2012-2013 http://alpha-kai-net.info
#GPLv3 LICENSE
require "socket"
require "pp"
require "kconv"
require "base64"
require_relative "chat_rsa"

VERSION="0.0.1α_FIX05 Client"
PORT=4912#接続ポート クライアントとサーバーを同じにする必要あり

puts "Starting Chat Client"
puts "EasyChatter Version:"+VERSION.to_s+" at PORT:"+PORT.to_s
puts "Copyright (C) α改 @alpha_kai_NET 2012-2013 http://alpha-kai-net.info"

puts "接続先ホスト名を入力して下さい"
print "=>"
url=STDIN.gets.delete("\n")

#アドレス変換とか 単なるかっこつけ 意味は無い
begin
	puts "URL2IPv4..."
	ipadress=IPSocket.getaddress(url)
	puts "Ok"
rescue
	puts "入力されたURL(IP)からIPアドレスへの変換に失敗しました"
	# exit
end
begin
	puts "IPv42URL..."
	Socket.getnameinfo([nil, nil, nil,ipadress])
	puts "Ok"
rescue
	puts "入力されたIPを一度IPに変換し再度URLに変換したところバグりました"
end

puts "表示名を設定して下さい"
print "=>"
name=STDIN.gets.delete("\n")

loop do#何らかのコマンド実装とかでbreak考える
	begin
		#connect
		server = TCPSocket.open(url, PORT)
		# local_server = TCPSocket.open("localhost", PORT)
		#Input
		print "=>"
		str=Kconv.kconv(Base64.encode64("["+name.to_s+"]:"+STDIN.gets.delete("\n").to_s+"    "+Time.now.instance_eval { '%s.%03d' % [strftime('%Y,%m,%d  %H:%M:%S'), (usec / 1000.0).round] }),Kconv::UTF8)
		#Encode&send
		server.puts RsaTools.new::encode(str)
		# local_server.puts str#ローカルの鯖に送信して同期させる的な感じのマジ受ける
		#disconnect
		server.close
		# local_server.close
	rescue
		next#エラー？なにそれ美味しいの？
	end
end