#!/bin/bash

find dump -type f -name "*.json" -exec cat {} \; | jq -r '.["path"]' | grep -E "^/" | sort -uV -o pypotomux.lst


# Remove
grep -viF 'Nxrs4tAtO' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
grep -viF '/nmaplowercheck' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
grep -viF '/Nmap/folder' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
grep -viF '/NmapUpperCheck' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
grep -viF '/3000D00E0000' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
grep -viF '/204.48.20.180' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst


# Sanitize
grep -viF '/set_ftp.cgi?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'set_ftp.cgi?' >> pypotomux.lst
grep -viF '/setup.cgi?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'setup.cgi?' >> pypotomux.lst
grep -viF '/shell?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'shell?' >> pypotomux.lst
grep -viF '/owa/auth/logon.aspx?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'owa/auth/logon.aspx?' >> pypotomux.lst
grep -viF '/language/Swedish' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'language/Swedish' >> pypotomux.lst
grep -viF '/incl/image_test.shtml' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'incl/image_test.shtml' >> pypotomux.lst
grep -viF '/dns-query?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'dns-query?' >> pypotomux.lst
grep -viF '/cgi-bin/;' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'cgi-bin/;' >> pypotomux.lst
grep -viF '/cgi-bin/kerbynet?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'cgi-bin/kerbynet?' >> pypotomux.lst
grep -viF '/board.cgi?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'board.cgi?' >> pypotomux.lst
grep -viF '/restapps/applications.php?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'restapps/applications.php?' >> pypotomux.lst
grep -viF '/maint/modules/home/index.php?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'maint/modules/home/index.php?' >> pypotomux.lst
grep -viF '/include/makecvs.php?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'include/makecvs.php?' >> pypotomux.lst
grep -viF '/cgi-bin/gw.cgi?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'cgi-bin/gw.cgi?' >> pypotomux.lst
grep -viF 'cgi-bin/nobody/Search.cgi?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'cgi-bin/nobody/Search.cgi?' >> pypotomux.lst
grep -viF 'backupmgt/localJob.php?session=fail;id' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'backupmgt/localJob.php?session=fail;id' >> pypotomux.lst
grep -viF 'cgi-bin/masterCGI?ping=nomip&user=;id' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'cgi-bin/masterCGI?ping=nomip&user=;id' >> pypotomux.lst
grep -viF 'backupmgt/localJob.php' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'backupmgt/localJob.php?session=fail;id;' >> pypotomux.lst
grep -viF 'cgi-bin/masterCGI?ping=' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'cgi-bin/masterCGI?ping=nomip&user=;id;' >> pypotomux.lst


# Add# Add
echo '_fragment' >> pypotomux.lst
echo '::$DATA' >> pypotomux.lst
echo 'actuator' >> pypotomux.lst
echo 'actuator/auditevents' >> pypotomux.lst
echo 'actuator/beans' >> pypotomux.lst
echo 'actuator/conditions' >> pypotomux.lst
echo 'actuator/configprops' >> pypotomux.lst
echo 'actuator/env' >> pypotomux.lst
echo 'actuator/envinterfaces' >> pypotomux.lst
echo 'actuator/health' >> pypotomux.lst
echo 'actuator/heapdump' >> pypotomux.lst
echo 'actuator/heapdumpinterfaces' >> pypotomux.lst
echo 'actuator/httptrace' >> pypotomux.lst
echo 'actuator/hystrix.stream' >> pypotomux.lst
echo 'actuator/info' >> pypotomux.lst
echo 'actuator/jolokia' >> pypotomux.lst
echo 'actuator/jolokiainterfaces' >> pypotomux.lst
echo 'actuator/loggers' >> pypotomux.lst
echo 'actuator/mappings' >> pypotomux.lst
echo 'actuator/metrics' >> pypotomux.lst
echo 'actuator/refresh' >> pypotomux.lst
echo 'actuator/restart' >> pypotomux.lst
echo 'actuator/scheduledtasks' >> pypotomux.lst
echo 'actuator/threaddump' >> pypotomux.lst
echo 'amfeed/main/download' >> pypotomux.lst
echo 'api-docs' >> pypotomux.lst
echo 'api.html' >> pypotomux.lst
echo 'api/index.html' >> pypotomux.lst
echo 'api/swagger-ui.html' >> pypotomux.lst
echo 'api/v2/api-docs' >> pypotomux.lst
echo 'appenv' >> pypotomux.lst
echo 'article?id=${7*7}' >> pypotomux.lst
echo 'auditevents' >> pypotomux.lst
echo 'autoconfig' >> pypotomux.lst
echo 'beans' >> pypotomux.lst
echo 'caches' >> pypotomux.lst
echo 'cdn-cgi/trace' >> pypotomux.lst
echo 'conditions' >> pypotomux.lst
echo 'configprops' >> pypotomux.lst
echo 'configuration>' >> pypotomux.lst
echo 'debug/requests' >> pypotomux.lst
echo 'distv2/index.html' >> pypotomux.lst
echo 'docs' >> pypotomux.lst
echo 'dubbo-provider/distv2/index.html' >> pypotomux.lst
echo 'dump' >> pypotomux.lst
echo 'env' >> pypotomux.lst
echo 'envafter' >> pypotomux.lst
echo 'envinterface' >> pypotomux.lst
echo 'envor' >> pypotomux.lst
echo 'envSetting' >> pypotomux.lst
echo 'envsometimes' >> pypotomux.lst
echo 'envwill' >> pypotomux.lst
echo 'flyway' >> pypotomux.lst
echo 'h2-console' >> pypotomux.lst
echo 'h2-console/login.do' >> pypotomux.lst
echo 'h2-console/login.jsp' >> pypotomux.lst
echo 'health' >> pypotomux.lst
echo 'heapdump' >> pypotomux.lst
echo 'heapdumpor' >> pypotomux.lst
echo 'host-manager/html' >> pypotomux.lst
echo 'httptrace' >> pypotomux.lst
echo 'info' >> pypotomux.lst
echo 'intergrationgraph' >> pypotomux.lst
echo 'jkstatus' >> pypotomux.lst
echo 'jolokia' >> pypotomux.lst
echo 'jolokia/listlooking' >> pypotomux.lst
echo 'jolokia/listthe' >> pypotomux.lst
echo 'jolokiaor' >> pypotomux.lst
echo 'json' >> pypotomux.lst
echo 'liquibase' >> pypotomux.lst
echo 'local/config.txt' >> pypotomux.lst
echo 'logfile' >> pypotomux.lst
echo 'loggers' >> pypotomux.lst
echo 'magmi-importer/web/download_file.php' >> pypotomux.lst
echo 'magmi/web/download_file.php' >> pypotomux.lst
echo 'manage' >> pypotomux.lst
echo 'management' >> pypotomux.lst
echo 'manager/html' >> pypotomux.lst
echo 'manager/text/list' >> pypotomux.lst
echo 'mappings' >> pypotomux.lst
echo 'metrics' >> pypotomux.lst
echo 'product/list' >> pypotomux.lst
echo 'prometheus' >> pypotomux.lst
echo 'refresh' >> pypotomux.lst
echo 'refreshan' >> pypotomux.lst
echo 'refreshinterfaces' >> pypotomux.lst
echo 'restart' >> pypotomux.lst
echo 'restartrestart' >> pypotomux.lst
echo 'scheduledtasks' >> pypotomux.lst
echo 'sessions' >> pypotomux.lst
echo 'shutdown' >> pypotomux.lst
echo 'spring-security-oauth-resource/swagger-ui.html' >> pypotomux.lst
echo 'spring-security-rest/api/swagger-ui.html' >> pypotomux.lst
echo 'springboot-eureka-xstream-rce' >> pypotomux.lst
echo 'springboot-h2-database-rce' >> pypotomux.lst
echo 'springboot-jolokia-logback-rce' >> pypotomux.lst
echo 'springboot-mysql-jdbc-rce' >> pypotomux.lst
echo 'springboot-restart-rce' >> pypotomux.lst
echo 'springboot-spel-rce' >> pypotomux.lst
echo 'springcloud-snakeyaml-rce' >> pypotomux.lst
echo 'static/swagger.json' >> pypotomux.lst
echo 'sw/swagger-ui.html' >> pypotomux.lst
echo 'swagger-dubbo/api-docs' >> pypotomux.lst
echo 'swagger-ui.html' >> pypotomux.lst
echo 'swagger-ui' >> pypotomux.lst
echo 'swagger-ui/html' >> pypotomux.lst
echo 'swagger-ui/index.html' >> pypotomux.lst
echo 'swagger' >> pypotomux.lst
echo 'swagger/codes' >> pypotomux.lst
echo 'swagger/index.html' >> pypotomux.lst
echo 'swagger/static/index.html' >> pypotomux.lst
echo 'switch' >> pypotomux.lst
echo 'tatic/plugins/jquery-file-upload/' >> pypotomux.lst
echo 'template/swagger-ui.html' >> pypotomux.lst
echo 'threaddump' >> pypotomux.lst
echo 'trace' >> pypotomux.lst
echo 'user/swagger-ui.html' >> pypotomux.lst
echo 'v2/api-docs' >> pypotomux.lst
echo 'v2/swagger.json' >> pypotomux.lst
echo 'virtualjdbc/' >> pypotomux.lst
echo 'wp-admin/admin-ajax.php?action=ave_publishPost&title=random&short=1&term=1&thumb=../wp-config.php' >> pypotomux.lst
echo 'wp-admin/admin-ajax.php?action=duplicator_download&file=../wp-config.php' >> pypotomux.lst
echo 'wp-admin/admin-ajax.php?action=revslider_show_image&img=../wp-config.php' >> pypotomux.lst
echo 'wp-admin/admin-ajax.php' >> pypotomux.lst
echo 'wp-admin/admin-post.php?page=wpsm_responsive_coming_soon' >> pypotomux.lst
echo 'wp-content/plugins/cherry-plugin/admin/import-export/download-content.php?file=../../../../../wp-config.php' >> pypotomux.lst
echo 'x-www-form-urlencoded' >> pypotomux.lst


# Better formatting
sed -i -e "s#^/*##g" pypotomux.lst
sort -uV pypotomux.lst -o pypotomux.lst

echo "Sanitization done for known threats in pypotomux.lst BUT remember to check it MANUALLY as well"
echo "Potential risky payloads?"
cat pypotomux.lst | grep -viP "boaform/admin/form|GponForm/diag_Form|_cat/indices|phpMyAdmin-[\d]+\.[\d]+\.[\d]+\.[\d]+" | grep --color=always -P "rm|cd|curl|wget|[\d]+\.[\d]+\.[\d]+\.[\d]+"
