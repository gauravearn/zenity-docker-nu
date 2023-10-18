do {ifconfig | grep "inet" | awk  '{print $1"\t"$2 }'} | save -f config.txt | open config.txt | split row "\t" | find "127.0.0.1" do {ifconfig | grep "inet" | awk  '{print 
$1"\t"$2 }'} | save -f config.txt | open config.txt | split row "\t"
