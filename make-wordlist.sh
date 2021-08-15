#!/bin/bash

find dump/ -name "*.json" | xargs cat | jq -r '.["path"]' | grep -E "^/" | sort -uV -o pypotomux.lst


# Remove
grep -viF 'Nxrs4tAtO' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
grep -viF '/nmaplowercheck' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
grep -viF '/Nmap/folder' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
grep -viF '/NmapUpperCheck' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
grep -viF '/3000D00E0000' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
grep -viF '/204.48.20.180' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst


# Sanitize
grep -viF '/set_ftp.cgi?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo '/set_ftp.cgi?' >> pypotomux.lst
grep -viF '/setup.cgi?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo '/setup.cgi?' >> pypotomux.lst
grep -viF '/shell?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo '/shell?' >> pypotomux.lst
grep -viF '/owa/auth/logon.aspx?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo '/owa/auth/logon.aspx?' >> pypotomux.lst
grep -viF '/language/Swedish' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo '/language/Swedish' >> pypotomux.lst
grep -viF '/incl/image_test.shtml' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo '/incl/image_test.shtml' >> pypotomux.lst
grep -viF '/dns-query?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo '/dns-query?' >> pypotomux.lst
grep -viF '/cgi-bin/;' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo '/cgi-bin/;' >> pypotomux.lst
grep -viF '/cgi-bin/kerbynet?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo '/cgi-bin/kerbynet?' >> pypotomux.lst
grep -viF '/board.cgi?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo '/board.cgi?' >> pypotomux.lst
grep -viF '/restapps/applications.php?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo '/restapps/applications.php?' >> pypotomux.lst
grep -viF '/maint/modules/home/index.php?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo '/maint/modules/home/index.php?' >> pypotomux.lst
grep -viF '/include/makecvs.php?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo '/include/makecvs.php?' >> pypotomux.lst
grep -viF '/cgi-bin/gw.cgi?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo '/cgi-bin/gw.cgi?' >> pypotomux.lst
grep -viF 'cgi-bin/nobody/Search.cgi?' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'cgi-bin/nobody/Search.cgi?' >> pypotomux.lst
grep -viF 'backupmgt/localJob.php?session=fail;id' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'backupmgt/localJob.php?session=fail;id' >> pypotomux.lst
grep -viF 'cgi-bin/masterCGI?ping=nomip&user=;id' pypotomux.lst > /tmp/pypotomux.lst; mv /tmp/pypotomux.lst pypotomux.lst
echo 'cgi-bin/masterCGI?ping=nomip&user=;id' >> pypotomux.lst


# Add# Add
echo '_fragment' >> pypotomux.lst
echo '::$DATA' >> pypotomux.lst
echo '..;/_fragment' >> pypotomux.lst
echo '..;/actuator' >> pypotomux.lst
echo '..;/host-manager/html' >> pypotomux.lst
echo '..;/jkstatus' >> pypotomux.lst
echo '..;/jolokia' >> pypotomux.lst
echo '..;/local/config.txt' >> pypotomux.lst
echo '..;/manager/html' >> pypotomux.lst
echo '..;/manager/text/list' >> pypotomux.lst
echo '/wp-admin/admin-ajax.php?action=ave_publishPost&title=random&short=1&term=1&thumb=../wp-config.php' >> pypotomux.lst
echo '/wp-admin/admin-ajax.php?action=duplicator_download&file=../wp-config.php' >> pypotomux.lst
echo '/wp-admin/admin-ajax.php?action=revslider_show_image&img=../wp-config.php' >> pypotomux.lst
echo '/wp-admin/admin-ajax.php' >> pypotomux.lst
echo '/wp-admin/admin-post.php?page=wpsm_responsive_coming_soon' >> pypotomux.lst
echo '/wp-content/plugins/cherry-plugin/admin/import-export/download-content.php?file=../../../../../wp-config.php' >> pypotomux.lst
echo 'actuator' >> pypotomux.lst
echo 'amfeed/main/download' >> pypotomux.lst
echo 'host-manager/html' >> pypotomux.lst
echo 'jkstatus' >> pypotomux.lst
echo 'jolokia' >> pypotomux.lst
echo 'local/config.txt' >> pypotomux.lst
echo 'magmi-importer/web/download_file.php' >> pypotomux.lst
echo 'magmi/web/download_file.php' >> pypotomux.lst
echo 'manager/html' >> pypotomux.lst
echo 'manager/text/list' >> pypotomux.lst
echo 'tatic/plugins/jquery-file-upload/' >> pypotomux.lst


# Better formatting
sed -i -e "s#^/*##g" pypotomux.lst
sort -uV pypotomux.lst -o pypotomux.lst

echo "Sanitization done for known threats in pypotomux.lst BUT remember to check it MANUALLY as well"
echo "Potential risky payloads?"
cat pypotomux.lst | grep -viP "boaform/admin/form|GponForm/diag_Form|_cat/indices|phpMyAdmin-[\d]+\.[\d]+\.[\d]+\.[\d]+" | grep --color=always -P "rm|cd|curl|wget|[\d]+\.[\d]+\.[\d]+\.[\d]+"
