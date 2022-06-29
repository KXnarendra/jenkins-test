!/bin/bash





apt update

#Install Miniconda Latest Version(4.13.0)
bash miniconda.sh -f -b -p /opt/conda

#Setting Up Conda
echo "export PATH=/opt/conda/bin:\$PATH" > /root/.bashrc &&
source ~/.bashrc &&
conda init &&
source ~/.bashrc &&
conda update --all --yes &&
conda config --add channels conda-forge &&
conda config --set channel_priority strict &&

conda clean --all --force-pkgs-dirs --yes

#cleaning up the image
apt-get auto-remove -y
rm -f miniconda.sh



