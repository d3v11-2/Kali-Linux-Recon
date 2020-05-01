# Kali-Linux-Recon
It is a combination of NahamSec BBHT and https://github.com/vitalysim/totalrecon
Some are removed because they are already available in kali by default

I recommend to run these commands before running install.sh because alot of repositories are go dependency.In case it is not installed the most tools will not install


apt install golang;
wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
sudo tar -xvf go1.13.4.linux-amd64.tar.gz
sudo mv $HOME/go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
source ~/.bash_profile
