require 'webrick'
require 'webrick/https'
require 'openssl'

cert_name = [
  %w[CN www.just.another.unko.press]
]

root = File.expand_path "."

cert = OpenSSL::X509::Certificate.new File.read "just.another.unko.press.crt"
pkey = OpenSSL::PKey::RSA.new File.read "just.another.unko.press.key"

server = WEBrick::HTTPServer.new(:Port => 8000,
                                :DocumentRoot => root,
                                :SSLEnable => true,
                                :SSLCertificate => cert,
                                :SSLPrivateKey => pkey,
                                :SSLCertName => cert_name)

server.start
