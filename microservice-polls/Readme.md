This repo is copied from https://github.com/callicoder/spring-security-react-ant-design-polls-app, with some of my modifications:
1. split into modules
2. use mysql database and initiate a user and poll   
3. remove the request to manifest.json

Steps running this example in aks:
1. install kubectl, helm
2. create mysql using helm:
    `helm install stable/mysql`
3. run the following command to set mysql hostname/password(please replace `knotted-pronghorn-mysql` to your service name):`
    ```
    export MYSQL_HOST=knotted-pronghorn-mysql
    export MYSQL_PASSWORD=$(kubectl get secret --namespace default knotted-pronghorn-mysql -o jsonpath="{.data.mysql-root-password}" | base64 --decode; echo)`
    ```
4. run vscode command: "AZDS prepare ..."
5. add vmArgs in "launch.json"
    `"vmArgs":  "-DMYSQL_HOST=${env:MYSQL_HOST} -DMYSQL_MYSQL_PASSWORD=${env:MYSQL_PASSWORD}"`       
6. start azds debug by F5
7. after starting up, please first sign up a new user and then login
8. change some line of code and F5 again, the new code will take effective.