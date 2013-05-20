#encoding:utf-8
#chat_server.rb
#Copyright (C) α改 @alpha_kai_NET 2012-2013 http://alpha-kai-net.info
#GPLv3 LICENSE
require "socket"
require "pp"
require "base64"
require "kconv"
require_relative "chat_rsa"

VERSION="0.0.1α_FIX05 Server"
PORT=4912#接続ポート　クライアントとサーバーを同じにする必要あり

DEBUG=false

puts "Starting Chat Server"
puts "EasyChatter Version:"+VERSION.to_s+" at PORT:"+PORT.to_s
puts "Copyright (C) α改 @alpha_kai_NET 2012-2013 http://alpha-kai-net.info"

server = TCPServer.new(PORT)

loop do
	begin
		client = server.accept
		puts client.class if DEBUG

		puts Kconv.kconv(Base64.decode64(RsaTools.new::decode(client.recv(1028))),Kconv::UTF8)
	rescue
		next#エラー？なにそれ美味しいの？
	end
end
