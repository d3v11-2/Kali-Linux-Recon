#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get install -y golang-go build-essential python3 python3-dev  unzip chromium-browser gcc make libpcap-dev python3-pip ruby-full libcurl4-openssl-dev libssl-dev jq libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev libffi-dev python-dev python-setuptools python3-pip python-pip libldns-dev python-dnspython git rename xargs seclists
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

echo "installing bash_profile aliases from recon_profile"
git clone https://github.com/nahamsec/recon_profile.git $HOME/tools/recon_profile
cd $HOME/tools/recon_profile
cat .bash_profile >> ~/.bash_profile
source ~/.bash_profile
cd ~/tools/
echo "done"



#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					GOLatest=$(wget -qO- https://golang.org/dl |grep -oP 'go([0-9.]+).linux-amd64.tar.gz'|head -n 1)
					wget https://golang.org/dl/$GOLatest
					sudo tar -xvf go*.tar.gz
					sudo mv go /usr/local
					mkdir -p $HOME/goprojects
					echo "export GOROOT=/usr/local/go" >> ~/.bashrc
					echo "export GOPATH=$HOME/goprojects" >> ~/.bashrc
					echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" >> ~/.bashrc
					source ~/.bashrc
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi


#Don't forget to set up AWS credentials!
echo "Don't forget to set up AWS credentials!"
apt install -y awscli
echo "Don't forget to set up AWS credentials!"



#create a tools folder in ~/
mkdir ~/tools
cd ~/tools/

#install aquatone
echo "Installing Aquatone"
go get  -u github.com/michenriksen/aquatone
echo "done"

#install chromium
echo "Installing Chromium"
sudo apt install chromium
echo "done"

echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/tools/
echo "done"

echo -e "Installing Fast web fuzzer (ffuf) "
go get -u github.com/ffuf/ffuf
sudo cp $HOME/go/bin/ffuf /usr/local/bin

echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip3 install -r requirements.txt
sudo python3 setup.py install
cd ~/tools/
echo "done"


echo "installing teh_s3_bucketeers"
git clone https://github.com/tomdev/teh_s3_bucketeers.git
cd ~/tools/
echo "done"

echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/
echo "done"


echo "installing lazys3"
git clone https://github.com/nahamsec/lazys3.git
cd ~/tools/
echo "done"

echo "installing virtual host discovery"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/tools/
echo "done"


echo "installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd ~/tools/
echo "done"

echo "installing lazyrecon"
git clone https://github.com/nahamsec/lazyrecon.git
cd ~/tools/
echo "done"

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
echo "done"

echo "installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt
cd ~/tools/
echo "done"

echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "done"

echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "done"

echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done"

echo "installing crtndstry"
git clone https://github.com/nahamsec/crtndstry.git
echo "done"

echo -e "Installing findomain "
    git clone https://github.com/Edu4rdSHL/findomain.git $HOME/tools/findomain
    cd $HOME/tools/findomain && cargo build --release && sudo cp $HOME/tools/findomain/target/release/findomain /usr/local/bin
    sudo rm -r $HOME/tools/findomain

echo -e "Installing Subjack "
go get -u github.com/haccer/subjack
sudo cp $HOME/go/bin/subjack /usr/local/bin

 echo -e "Installing Amass "
    go get -u github.com/OWASP/Amass/...
    sudo cp $HOME/go/bin/amass /usr/local/bin

echo -e "Installing Meg "
    go get -u github.com/tomnomnom/meg
    sudo cp $HOME/go/bin/meg /usr/local/bin
    
echo -e "Installing qsreplace "
    go get -u github.com/tomnomnom/qsreplace
    sudo cp $HOME/go/bin/qsreplace /usr/local/bin
	
echo -e "Installing gitGraber "
    git clone https://github.com/hisxo/gitGraber.git $HOME/tools/gitGraber
    cd $HOME/tools/gitGraber && pip3 install -r requirements.txt
 
echo -e "Installing CRLF-Injection-Scanner "
    git clone https://github.com/random-robbie/CRLF-Injection-Scanner.git $HOME/tools/CRLF-Injection-Scanner
    cd $HOME/tools/CRLF-Injection-Scanner && pip3 install -r requirements.txt
 
echo -e "Installing getJS "
    go get -u github.com/003random/getJS
    sudo cp $HOME/go/bin/getJS /usr/local/bin
    
 echo -e "Installing EyeWitness "
    git clone https://github.com/FortyNorthSecurity/EyeWitness.git $HOME/tools/eyewitness
    cd $HOME/tools/eyewitness/Python/setup && sudo ./setup.sh
    
    
cd ~/tools/
echo "done"

ls $GOPATH/bin
echo "done"

echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la
ls -la $GOPATH/bin

echo "One last time: don't forget to set up AWS credentials in ~/.aws/!"
echo " don't forget to register on https://www.maxmind.com/en/geolite2/signup to generate the license key for asnlookup"

