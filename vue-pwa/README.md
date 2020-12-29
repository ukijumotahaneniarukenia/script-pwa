サービスワーカーはアンスコでないとだめ

OK
```
service_worker.js
```

NG
```
service-worker.js
```

HTTPSでサーブ

- https://stackoverflow.com/questions/26790727/one-line-https-server

- https://ruby-doc.org/stdlib-2.3.0/libdoc/webrick/rdoc/WEBrick.html#module-WEBrick-label-Starting+an+HTTP+server

- https://ruby-doc.org/stdlib-2.3.0/libdoc/webrick/rdoc/WEBrick.html#module-WEBrick-label-HTTPS

```
$ cd $HOME/script-pwa/vue-pwa

$ ruby -r webrick -r webrick/https -r openssl -e '
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
'
```

ブラウザからアクセス

```
https://www.just.another.unko.press:8000/index.html
```

Linuxのデスクトップアプリとして追加できた

iosのSafariからデスクトップアプリとして追加できた
