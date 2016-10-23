echo "----" >>teste_yarn_npm.txt
date >> teste_yarn_npm.txt
npm install -g yarn
npm install -g gnomon
npm --version | awk '{print "npm version "$0}' >> teste_yarn_npm.txt
node --version | awk '{print "node version "$0}' >> teste_yarn_npm.txt
yarn --version | awk '{print "yarn version "$0}' >> teste_yarn_npm.txt

#npm sem cache sem Lockfile/Shrinkwrap sem node_modules
npm cache clean
rm -f npm-shrinkwrap.json
rm -rf node_modules
npm install | gnomon type=elapsed-total > npm_install_sem_cache_sem_lock_file_sem_node_modules.log | tail -n 1  | awk '{print "npm install sem cache sem shrinkwrap sem node_modules -> "$0}' >> teste_yarn_npm.txt

#Yarn sem cache sem lockfile/Shrinkwrap sem node_modules
yarn cache clean
rm -f npm-shrinkwrap.json
rm -f yarn.lock
rm -rf node_modules
yarn | gnomon --type=elapsed-total > yarn_install_sem_cache_sem_lock_file_sem_node_modules.log | tail -n 1 | awk '{print "yarn install sem cache sem lockfile sem node_modules -> "$0}' >> teste_yarn_npm.txt

#NPM sem cache com lockfile/shrinkwrap sem node_modules
npm cache clean
rm -rf node_modules/
npm shrinkwrap
npm install | gnomon type=elapsed-total > npm_install_sem_cache_com_lock_file_sem_node_modules.log | tail -n 1 | awk '{print "npm install sem cache com shirinkwrap sem node_modules-> "$0}' >> teste_yarn_npm.txt

#Yarn sem cache com lockfile/shrinkwrap sem node_modules
yarn cache clean
rm -f npm-shrinkwrap.json
rm -rf node_modules/
yarn | gnomon --type=elapsed-total > yarn_install_sem_cache_com_lock_file_sem_node_modules.log | tail -n 1 | awk '{print "yarn install sem cache com lock sem node_modules-> "$0}' >> teste_yarn_npm.txt

#npm sem cache sem Lockfile/Shrinkwrap com node_modules
rm -rf node_modules
#rodando npm install para gerar o node_modules pelo npm
npm install 
npm cache clean
rm -f npm-shrinkwrap.json
npm install | gnomon type=elapsed-total > npm_install_sem_cache_sem_lock_file_com_node_modules.log | tail -n 1  | awk '{print "npm install sem cache sem shrinkwrap com node_modules -> "$0}' >> teste_yarn_npm.txt

#Yarn sem cache sem lockfile/Shrinkwrap com node_modules
rm -rf node_modules
#rodando yarn para gerar o node_modules pelo yarn
yarn 
yarn cache clean
rm -f yarn.lock
yarn | gnomon --type=elapsed-total > yarn_install_sem_cache_sem_lock_file_com_node_modules.log | tail -n 1 | awk '{print "yarn install sem cache sem lockfile com node_modules -> "$0}' >> teste_yarn_npm.txt


#npm sem cache com Lockfile/Shrinkwrap com node_modules
rm -rf node_modules
#rodando npm install para gerar o node_modules pelo npm
npm install 
npm cache clean
npm shrinkwrap
npm install | gnomon type=elapsed-total > npm_install_sem_cache_com_lock_file_com_node_modules.log | tail -n 1  | awk '{print "npm install sem cache com shrinkwrap com node_modules -> "$0}' >> teste_yarn_npm.txt

#Yarn sem cache com lockfile/Shrinkwrap com node_modules
rm -rf node_modules
#rodando yarn para gerar o node_modules pelo yarn
yarn 
yarn cache clean
yarn | gnomon --type=elapsed-total > yarn_install_sem_cache_com_lock_file_com_node_modules.log | tail -n 1 | awk '{print "yarn install sem cache com lockfile com node_modules -> "$0}' >> teste_yarn_npm.txt



echo "----" >>teste_yarn_npm.txt

cat teste_yarn_npm.txt