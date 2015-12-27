#!/bin/sh
cp -r /usr/tomcat7054/webapps2/sw/upsnimg  /usr/tomcat7054/
cp -r /usr/tomcat7054/webapps2/sw/upusrimg  /usr/tomcat7054/
cp -r /usr/tomcat7054/webapps2/sw/uprewardimg  /usr/tomcat7054/ 

-d1

---
#!/bin/sh
sudo rm -rf /usr/tomcat7054/webapps2/sw.war
sudo rm -rf /usr/tomcat7054/webapps2/sw
sudo mv /usr/tomcat7054/sw.war  /usr/tomcat7054/webapps2/sw.war

-d2
----
#!/bin/sh
sudo rm -rf /usr/tomcat7054/webapps/web1.war
sudo rm -rf /usr/tomcat7054/webapps/web1
sudo mv /usr/tomcat7054/web1.war  /usr/tomcat7054/webapps/web1.war

-d3

--
#!/bin/sh
sudo mv /usr/tomcat7054/upusrimg  /usr/tomcat7054/webapps2/sw/
sudo mv /usr/tomcat7054/upsnimg  /usr/tomcat7054/webapps2/sw/
sudo mv /usr/tomcat7054/uprewardimg  /usr/tomcat7054/webapps2/sw/

-d4
---

打开或新建：nano d1.sh
保存：Ctrl+O
退出：Ctrl+X


授权：chmod +x file.sh
执行：./d1.sh