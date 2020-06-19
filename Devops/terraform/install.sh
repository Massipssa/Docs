
TERRAFOR_ZIP='terraform_0.12.26_linux_amd64.zip'
PROFILE_PATH='/home/massi/.bashrc'

echo ====================================================
echo "[Step-1] --> Download ZIP"
echo ====================================================
wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip -O $TERRAFOR_ZIP

echo ====================================================
echo "[Step-2] --> Extract ZIP"
echo ====================================================

echo "File to extract ${TERRAFOR_ZIP}"
unzip ${TERRAFOR_ZIP}

echo ====================================================
echo "[Step-3] --> Export to PATH"
echo ====================================================

echo -e "\n## Terraform" >> $PROFILE_PATH
echo "export TERRAFOR_HOME=$(pwd)/terraform" >> $PROFILE_PATH
echo "export PATH=\$PATH:\$TERRAFOR_PATH" >> $PROFILE_PATH
source $PROFILE_PATH

