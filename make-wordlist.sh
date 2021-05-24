#!/bin/bash

find dump/ -name "*.json" | xargs cat | jq -r '.["path"]' | grep -E "^/" | sort -uV -o paths.lst

# Remove
grep -viF 'Nxrs4tAtO' paths.lst > /tmp/paths.lst; mv /tmp/paths.lst paths.lst
grep -viF '/nmaplowercheck' paths.lst > /tmp/paths.lst; mv /tmp/paths.lst paths.lst
grep -viF '/Nmap/folder' paths.lst > /tmp/paths.lst; mv /tmp/paths.lst paths.lst
grep -viF '/NmapUpperCheck' paths.lst > /tmp/paths.lst; mv /tmp/paths.lst paths.lst

# Sanitize
grep -viF '/set_ftp.cgi?' paths.lst > /tmp/paths.lst; mv /tmp/paths.lst paths.lst
echo '/set_ftp.cgi?' >> paths.lst
grep -viF '/setup.cgi?' paths.lst > /tmp/paths.lst; mv /tmp/paths.lst paths.lst
echo '/setup.cgi?' >> paths.lst
grep -viF '/shell?' paths.lst > /tmp/paths.lst; mv /tmp/paths.lst paths.lst
echo '/shell?' >> paths.lst
grep -viF '/owa/auth/logon.aspx?' paths.lst > /tmp/paths.lst; mv /tmp/paths.lst paths.lst
echo '/owa/auth/logon.aspx?' >> paths.lst
grep -viF '/language/Swedish' paths.lst > /tmp/paths.lst; mv /tmp/paths.lst paths.lst
echo '/language/Swedish' >> paths.lst
grep -viF '/incl/image_test.shtml' paths.lst > /tmp/paths.lst; mv /tmp/paths.lst paths.lst
echo '/incl/image_test.shtml' >> paths.lst
grep -viF '/dns-query?' paths.lst > /tmp/paths.lst; mv /tmp/paths.lst paths.lst
echo '/dns-query?' >> paths.lst
grep -viF '/cgi-bin/;' paths.lst > /tmp/paths.lst; mv /tmp/paths.lst paths.lst
echo '/cgi-bin/;' >> paths.lst
grep -viF '/cgi-bin/kerbynet?' paths.lst > /tmp/paths.lst; mv /tmp/paths.lst paths.lst
echo '/cgi-bin/kerbynet?' >> paths.lst
grep -viF '/board.cgi?' paths.lst > /tmp/paths.lst; mv /tmp/paths.lst paths.lst
echo '/board.cgi?' >> paths.lst

sort -uV paths.lst -o paths.lst
echo "Sanitization done for known threats in paths.lst, remember to check it MANUALLY as well"