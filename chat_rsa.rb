require 'openssl'

class RsaTools
	include OpenSSL::PKey

	def rsa_first
		rsa = RSA.generate(2048)#オブジェクト作成

		#RSAのパスフレーズファイル読み込み 適当な数千桁の文字列作っとけばおk
		rsa_gen_key=File.read("rsa_pass.txt", :encoding => Encoding::UTF_8).to_s
		
		#公開鍵取り出し
		public_key = rsa.public_key.to_s
		#秘密鍵取り出し
		private_key = rsa.export(OpenSSL::Cipher::Cipher.new('aes256'),rsa_gen_key)
		
		#書き込み Base64にエンコードする
		File.write("private.dat",private_key)
		File.write("public.dat",public_key)
	end
	
	
	def encode(target_str)	
		public_key=File.read("public.dat", :encoding => Encoding::UTF_8).to_s
		
		rsa_gen_key=File.read("rsa_pass.txt", :encoding => Encoding::UTF_8).to_s
		
		pub = RSA.new(public_key)
	
		enc_target = pub.public_encrypt(target_str)
		return enc_target
	end
	
	def decode(target)
		private_key=File.read("private.dat", :encoding => Encoding::UTF_8).to_s
		rsa_gen_key=File.read("rsa_pass.txt", :encoding => Encoding::UTF_8).to_s
		
		private = RSA.new(private_key,rsa_gen_key)
		return  private.private_decrypt(target)
	end
end
