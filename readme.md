# Verify Googlebots

A bash function to verify that a given IP address is not a fake Googlebot and filter your Access Log by those verified same IPs.

The function is based on [this post from JohnMu](https://johnmu.com/fake-googlebots/)

## Installation
```sh
$ git clone https://github.com/NachoSEO/verify-googlebots.git
```

## Usage
1. You need to source the function on your shell
```sh
$ source ./verifyGooglebots.sh ## Location of the file, modify if needed
```

2. Run the function
```sh
$ verifyGooglebots ./input/<accessLogFile>
```

## Example
In the `input` folder you can find an example using fake data.

### Input
Let's imagine a Log file with the following content:
```log
66.249.75.152 - - [10/Sep/2021:14:14:44 +0200] "GET /contenido-latent-semantic-index/amp/ HTTP/2" 200 14847 "-" "Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
142.170.179.34 - - [10/Sep/2021:14:14:54 +0200] "GET /.env HTTP/2" 503 1269 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:77.0) Gecko/20100101 Firefox/77.0"
142.170.179.34 - - [10/Sep/2021:14:14:56 +0200] "GET /wp-content/ HTTP/2" 200 0 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:77.0) Gecko/20100101 Firefox/77.0"
```

### Output
If we run the function we get the following output:
```log
66.249.75.152 - - [10/Sep/2021:14:14:44 +0200] "GET /contenido-latent-semantic-index/amp/ HTTP/2" 200 14847 "-" "Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
```

In the `./output/googlebotaccess.log` you'll find the same Access Log but filtered by the verified Googlebot IPs.
