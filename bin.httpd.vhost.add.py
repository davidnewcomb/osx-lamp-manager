#!/usr/bin/env python

import os
import sys
from string import Template

OUT_FILE=sys.argv[1]
VHOST_ROOT_DIR = "/usr/local/var/www"
LOG_DIR = "/usr/local/var/log/httpd"

def ask_question(prompt, blank=""):
    m = prompt
    if blank != "":
        m += " [" + blank + "]: "
    else:
        m += "? "

    x = raw_input(m)
    if x == "":
        x = blank

    return x


server_name = ask_question("Host name", "example.com")
x = VHOST_ROOT_DIR + "/" + server_name
document_root = ask_question("Document root", x)
port = ask_question("Port", "8080")
x = "webmaster@" + server_name
server_admin = ask_question("Server admin", x)
x = LOG_DIR + "/" + server_name + "-error_log"
error_log = ask_question("Error log", x)
x = LOG_DIR + "/" + server_name + "-access_log"
custom_log = ask_question("Custom log", x)

template = """
<VirtualHost *:$port>
ServerAdmin $server_admin

DocumentRoot $document_root
<Directory />
Options Indexes MultiViews FollowSymLinks
AllowOverride all
Require all granted
</Directory>

ServerName $server_name
ErrorLog "$error_log"
CustomLog "$custom_log" common
</VirtualHost>
"""

factory = Template(template)

subed = factory.substitute(
    port = port,
    server_admin = server_admin,
    document_root = document_root,
    server_name = server_name,
    error_log = error_log,
    custom_log = custom_log
    )

print "-"
print subed
print "-"

x = 1
vhost_file = ''
while True:
    vhost_file = "vhost." + str(x)
    if os.path.exists(vhost_file) == False:
        break
    x += 1

with open(vhost_file, "w") as text_file:
    text_file.write(subed)

with open(OUT_FILE, "w") as text_file:
    text_file.write(server_name)

