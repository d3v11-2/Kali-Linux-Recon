# Kali-Linux-Recon
It is a combination of https://github.com/nahamsec/bbht and https://github.com/vitalysim/totalrecon
Some are removed because they are already available in kali by default

I recommend to run these commands before running install.sh because alot of repositories are go dependency.In case it is not installed the most tools will not install


apt install golang;

GOLatest=$(wget -qO- https://golang.org/dl |grep -oP 'go([0-9.]+).linux-amd64.tar.gz'|head -n 1);
wget https://golang.org/dl/$GOLatest


tar -xvf go*.tar.gz
sudo mv go /usr/local
mkdir -p $HOME/goprojects
echo "export GOROOT=/usr/local/go" >> ~/.bashrc
echo "export GOPATH=$HOME/goprojects" >> ~/.bashrc
echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" >> ~/.bashrc
source ~/.bashrc



In case of Zsh user add these line at end of ~/.zshrc
export GOPATH=$HOME/go

export GOROOT=/usr/local/go

export GOBIN=$GOPATH/bin

export PATH=$PATH:$GOPATH

export PATH=$PATH:$GOROOT/bin
